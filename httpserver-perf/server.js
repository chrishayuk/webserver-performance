// imports
const http = require("http");

// setup some constants
const port = 8080;
const host = '0.0.0.0'

// listener
const requestListener =  (req, res) => {
    // plain text, success
    res.setHeader("Content-Type", "text/plain");
    res.writeHead(200);

    // hello world
    res.end('Hello, World!');
};

// create the server
const server = http.createServer(requestListener);

// spin it up
server.listen(port, host, () => {
    console.log(`Server is running on http://${host}:${port}`);
});

