var express = require('express');
var cookieParser = require('cookie-parser');

var app = express();

app.use(cookieParser());

app.get('/', function (req, res) {
    if (req.cookies.hasBeenHereBefore === 'yes') {
        res.send('You have been here before');
    } else {
        var now = new Date();
        res.cookie("hasBeenHereBefore", 'yes');
        res.cookie('myName', 'Nikola', {
            expires: new Date(now.getTime() + 5 * 60000)
    });
        res.send("This is your first time here");
    }
});

app.get('/no-cookie', function (req, res) {
    res.end('this page does not use cookies');
});

app.get('/clear-cookie', function (req, res) {
    var now = new Date();
    res.cookie('myName', 'Nikola', {
        expires: new Date(now.getTime() - 1)
    });
    res.end("Cookie cleared");
});

app.listen(3000);
console.log(`Server running on 3000 port, use localhost:3000`);