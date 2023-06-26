const httpProxy = require('express-http-proxy');
const express = require('express');
const app = express();
var logger = require('morgan');
const cors = require("cors");

const authService = require('./src/services/auth-token');
const auth = require('./src/services/auth')

app.use(cors());
app.use(express.json());
app.use(logger('dev'));

const conn = require('./src/db/connDB');
conn();

const routers = require("./src/routers/router");
app.use('/', routers);

function selectProxyHost(req, res) {
    authService.checkToken(req, res);
    if (req.path.startsWith('/api'))
        return 'http://localhost:3001/api';
    else if (req.path.startsWith('/ws'))
        return 'http://localhost:3002/';
}

app.use((req, res, next) => {
    if (!req.path.startsWith('/auth'))
        httpProxy(selectProxyHost(req, res))(req, res, next);
    else 
    console.log('teste')
});


app.listen(8080, () => {
    console.log('API Gateway running!');
});