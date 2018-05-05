var index = function (req, res) {
  res.render('comming_soon', {hideNavigation: true, hideFooter: true});
}

exports.index = index;
