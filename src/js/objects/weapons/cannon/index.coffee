new_weapon = require('../weapon.js')

texture = PIXI.Texture.fromImage("short-bullet.png")

# Create cannon
module.exports =
  new_weapon
    range: 400
    rate: 15
    projectile:
      texture: texture
      speed: 60
      acceleration: 0
      width: .5
      height: .5
