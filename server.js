// Generated by CoffeeScript 1.6.1
(function() {
  var app, find_space, gameServer, gameUp, io, port, server, url;

  app = require('express')();

  server = require('http').createServer(app);

  io = require('socket.io').listen(server);

  port = 8080;

  io.set('log level', 1);

  gameServer = require('./server/main.js');

  url = process.env.SUBDOMAIN != null ? "http://" + process.env.SUBDOMAIN + ".nodejitsu.com" : "http://localhost:" + port;

  server.listen(port);

  console.log("Express server listening on port " + port);

  console.log("At url:");

  console.log(url);

  gameUp = false;

  app.get('/game', function(req, res) {
    console.log('game started');
    return res.sendfile("" + __dirname + "/client/index.html");
  });

  find_space = function() {
    return "default room";
  };

  io.sockets.on('connection', function(socket) {
    return gameServer.start(function(state) {
      return socket.emit('update', state);
    });
  });

}).call(this);
