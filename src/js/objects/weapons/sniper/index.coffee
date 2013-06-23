new_weapon = require('../weapon.js')

texture = PIXI.Texture.fromImage("long-bullet.png")

# Create laser
module.exports =
  new_weapon
    range: 900
    rate: 13
    projectile:
      texture: texture
      speed: 125
      acceleration: 0
      damage: 100
      width: .2
      height: .4
