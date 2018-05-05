var details = function (req, res) {
  res.render('blog/blog-details');
}

var blogMasonry = function (req, res) {
  res.render('blog/blog-masonry');
}

exports.details = details;
exports.blogMasonry = blogMasonry;
