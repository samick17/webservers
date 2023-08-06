const express = require('express');

const app = express();

app.post('/api/v1/test', (req, res) => {
	res.json({});
});

const port = 3000;

app.listen(port, '127.0.0.1', () => {

});
