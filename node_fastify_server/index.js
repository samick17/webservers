const Fastify = require('fastify');

const fastify = Fastify({
  logger: false
})
// // CommonJs
// const fastify = require('fastify')({
//   logger: true
// });

// Declare a route
fastify.post('/api/v1/test', function (request, reply) {
  reply.send({})
});

const port = 3000;

// Run the server!
fastify.listen({ port: port }, function (err, address) {
  if (err) {
    fastify.log.error(err)
    process.exit(1)
  }
  // Server is now listening on ${address}
});
