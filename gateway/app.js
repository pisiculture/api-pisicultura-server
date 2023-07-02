const httpProxy = require('express-http-proxy');
const express = require('express');
const app = express();
var logger = require('morgan');
const cors = require("cors");

app.use(cors());
app.use(express.json());
app.use(logger('dev'));

const conn = require('./src/db/connDB');
conn();

const routers = require("./src/routers/router");
app.use('/', routers);

const authService = require('./src/services/auth-token');

function selectProxyHost(req, res) {
    if (req.path.startsWith('/api')) {
        authService.checkToken(req, res);
        return 'http://api:3001/';
    } else if (req.path.startsWith('/')) {
        return 'http://ws:3002/';
    }
}

app.use((req, res, next) => {
    if (!req.path.startsWith('/auth'))
        httpProxy(selectProxyHost(req, res))(req, res, next);
    return
});


app.listen(3000, () => {
    console.log('API Gateway running!');
});