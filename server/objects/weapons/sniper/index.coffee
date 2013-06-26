new_weapon = require('../weapon.js')

texture = "/img/long-bullet.png"

# Create Sniper
module.exports =
  new_weapon
    range: 1000
    rate: 4
    projectile:
      texture: texture
      speed: 600
      acceleration: 0
      damage: 100
      width: .3
      height: .2
