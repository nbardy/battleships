new_projectile_type = require('./projectile.js')

render = ->
  # no render

update = (dt, state) ->
  # Cooldown counts up to rate to ready firing
  if @cooldown < @rate
    @cooldown = @cooldown + dt

  closet_ship = closest(ships)

  # Fire projectile and reset cooldown
  if @cooldown >= @rate and distance <= @range
    new_projectile = @fire_projectile
      position:
        x: @position.x
        y: @position.y
    @cooldown = @cooldown - @rate
  
  [this, new_projectile]

# Options:(
#   range (in pixels)
#   rate (Rate of fire)
#   projectile
#     texture
#     speed
#     acceleration
module.exports = (options) ->
  (position)->
    type: 'weapon'
    range: options.range || 50
    rate: options.rate || 10
    acceleration: options.acceleration || 0
    render: render

    position:
      x: position.x || 0
      y: position.y || 0
    
    fire_projectile: new_projectile_type
      texture: options.projectile.texture
      speed: options.projectile.speed
      acceleration: options.projectile.acceleration
