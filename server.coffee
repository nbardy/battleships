MAX_PLAYERS = 2
OPEN_GAMES = 9
# Setup libs for server
express = require('express')
app = express()
server = require('http').createServer(app)
io = require('socket.io').listen(server)
port = 8080
io.set('log level', 1)

# require local libs
lobby = require('./lib/lobby')
gameServer = require('./server/main.js')

url = if process.env.SUBDOMAIN?
  "http://#{process.env.SUBDOMAIN}.nodejitsu.com"
else
  "http://localhost:#{port}"

server.listen port
console.log "Express server listening on port #{port}"
console.log "At url:"
console.log url

# Serve the game html
app.get '/', (req, res) ->
  console.log 'game started'
  res.sendfile "#{__dirname}/client/build/index.html"

# Server the game javascript
app.get '/index.js', (req, res) ->
  res.sendfile "#{__dirname}/client/build/index.js"

app.use "/img", express.static("#{__dirname}/img")

# Starts game with the given players
start_game = (players) ->
  # Assign to socket group from game id
  gameTag = "game-#{@id}"
  for player in players
    # Add to game group and remove from lobby
    player.socket.leave('lobby')
    player.socket.join(gameTag)

  # Start the game
  io.sockets.in(gameTag).emit('game_start')

  # Broadcast state to all players on each iteration
  gameServer.start (state) ->
    io.sockets.in(gameTag).emit('update', state)

# Creates lobby and pass the start game callback for full lobbies
lobby = lobby.create
  on_full: start_game

prettify_games = (open_games) ->
  console.log 'pretty', open_games
  for id, game of open_games
    id: id
    players: game.persons.length


# Creates a new player from a socket
player_id = 0
createPlayer = (socket) ->
  id: player_id++
  socket: socket

# Recieving new connection
io.sockets.on 'connection', (socket) ->
  # Assign every socket a player object
  player = createPlayer socket

  # Tell new connections about open games
  socket.join 'lobby'
  console.log "emitting open", prettify_games(lobby.open_groups)
  socket.emit 'open_games', prettify_games(lobby.open_groups)


  # On join, join a game
  socket.on 'join', (id) ->
    console.log "emitting open post join", prettify_games(lobby.open_groups)
    lobby.group(id).add(player)
    io.sockets.in('lobby').emit 'open_games', prettify_games(lobby.open_groups)
