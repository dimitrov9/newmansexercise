var express = require('express');
var session = require('express-session');

var app = express();


app.use(session({
    secret: 'My passphrase',
    resave: true,
    saveUninitialized: true
}));

app.get('/', function (req, res) {
    req.session.today = req.session.today || new Date().toUTCString();

    if (req.query.name) {
        req.session.name = req.query.name;
    }

    console.log(req.sessionID);
    res.send(`TODAY: ${req.session.today} \n Name: ${req.session.name}`);
});


app.listen(3000);
console.log(`Server running on 3000 port, use localhost:3000`);