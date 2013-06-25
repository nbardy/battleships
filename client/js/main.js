var header = document.createElement('h4')
header.innerHTML = "Battelships"
document.body.appendChild(header)

var socket = io.connect("http://localhost:8080");

var renderer = require('./renderer')
var view = renderer.create()

var latest_state = {
  targetables: [],
  weapons: [],
  projectiles: []
}

socket.on('update', function(data) {
  latest_state = data
})

fetch_state = function() {
  return latest_state
}

// Start Loop
requestAnimFrame(update)

function update() {
  // Update game state
  state = fetch_state()

  // Render game state
  view.update(state)

  requestAnimFrame(update)
}
