new_weapon = require('../weapon.js')

texture = "/img/sharknado.png"

# Create laser
module.exports =
  new_weapon
    range: 900
    rate: 2
    projectile:
      texture: texture
      speed: 12
      acceleration: .1
      damage: 10
      width: .5
      height: .7
