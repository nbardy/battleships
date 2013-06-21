var header = document.createElement('h4')
header.innerHTML = "truck"
document.body.appendChild(header)

renderer = require('./renderer.js')
gameplay = require('./gameplay.js')

view = renderer.create()
state = gameplay.create()

requestAnimFrame(update)

function update() {
  // Update game state
  state = gameplay.progress(state)

  // Render game state
  view.update(state)

  requestAnimFrame(update)
}
