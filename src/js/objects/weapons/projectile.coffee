# current tests show no performance gain
# with floating point bit tricks for inverse sqrt
invSqrt = (x) ->
  1 / Math.sqrt(x)

length = (vec1) ->
  Math.sqrt(Math.pow(vec1.x,2) + Math.pow(vec1.y,2))

minus = (vec1, vec2) ->
  { x: vec1.x - vec2.x, y: vec1.y - vec2.y }

# Normalize vector by dividing by length
normalize = (vec) ->
  val = Math.pow(vec.x, 2) + Math.pow(vec.y, 2)
  scale = invSqrt(val)
  {x: vec.x * scale, y: vec.y * scale}

render = ->
  sprite = new PIXI.Sprite(@texture)
  sprite.anchor.x = .5
  sprite.anchor.y = .5
  sprite.position.x = @position.x
  sprite.position.y = @position.y
  sprite.rotation = @rotation
  sprite.width *= @width
  sprite.height *= @height

  # First frame is skipped bullet hasn't been rotated yet
  if @rotation
    sprite
  else
    undefined

update = (dt) ->
  # Find vector in direction of motion
  diff = minus(@target.position, @position)
  distance = length diff

  invDist = 1 / distance
  direction = { x: diff.x * invDist, y: diff.y * invDist }

  # Update position
  @position.x += direction.x * @speed * dt
  @position.y += direction.y * @speed * dt
  @rotation = Math.atan2(direction.y, direction.x)

  if distance < 20
    return []
  else
    return this

# Options:(
#   speed
#   acceleration
#   texture
module.exports = (options={}) ->
  (position, target) ->
    type: 'projectile'
    acceleration: options.acceleration || 0
    speed: options.speed || 1
    width: options.width || 1
    height: options.height || 1
    texture: options.texture
    render: render
    target: target
    update: update

    position:
      x: position.x || 0
      y: position.y || 0
