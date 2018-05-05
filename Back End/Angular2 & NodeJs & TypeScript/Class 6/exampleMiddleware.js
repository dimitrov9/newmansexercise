var express = require('express');

var globalInterceptor = function (req, res, next) {
    console.log(`Global: Requested path: ${req.path}`);
    next();
};

var singleInterceptor = function (req, res, next) {
    req.query.name = "nikola";
    console.log(`Single: Requested path: ${req.path}`);
    next();
};

var app = express();

app.use(globalInterceptor);

app.get('/', function (req, res) {
    res.send('Some Data');
});

app.get('/second-link', singleInterceptor, function (req, res) {
    console.log(req.query.name);
    res.send('Some Other Data');
});


app.listen(3000);
console.log(`Server running on 3000 port, use localhost:3000`);