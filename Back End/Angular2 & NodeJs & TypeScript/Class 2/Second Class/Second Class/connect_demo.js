var connect = require('connect');

var interceptor = function (req, res, next) {
    if (req.url !== '/favicon.ico')
        console.log(`Request for ${req.url}`);
    next();
};

var server = connect()
    .use('/log',interceptor)
    .use(function (req, res) {
        res.end('Hello from Connect!');
    })

server.listen(4000);