// Require the framework and instantiate it
const fastify = require('fastify')({ logger: false })

// setup address and port
const host = "0.0.0.0";
const port = process.env.PORT || 8080;

// Declare a route
fastify.get('/', async (request, reply) => {
  return "Hello, World!";
})

// Run the server!
const start = async () => {
  try {
    await fastify.listen(port,host);
    console.log(`Listening on ${host} port ${port}`)
  } catch (err) {
    process.exit(1)
  }
}
start()
