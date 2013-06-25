# Setup libs
app = require('express')()
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

gameUp = false

# Serve the game html
app.get '/game', (req, res) ->
  console.log 'game started'
  res.sendfile "#{__dirname}/client/index.html"

find_space = ->
  "default room"

io.sockets.on 'connection', (socket) ->
  gameServer.start (state)->
    socket.emit('update', state)
    console.log state.targetables[0].x
