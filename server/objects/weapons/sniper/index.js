// Generated by CoffeeScript 1.6.1
(function() {
  var new_weapon, texture;

  new_weapon = require('../weapon.js');

  texture = PIXI.Texture.fromImage("/img/long-bullet.png");

  module.exports = new_weapon({
    range: 900,
    rate: 13,
    projectile: {
      texture: texture,
      speed: 125,
      acceleration: 0,
      damage: 100,
      width: .2,
      height: .4
    }
  });

}).call(this);
