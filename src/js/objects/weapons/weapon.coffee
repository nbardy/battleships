new_projectile_type = require('./projectile.js')

closest = (position, targets) ->
  targets[0]

render = undefined
  # no render

update = (dt, state) ->
  # Cooldown counts up to rate to ready firing
  @cooldown = @cooldown - dt

  # Don't let cooldown go past zero
  if @cooldown < 0
    @cooldown = 0

  closest_ship = closest(@position, state.targetables)

  distance = 0

  # Fire projectile and reset cooldown
  if @cooldown == 0 and distance <= @range
    new_projectile =
      @fire_projectile
        x: @position.x
        y: @position.y
      ,
        closest_ship

    @cooldown = @rate
  
  # Return weapon plus any projectiles it fires
  # or just weapon if none are fired
  [this].concat(new_projectile || [])

# Options:(
#   range (in pixels)
#   rate (Rate of fire)
#   projectile
#     texture
#     speed
#     acceleration
module.exports = (options={}) ->
  (position={})->
    type: 'weapon'
    range: options.range || 50
    rate: options.rate || 10
    acceleration: options.acceleration || 0
    update: update

    cooldown: 0

    position:
      x: position.x || 0
      y: position.y || 0
    
    fire_projectile: new_projectile_type
      texture: options.projectile.texture
      speed: options.projectile.speed
      acceleration: options.projectile.acceleration
