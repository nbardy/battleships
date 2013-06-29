MAX_PLAYERS = 1
OPEN_GAMES = 9
# Setup libs
express = require('express')
app = express()
server = require('http').createServer(app)
io = require('socket.io').listen(server)
port = 8080
io.set('log level', 1)

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

current_id = 0

# Broadcast a state to multiple players
broadcast_state = (state, players) ->
  for player in players
    player.socket.emit('update', state)

joinGame = (id, player) ->
  if not player.game?
    open_games[id].add player
    player.game = open_games[id]
    true
  else
    false

newGame = ->
  id: current_id++
  players: []
  add: (player) ->
    # Add player to the list
    @players.push(player)
    console.log "added to", this

    # If game is full close and start the game
    if @players.length == MAX_PLAYERS
      @close()

      # Assign to socket group from game id
      gameTag = "game-#{@id}"
      for player in @players
        player.socket.join(gameTag)

      # Start the game
      io.sockets.in(gameTag).emit('game_start')

      # Broadcast state to all players on each iteration
      gameServer.start (state) ->
        io.sockets.in(gameTag).emit('update', state)

      # BUG: Not sure but I believe this helps to clear a closure
      # which is passed to a loop
      players = null

  close: ->
    # Remove from open game list
    delete open_games[@id] = null

    # Spawn game whenever one closes to remain balance
    spawnGame()

# A map of open games
#   id: game
#
#   Note: Starts with 1 open game by default
open_games = {}

spawnGame = ->
  open_games[current_id] = newGame()

# Creates the appropiate amount of initial open games
games_spawned = 0
while games_spawned++ < OPEN_GAMES
  spawnGame()

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
  socket.emit 'open_games', open_games
  console.log 'emitted open games', open_games

  # On join, join a game
  socket.on 'join', (id) ->
    joinGame id, player
