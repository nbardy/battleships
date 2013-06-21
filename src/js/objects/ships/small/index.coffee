texture = PIXI.Texture.fromImage("ship.png")

render = ->
  sprite = new PIXI.Sprite(texture)
  sprite.anchor.x = .5
  sprite.anchor.y = .5
  sprite.position.x = @xpos
  sprite.position.y = @ypos

  sprite

update = (dt) ->
  @xvel = @xvel + @xacel
  @yvel = @yvel + @yacel
  @xpos = @xpos + @xvel
  @ypos = @ypos + @yvel

  @xacel = (@xacel + Math.random() - .5 ) * dt

  @yacel = (@yacel + Math.random() - .5 ) * dt

  @xacel = @xacel + (
    (Math.pow(200 - @xpos, 3) * 0.00000001 )
  )

  @yacel = @yacel + (
    ( Math.pow(150 - @ypos, 3) * 0.00000001 )
  )

  copy = (x) ->
    JSON.parse(JSON.stringify(x))

  return [this]

small_ship = ->
  type: 'ship'
  xpos: 200
  ypos: 150
  xvel: 0
  yvel: 0
  xacel: 0
  yacel: 0

  render: render
  update: update

module.exports =
  small_ship
