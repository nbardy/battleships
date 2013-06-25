var header = document.createElement('h4')
header.innerHTML = "Battelships"
document.body.appendChild(header)

gameplay = require('./gameplay')
new_game = require('./new_game')

state = new_game()

requestAnimFrame(update)

function update() {
  // Update game state
  state = gameplay.progress(state)

  requestAnimFrame(update)
}
