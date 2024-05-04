const path = require('path');
const fs = require('fs');

const relevantProperties = ["http_reqs"];

function parseK6Log(k6Log) {
  const result = {};

  k6Log.split('\n').forEach((line) => {
    let [key, value] = line.split(':').map((entry) => entry.trim());
    key = key.replace(/\./g, '').trim();
    if (relevantProperties.includes(key)) {
      result[key] = value;
    }
  });

  return result;
}

const filePaths = [
  './benchmark-result/elixir_phoenix_server.log',
  './benchmark-result/go_gin_server.log',
  './benchmark-result/node_express_server.log',
  './benchmark-result/node_koa_server.log',
  './benchmark-result/node_fastify_server.log',
  './benchmark-result/node_elysia_server.log',
  './benchmark-result/node_hono_server.log',
  './benchmark-result/python_flask_server.log',
  './benchmark-result/rust_actix_server.log',
  './benchmark-result/rust_axum_server.log',
];
console.log('| Language | Framework | HTTP Requests | Average count (/sec) |');
console.log('|-----------|-----------|---------------|--------------------------|');

function prettify(size) {
  const s = size.toString();
  let result = [];
  let count = Math.ceil(s.length / 3) * 3;
  let offset = count - s.length;
  for(let i = 0; i < count / 3; i++) {
    let start = Math.max(i * 3 - offset, 0);
    let end = Math.max((i + 1) * 3 - offset, 0);
    result.push(s.slice(start, end));
  }
  return result.join(',');
}

const stats = filePaths.map(filePath => {
  const k6Log = fs.readFileSync(filePath).toString();
  const parsedData = parseK6Log(k6Log);
  const names = path.basename(filePath).split('_');
  const lang = names[0];
  const framework = names[1];
  const data = parsedData.http_reqs.split(' ').filter((text) => !!text);
  return {
    lang,
    framework,
    count: data[0],
    avg: data[1],
  };
});
stats.sort((s1, s2) => {
  return s2.count - s1.count;
});
stats.forEach(s => {
  console.log(`| ${s.lang} | ${s.framework} | ${prettify(s.count)} | ${s.avg} |`);
});

