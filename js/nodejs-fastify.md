# Fastify

- [Fastify](https://fastify.dev/) is [fast](https://fastify.dev/benchmarks/) express alternative with good API.

Uses [fast logger pino](https://github.com/pinojs/pino/blob/master/docs/benchmarks.md).

## Typescript

- [TypeScript | Fastify](https://fastify.dev/docs/latest/Reference/TypeScript/)

```ts
server.get<{
  Querystring: IQuerystring,
  Headers: IHeaders,
  Reply: IReply
}>('/auth', async (request, reply) => {
  const { username, password } = request.query
  const customerHeader = request.headers['h-Custom']
  // do something with request data

  // chaining .statusCode/.code calls with .send allows type narrowing. For example:
  // this works
  reply.code(200).send({ success: true });
  // but this gives a type error
  reply.code(200).send('uh-oh');
  // it even works for wildcards
  reply.code(404).send({ error: 'Not found' });
  return `logged in!`
})
```