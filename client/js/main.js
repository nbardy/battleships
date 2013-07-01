// Create a Header
var header = document.createElement('h4')
header.innerHTML = "Battelships"
document.body.appendChild(header)

// Create main view context for rendering what is going on
// This will be passed and around and rendered in upon the 
// proper events
main_context = document.createElement('div')
document.body.appendChild(main_context)

if(typeof io == "undefined") {
  window.location.reload()
}

var socket =
    window.socket = io.connect("http://localhost:8080");

var lobby = require('./lobby')
window.lobby = lobby

var renderer = require('./renderer')

socket.on('open_games', function(data) {
  lobby.create(main_context, data)
})

// Check for first update to add viewport to main viewing elemtn
socket.on('game_start', function(data) {
  inGame = true
  // Set initial state
  var latest_state = {
    targetables: [],
    weapons: [],
    projectiles: []
  }

  var view = renderer.create(main_context)

  // wrapper function for getting latest_state
  fetch_state = function() {
    return latest_state
  }

  function update() {
    // Update game state
    state = fetch_state()

    // Render game state
    view.update(state)

    requestAnimFrame(update)
  }

  // When data is recieved from server set as lastest state
  socket.on('update', function(data) {
    latest_state = data
  })

  // Start Loop
  requestAnimFrame(update)
})
