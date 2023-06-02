const httpProxy = require('express-http-proxy');
const express = require('express');
const app = express();
var logger = require('morgan');
 
app.use(logger('dev'));
 
function selectProxyHost(req) {
    if (req.path.startsWith('/api'))
        return 'http://localhost:3001/api';    
    else if (req.path.startsWith('/ws'))
        return 'http://localhost:3002/';
}
 
app.use((req, res, next) => {
    httpProxy(selectProxyHost(req))(req, res, next);
});
 
app.listen(8080, () => {
    console.log('API Gateway running!');
});