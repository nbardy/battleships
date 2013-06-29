module.exports = (ship) ->
  texture = PIXI.Texture.fromImage(ship.texture)
  sprite = new PIXI.Sprite(texture)
  sprite.anchor.x = .5
  sprite.anchor.y = .5
  sprite.position.x = ship.position.x
  sprite.position.y = ship.position.y
  
  sprite.width *= (ship.width  || 1)
  sprite.height *= (ship.height || 1)

  [sprite, render_health_bar(ship, sprite)]

# Length of full health bars in pixels
FULL_LENGTH = 40
HEIGHT = 7
VERTICAL_OFFSET = -14 # Offset from top of ship
HORIZONTAL_OFFSET = - FULL_LENGTH / 2

render_health_bar = (ship,ship_sprite) ->
  texture = PIXI.Texture.fromImage("/img/laser.png")
  sprite = new PIXI.Sprite(texture)
  sprite.height = HEIGHT
  sprite.anchor.x = 0
  sprite.anchor.y = 0
  sprite.width = ship.health / ship.max_health * FULL_LENGTH
  sprite.position.x = ship_sprite.position.x + HORIZONTAL_OFFSET
  sprite.position.y = ship_sprite.position.y - sprite.height + VERTICAL_OFFSET

  sprite
