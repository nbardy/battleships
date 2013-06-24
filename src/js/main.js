var header = document.createElement('h4')
header.innerHTML = "Battelships"
document.body.appendChild(header)

renderer = require('./renderer')
gameplay = require('./gameplay')
new_game = require('./new_game')

view = renderer.create()
state = new_game()

requestAnimFrame(update)

function update() {
  // Update game state
  state = gameplay.progress(state)

  // Render game state
  view.update(state)

  requestAnimFrame(update)
}
