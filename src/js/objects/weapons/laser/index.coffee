new_weapon = require('../weapon.js')

laser_texture = PIXI.Texture.fromImage("laser.png")

# Create laser
module.exports =
  new_weapon
    range: 90
    rate: 0.1
    projectile:
      texture: laser_texture
      speed: 75
      acceleration: 0
      width: 6
      height: 4
