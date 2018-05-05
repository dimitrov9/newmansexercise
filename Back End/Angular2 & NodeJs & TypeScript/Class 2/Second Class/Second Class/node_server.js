const http = require('http');
const port = 3000;
const hostname = '127.0.0.1';

const server = http.createServer(function(req, res) {
  console.log(req.url);
  var responseText = "";

  if(req.url === '/getPerson') {
    //    /getPerson/search/De
    responseText = 'Dejan';
  } else if(req.url === '/getTelephone') {
    responseText = '+389123456';
  } else {
    responseText = 'Cannot get ' + req.url;
  }
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end(responseText);

});

server.listen(port, hostname, () => {
  console.log(`Server is running at ${hostname}:${port}`);
});
