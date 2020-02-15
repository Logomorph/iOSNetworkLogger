var ip = require("ip");
console.log(`NetworkLogger started at ${ip.address()}:8080`);
var http = require('http');
http.createServer(function (req, res) {
	req.on('data', chunk => {
    console.log(`${getTime()} - ${chunk}`)
  })
  req.on('end', () => {
    //end of data
  })
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.end();
}).listen(8080);

function getTime() {
	return new Date().toISOString().replace(/T/, ' ')
}