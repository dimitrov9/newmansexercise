let app = require('express')();
let port = 4000;

app.get('/', (req, res) => {
  res.setHeader('Content-Type', 'text/html');
  res.setHeader('Cache-Control', 'max-age=30');
  res.send('<div style="color:red">Hello World!</div>');
});

app.get('/getName', (req, res) => {
  res.send('Hello Dejan!');
});

app.get('/getTelephone', (req, res) => {
  res.send('Your number is +389123456!');
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
})
