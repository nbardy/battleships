new_weapon = require('../weapon.js')

laser_texture = "/img/laser.png"

# Create laser
module.exports =
  new_weapon
    range: 90
    rate: 0.1666666666666666
    projectile:
      texture: laser_texture
      speed: 250
      damage: 5
      acceleration: 0
      width: 13
      height: 4
