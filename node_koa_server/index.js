const Koa = require('koa');
const bodyParser = require('koa-bodyparser');
const Router = require('koa-router');

const app = new Koa();
const router = new Router();
app.use(bodyParser());

router
  .post('/api/v1/test', (ctx, next) => {
    ctx.body = {};
  });
app
  .use(router.routes())
  .use(router.allowedMethods());

const port = 3000;

app.listen(port);
