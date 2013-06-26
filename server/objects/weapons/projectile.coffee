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


update = (dt) ->
  # If target is destroyed while projectile is in route
  # send projectile to last position and dissapear on hit
  if @target?
    @last_target =
      position:
        x: @target.position.x
        y: @target.position.y
      hit: -> # Do nothing
  else
    @target = @last_target

  # Find vector in direction of motion
  diff = minus(@target.position, @position)
  distance = length diff

  invDist = 1 / distance
  direction = { x: diff.x * invDist, y: diff.y * invDist }

  # Update position
  @position.x += direction.x * @speed * dt
  @position.y += direction.y * @speed * dt
  @rotation = Math.atan2(direction.y, direction.x)

  # Hit on collision
  if distance < 20
    @target.hit(this)
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
    damage: options.damage || 1
    texture: options.texture
    anchor: options.anchor || { x: 0.5, y: 0.5 }
    target: target
    update: update

    position:
      x: position.x || 0
      y: position.y || 0
