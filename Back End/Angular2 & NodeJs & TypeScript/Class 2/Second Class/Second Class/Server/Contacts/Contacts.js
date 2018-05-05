var index = function (req, res) {
    res.end('Welcome to my contacts page');
};

var myContact = function (req, res) {
    res.end(`Here is the contact with id ${req.params.id}`);
};

var editMyContact = function (req, res) {
    res.end(`Edit contact with id ${req.params.id}`);
};

exports.index = index;
exports.myContact = myContact;
exports.editMyContact = editMyContact;