texture = "/img/ship.png"

hit = (item) ->
  @health -= item.damage

attach = (item) ->
  @attachments.concat(item)
  item.attached_to = this
  item.position.x = @position.x
  item.position.y = @position.y

default_update = (dt) ->
  @xvel = @xvel + @xacel
  @yvel = @yvel + @yacel
  @position.x = @position.x + @xvel
  @position.y = @position.y + @yvel

  @xacel = (@xacel + Math.random() - .5 ) * dt * @acceleration

  @yacel = (@yacel + Math.random() - .5 ) * dt * @acceleration

  if Math.abs(@xacel) > 5
    @xacel = -Math.abs(@xacel) / @xacel

  if Math.abs(@yacel) > 5
    @yacel = -Math.abs(@yacel) / @yacel

  if @health > 0
    this
  else
    []

new_ship = (options={}) ->
  (xpos, ypos) ->
    type: "ship"
    update: options.update || default_update
    health: options.health || 100
    position:
      x: xpos || 0
      y: ypos || 0
    width: options.width
    height: options.height
    acceleration: options.acceleration || 0.1
    xvel: 0
    yvel: 0
    xacel: 0
    yacel: 0
    texture: options.texture || texture
    attachments: [] # Initializes with 0 attachments
    attach: attach
    hit: hit

module.exports = new_ship