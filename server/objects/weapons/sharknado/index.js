// Generated by CoffeeScript 1.6.1
(function() {
  var new_weapon, texture;

  new_weapon = require('../weapon.js');

  texture = "/img/sharknado.png";

  module.exports = new_weapon({
    range: 900,
    rate: 2,
    projectile: {
      texture: texture,
      speed: 120,
      acceleration: .1,
      damage: 10,
      width: .5,
      height: .7,
      anchor: {
        y: .7,
        x: .5
      }
    }
  });

}).call(this);
