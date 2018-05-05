// import server and view engine
var express = require('express');
var handlebars = require('express-handlebars');
var bodyParser = require('body-parser');
var multer = require('multer');

// import the application modules. These are our own methods for handling responses.
var home = require('./app/modules/home');
var pricing = require('./app/modules/pricing');
var shortcodes = require('./app/modules/shortcodes');
var aboutUs = require('./app/modules/aboutus'); 
var services = require('./app/modules/services');
var contactUs = require('./app/modules/contactus');
var commingSoon = require('./app/modules/comming-soon');
var blog = require('./app/modules/blog');
var portfolio = require('./app/modules/portfolio');

// set the port and instatiate the new server app
var port = 3000;
var app = express();

// configure the view engine
var handlebarsEngine = handlebars.create({
  defaultLayout: '_main',
  partialsDir: 'app/views/partials',
  layoutsDir: 'app/views/layouts',
  extname: '.hbs',
  helpers: { }
});

var uploadHandler = multer({dest: 'uploads/'});

// to use a different excension, the engine name, must be the same as the extension
app.engine('hbs', handlebarsEngine.engine);
app.set('view engine', 'hbs');
app.set('views', 'app/views/pages/');


app.use(express.static(__dirname + '/app/assets')); // this contains the assets (JavaScripts for the Browser, CSS, images)
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());
app.get('/pages/pricing', pricing.index);
app.get('/pages/services', services.index);
app.get('/pages/contact', contactUs.index);
app.get('/pages/about-us', aboutUs.index);
app.get('/pages/comming-soon', commingSoon.index);

app.get('/blog/blog-masonry', blog.blogMasonry);
app.get('/blog/blog-details', blog.details);

app.get('/portfolio/portfolio-details', portfolio.details);
app.get('/portfolio/portfolio-isotope', portfolio.portfolioIsotope);

app.get('/shortcodes', shortcodes.index);
app.get('/home', home.index);

app.post('/home', uploadHandler.single('myPicture'), function(req, res) {
  console.log(req.body);
  console.log(req.file);
  // if extension is not img, delete the file
  // rename the file with extension
  res.render('home', {postData: JSON.stringify(req.body)});
});

app.get('/get-file', function(req, res) {
  if (req.query.attachment === "true") {
    res.download(__dirname + "\\uploads\\" + req.query.filename);
  } else {
    res.sendFile(__dirname + "\\uploads\\" + req.query.filename);
  }
});

app.get('/my-data', function(req, res) {
  var data = {
    merchant: {
      name: "McDonalds",
      mascot: "Clown"
    }
  };
  res.format({
    html: function() { res.render('contactus');},
    json: function() { res.json(data); }
  });
});

app.get('*', function(req, res) {
  res.status(404).render('404', {hideFooter: true});
});

app.listen(port, () => {
  console.log(`Server started on port ${port}`);
});
