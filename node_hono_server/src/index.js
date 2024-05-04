import { Hono } from 'hono';

const app = new Hono();

app.post('/api/v1/test', (c) => {
  return c.json({})
})

export default app;
