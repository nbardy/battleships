module.exports = (ship) ->
  sprite = new PIXI.Sprite(ship.texture)
  sprite.anchor.x = .5
  sprite.anchor.y = .5
  sprite.position.x = ship.position.x
  sprite.position.y = ship.position.y
  
  sprite.width *= (ship.width  || 1)
  sprite.height *= (ship.height || 1)

  sprite
