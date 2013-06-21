// Generated by CoffeeScript 1.6.1
(function() {
  var Ships, Weapons;

  Ships = require('./objects/ships');

  Weapons = require('./objects/weapons');

  document.weapons = Weapons;

  module.exports = function() {
    var large, laser, small, small2;
    small = Ships.small(window.innerWidth / 2 + 50, window.innerHeight / 2 - 50);
    small2 = Ships.small(window.innerWidth / 2 - 50, window.innerHeight / 2 + 50);
    large = Ships.large(window.innerWidth / 2 - 50, window.innerHeight / 2 - 50);
    laser = Weapons.laser({
      x: 200,
      y: 100
    });
    return {
      targetables: [small, small2, large],
      weapons: [laser],
      projectiles: []
    };
  };

}).call(this);
