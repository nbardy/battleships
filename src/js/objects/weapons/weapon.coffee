new_projectile_type = require('./projectile.js')

distance = (item1,item2) ->
  xpart = Math.pow(item1.position.x - item2.position.x, 2)
  ypart = Math.pow(item1.position.y - item2.position.y, 2)
  Math.sqrt(xpart + ypart)

closest = (launcher, targets) ->
  closest_distance = Number.MAX_VALUE

  for target in targets
    this_distance = distance(launcher,target)
    is_closer = this_distance < closest_distance

    # Make sure launcher is not fire on itself if it is
    # attached to something
    is_not_attached = !(launcher.attached_to == target)

    if is_closer and is_not_attached
      closest_target = target
      closest_distance = this_distance

  closest_target

render = undefined
  # no render

update = (dt, state) ->
  if (@attached_to? && @attached_to.health) <= 0
    return []
  # Cooldown counts up to rate to ready firing
  @cooldown = @cooldown - dt

  # Don't let cooldown go past zero
  if @cooldown < 0
    @cooldown = 0

  closest_target = closest(this, state.targetables)

  # Fire projectile and reset cooldown
  if @cooldown == 0 and
  closest_target? and
  distance(this,closest_target) <= @range

    new_projectile =
      @fire_projectile
        x: @position.x
        y: @position.y
      ,
        closest_target

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
    
    # Create new projectile type for this weapon type
    fire_projectile: new_projectile_type options.projectile
