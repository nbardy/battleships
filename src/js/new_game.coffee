Ships = require('./objects/ships')
Weapons = require('./objects/weapons')

document.weapons = Weapons

module.exports = ->
  small1 = Ships.small(
    window.innerWidth/2 + 50,
    window.innerHeight/2 - 50
  )
  small2 = Ships.small(
    window.innerWidth /2 - 50,
    window.innerHeight /2 + 50
  )
  large = Ships.large(
    window.innerWidth /2 - 50,
    window.innerHeight /2 - 50
  )
  laser = Weapons.laser
    x: window.innerHeight / 2 + 300
    y: window.innerHeight / 2
  cannon1 = Weapons.cannon
    x: window.innerHeight / 2 - 100
    y: window.innerHeight / 2 + 50
  cannon2 = Weapons.cannon
    x: window.innerHeight / 2 - 100
    y: window.innerHeight / 2 + 50

  large.attach(laser)
  small1.attach(cannon1)
  small2.attach(cannon2)

  targetables:
    [
      small1
      small2
      large
    ]
  weapons: [
    cannon1
    cannon2
    laser
  ]
  projectiles: []
