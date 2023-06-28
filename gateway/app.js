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
    authService.checkToken(req, res);
    if (req.path.startsWith('/api'))
        return 'http://api/';
    else if (req.path.startsWith('/ws'))
        return 'http://ws/';
}

app.use((req, res, next) => {
    if (!req.path.startsWith('/auth'))
        httpProxy(selectProxyHost(req, res))(req, res, next);
    return
});


app.listen(3000, () => {
    console.log('API Gateway running!');
});