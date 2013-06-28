new_weapon = require('../weapon.js')

texture = "/img/short-bullet.png"

# Create cannon
module.exports =
  new_weapon
    range: 400
    rate: 5
    projectile:
      texture: texture
      speed: 630
      acceleration: 0
      damage: 7.5
      width: .5
      height: .5
