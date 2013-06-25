module.exports = (object) ->
  sprite = new PIXI.Sprite(object.texture)
  sprite.anchor.x = .5
  sprite.anchor.y = .5
  sprite.position.x = object.position.x
  sprite.position.y = object.position.y
  sprite.rotation = object.rotation
  sprite.width *= object.width
  sprite.height *= object.height

  # First frame is skipped bullet hasn't been rotated yet
  if object.rotation
    sprite
  else
    undefined
