//120 frams per second
var RENDER_DELAY = 1000/120

gameplay = require('./gameplay')
basic_new_game = require('./new_game/basic')

var state = basic_new_game()

var lastTime = Date.now()

start_game_loop = function(callback) {
  function loop() {
    var currentTime = Date.now()
    var delta_time = currentTime - lastTime
    lastTime = currentTime

    state = gameplay.progress(state, delta_time)

    // If a callback was passed call it
    if(callback) {
      callback(state)
    }

    return setTimeout(loop, RENDER_DELAY)
  }

  return loop()
}

module.exports = {
  start: start_game_loop 
}
