var express = require('express');
var auth = require('http-auth');

var basic = auth.basic({
    realm: "SOME SECRET STUFF",
    file: __dirname + '\\user_pass.pass',
    msg401: "You shall not pass!"
},
    //function (user, pass, callback) {
    //    //some logic if the user is authenticated
    //    //console.log()
    //    callback(user === pass);
    //    //callback(user === 'admin' && pass === '123');
    //}
);

var app = express();

app.use(auth.connect(basic));

app.get('/', /*auth.connect(basic),*/ function (req, res) {

    res.send('Logged IN');
});

app.get('/other',function (req, res) {
    console.log(`other`);
    res.send('other');
});

//var errorHandler = (err, req, res, next) => {
//    // handle the eroor
//    res.error(`ERRORRRRR`);
//}


app.listen(3000);
console.log(`Server running on 3000 port, use localhost:3000`);