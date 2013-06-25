module.exports = (ship) ->
  texture = PIXI.fromImage(ship.texture)
  sprite = new PIXI.Sprite(texture)
  sprite.anchor.x = .5
  sprite.anchor.y = .5
  sprite.position.x = ship.position.x
  sprite.position.y = ship.position.y
  
  sprite.width *= (ship.width  || 1)
  sprite.height *= (ship.height || 1)

  sprite
