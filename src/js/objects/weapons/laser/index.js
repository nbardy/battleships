// Generated by CoffeeScript 1.6.1
(function() {
  var laser_texture, new_weapon;

  new_weapon = require('../weapon.js');

  laser_texture = PIXI.Texture.fromImage("laser.png");

  module.exports = new_weapon({
    range: 100,
    rate: 1,
    projectile: {
      texture: laser_texture,
      speed: 0.2,
      acceleration: 0
    }
  });

}).call(this);
