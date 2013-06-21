render = ->
  sprite = new PIXI.Sprite(@texture)
  sprite.anchor.x = .5
  sprite.anchor.x = .5
  sprite.position.x = @position.x
  sprite.position.y = @position.y

update = (dt) ->
  destx = @target.position.x
  desty = @target.position.y

  curx = @position.x
  cury = @position.y

  diffx = destx - curx
  diffy = desty - curx
  total = diffx + diffy

# Options:(
#   speed
#   acceleration
#   texture
module.exports = (options) ->
  (position)->
    type: 'projectile'
    acceleration: options.acceleration || 0
    speed: options.speed
    texture: options.texture
    render: render
    update: update

    position:
      x: position.x || 0
      y: position.y || 0
