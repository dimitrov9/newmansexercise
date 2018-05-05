var express = require('express');

var notFound = (req, res, next) => {
    res.send('Woah,the page does not exist. Go back');
};

var errorHandler = (err, req, res, next) => {
    res.send("this is embarasing.idont know what happend");
};

var app = express();

app.get('/', function (req, res) {
    res.send('This is a valid request');
});

app.get('/error', function (req, res) {
    res.InvalidMethodCall();
    res.send('This is a valid request');
});

app.use(notFound);
app.use(errorHandler);

app.listen(3000);
console.log(`Server running on 3000 port, use localhost:3000`);