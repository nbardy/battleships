# Setup libs
app = require('express')()
server = require('http').createServer(app)
io = require('socket.io').listen(server)
port = 8080

url = if process.env.SUBDOMAIN?
  "http://#{process.env.SUBDOMAIN}.nodejitsu.com"
else
  "http://localhost:#{port}"

server.listen port
console.log "Express server listening on port #{port}"
console.log url

gameUp = false

update = (data,dt) ->
  i: data.i + 1

joinGame = (socket) ->
  socket.join 'game'

  unless gameUp
    gameUp = true
    data = { i: 0 }
    lastTime = Date.now()
    (loop_call = ->
      currentTime = Date.now()
      dt = currentTime - lastTime
      lastTime = currentTime
      data = update(data , dt)
      io.sockets.in('game').emit('update', {i: data.i, dt: dt})
      setTimeout(loop_call, 1000 / 120))()

find_space = ->
  "default room"

# Serve the game html
app.get '/game', (req, res) ->
  console.log 'game started'
  res.sendfile "#{__dirname}/client/index.html"

io.sockets.on 'connection', (socket) ->
  joinGame(socket)
