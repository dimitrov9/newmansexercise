let app = require('express')();
let port = 4000;

let home = require('./Home/Home.js');
let contacts = require("./Contacts/Contacts.js");


app.get('/', home.index);
app.get('/contacts', contacts.index);
app.get('/contacts/:id', contacts.myContact);
app.get('/contacts/:id/edit', contacts.editMyContact);

app.listen(port);