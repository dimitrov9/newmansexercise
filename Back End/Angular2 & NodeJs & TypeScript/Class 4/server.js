var express = require('express');
var hbseng = require('express-handlebars');

var port = 3000;
var app = express();

app.engine('handlebars', hbseng({
    defaultLayout: '_main',
    partialsDir: 'views/partials',
    helpers: {
        foo: () => { return "foo!!"; },
        upper: (text) => { return text.toUpperCase(); }
    }
}));
app.set('view engine', 'handlebars');

app
    .use('/home', (req, res) => {
        res.render('home');
    })
    .use('/contact', (req, res) => {
        var data = {
            people: [
                { firstName: "yehuda", lastName: "Katz", phone: 345 },
                { firstName: "nikola", lastName: "Dimitrov" },
                { firstName: "marko", lastName: "James" }
            ]
        };
        res.render('contacts/contact', data);
    })
    .use(function (req, res) {
        res.render('home');
    });

app.listen(port, function () {
    console.log(`Server started on port ${port}`);
});
