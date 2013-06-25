console.log 'dirname', __dirname
path = require('path')
Ships = require(path.resolve('./server/objects/ships'))
Weapons = require(path.resolve('./server/objects/weapons'))

window =
  innerHeight: 600
  innerWidth: 800

module.exports = ->
  small1 = Ships.small(
    window.innerWidth/2 + 50,
    window.innerHeight/2 - 50
  )
  small2 = Ships.small(
    window.innerWidth /2 - 50,
    window.innerHeight /2 + 50
  )
  small3 = Ships.small(
    window.innerWidth /2 + 75
    window.innerHeight /2 + 200
  )
  large = Ships.large(
    window.innerWidth /2 - 50,
    window.innerHeight /2 - 50
  )
  sharktopus = Ships.sharktopus(
    window.innerWidth /2 - 200,
    window.innerHeight /2 - 200
  )
  laser = Weapons.laser()
  sharknado = Weapons.sharknado()
  sniper = Weapons.sniper()
  cannon1 = Weapons.cannon()
  cannon2 = Weapons.cannon()

  large.attach(laser)
  sharktopus.attach(sharknado)
  small1.attach(cannon1)
  small2.attach(cannon2)
  small3.attach(sniper)

  targetables:
    [
      sharktopus
      small1
      small2
      small3
      large
    ]
  weapons: [
    cannon1
    cannon2
    laser
    sniper
    sharknado
  ]
  projectiles: []
