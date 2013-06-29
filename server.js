// Generated by CoffeeScript 1.6.1
(function() {
  var MAX_PLAYERS, OPEN_GAMES, app, broadcast_state, createPlayer, current_id, express, gameServer, games_spawned, io, joinGame, newGame, open_games, player_id, port, server, spawnGame, url;

  MAX_PLAYERS = 1;

  OPEN_GAMES = 9;

  express = require('express');

  app = express();

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

  app.get('/', function(req, res) {
    console.log('game started');
    return res.sendfile("" + __dirname + "/client/build/index.html");
  });

  app.get('/index.js', function(req, res) {
    return res.sendfile("" + __dirname + "/client/build/index.js");
  });

  app.use("/img", express["static"]("" + __dirname + "/img"));

  current_id = 0;

  broadcast_state = function(state, players) {
    var player, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = players.length; _i < _len; _i++) {
      player = players[_i];
      _results.push(player.socket.emit('update', state));
    }
    return _results;
  };

  joinGame = function(id, player) {
    if (player.game == null) {
      open_games[id].add(player);
      player.game = open_games[id];
      return true;
    } else {
      return false;
    }
  };

  newGame = function() {
    return {
      id: current_id++,
      players: [],
      add: function(player) {
        var gameTag, players, _i, _len, _ref;
        this.players.push(player);
        console.log("added to", this);
        if (this.players.length === MAX_PLAYERS) {
          this.close();
          gameTag = "game-" + this.id;
          _ref = this.players;
          for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            player = _ref[_i];
            player.socket.join(gameTag);
          }
          io.sockets["in"](gameTag).emit('game_start');
          gameServer.start(function(state) {
            return io.sockets["in"](gameTag).emit('update', state);
          });
          return players = null;
        }
      },
      close: function() {
        delete (open_games[this.id] = null);
        return spawnGame();
      }
    };
  };

  open_games = {};

  spawnGame = function() {
    return open_games[current_id] = newGame();
  };

  games_spawned = 0;

  while (games_spawned++ < OPEN_GAMES) {
    spawnGame();
  }

  player_id = 0;

  createPlayer = function(socket) {
    return {
      id: player_id++,
      socket: socket
    };
  };

  io.sockets.on('connection', function(socket) {
    var player;
    player = createPlayer(socket);
    socket.emit('open_games', open_games);
    console.log('emitted open games', open_games);
    return socket.on('join', function(id) {
      return joinGame(id, player);
    });
  });

}).call(this);
