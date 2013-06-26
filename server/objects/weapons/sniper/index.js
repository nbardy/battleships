// Generated by CoffeeScript 1.6.1
(function() {
  var new_weapon, texture;

  new_weapon = require('../weapon.js');

  texture = "/img/long-bullet.png";

  module.exports = new_weapon({
    range: 1000,
    rate: 4,
    projectile: {
      texture: texture,
      speed: 600,
      acceleration: 0,
      damage: 100,
      width: .3,
      height: .2
    }
  });

}).call(this);
