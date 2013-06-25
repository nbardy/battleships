//120 frams per second
var RENDER_DELAY = 1000/120

gameplay = require('./gameplay')
new_game = require('./new_game/basic')

var state = new_game()

var lastTime = Date.now()

start_game_loop = function(callback) {
  function loop() {
    var currentTime = Date.now()
    var delta_time = currentTime - lastTime
    lastTime = currentTime

    state = gameplay.progress(state, delta_time)

    // If a callback was passed call it
    if(callback) {
      callback()
    }

    return setTimeout(loop, DELAY)
  }

  return loop()
}

function update() {
  // Update game state
  state = gameplay.progress(state)

  // Render game state
  view.update(state)

  requestAnimFrame(update)
}

module.exports = start_game_loop 
