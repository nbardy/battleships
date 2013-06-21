new_weapon = require('../weapon.js')

laser_texture = PIXI.Texture.fromImage("laser.png")

# Create laser
module.exports =
  new_weapon
    range: 100
    rate: 1
    projectile:
      texture: laser_texture
      speed: 0.2
      acceleration: 0
