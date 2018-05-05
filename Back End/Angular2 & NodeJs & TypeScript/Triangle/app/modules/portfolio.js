var details = function (req, res) {
  res.render('portfolio/portfolio-details');
}

var portfolioIsotope = function (req, res) {
  res.render('portfolio/portfolio-isotope');
}

exports.details = details;
exports.portfolioIsotope = portfolioIsotope;
