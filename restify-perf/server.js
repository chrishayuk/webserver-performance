var restify = require('restify');

// respond
const respond = (req, res, next) => {
  res.send('Hello, World!');
  next();
}

// create server
var server = restify.createServer();
server.get('/', respond);

// listen
server.listen(3000, () => {
  console.log('%s listening at %s', server.name, server.url);
});