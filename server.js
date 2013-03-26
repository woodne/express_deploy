#!/usr/bin/env node

var express = require('express')
  , path = require('path')
  , http = require('http');

var app = express();

app.configure(function () {
    app.set('port', process.env.PORT || 3000);
    app.use(express.bodyParser())
});

app.get('/', function(req, res) {
    var body = 'Hello World';
    res.setHeader('Content-Type', 'text/plain');
    res.setHeader('Content-Length', body.length);
    res.end(body);
});

http.createServer(app).listen(app.get('port'));
console.log('Express server listening on port ' + app.get('port'));
