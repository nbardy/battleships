Ships = require('./objects/ships')
Weapons = require('./objects/weapons')

document.weapons = Weapons

module.exports = ->
  small = Ships.small(
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
  targetables:
    [
      small
      small2
      large
    ]
  weapons: []
  projectiles: []
