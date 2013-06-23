// Generated by CoffeeScript 1.6.1
(function() {
  var invSqrt, length, minus, normalize, render, update;

  invSqrt = function(x) {
    return 1 / Math.sqrt(x);
  };

  length = function(vec1) {
    return Math.sqrt(Math.pow(vec1.x, 2) + Math.pow(vec1.y, 2));
  };

  minus = function(vec1, vec2) {
    return {
      x: vec1.x - vec2.x,
      y: vec1.y - vec2.y
    };
  };

  normalize = function(vec) {
    var scale, val;
    val = Math.pow(vec.x, 2) + Math.pow(vec.y, 2);
    scale = invSqrt(val);
    return {
      x: vec.x * scale,
      y: vec.y * scale
    };
  };

  render = function() {
    var sprite;
    sprite = new PIXI.Sprite(this.texture);
    sprite.anchor.x = .5;
    sprite.anchor.y = .5;
    sprite.position.x = this.position.x;
    sprite.position.y = this.position.y;
    sprite.rotation = this.rotation;
    sprite.width *= this.width;
    sprite.height *= this.height;
    if (this.rotation) {
      return sprite;
    } else {
      return void 0;
    }
  };

  update = function(dt) {
    var diff, direction, distance, invDist;
    if (this.target != null) {
      this.last_target = {
        position: {
          x: this.target.position.x,
          y: this.target.position.y
        },
        hit: function() {}
      };
    } else {
      this.target = this.last_target;
    }
    diff = minus(this.target.position, this.position);
    distance = length(diff);
    invDist = 1 / distance;
    direction = {
      x: diff.x * invDist,
      y: diff.y * invDist
    };
    this.position.x += direction.x * this.speed * dt;
    this.position.y += direction.y * this.speed * dt;
    this.rotation = Math.atan2(direction.y, direction.x);
    if (distance < 20) {
      this.target.hit(this);
      return [];
    } else {
      return this;
    }
  };

  module.exports = function(options) {
    if (options == null) {
      options = {};
    }
    return function(position, target) {
      return {
        type: 'projectile',
        acceleration: options.acceleration || 0,
        speed: options.speed || 1,
        width: options.width || 1,
        height: options.height || 1,
        damage: options.damage || 1,
        texture: options.texture,
        render: render,
        target: target,
        update: update,
        position: {
          x: position.x || 0,
          y: position.y || 0
        }
      };
    };
  };

}).call(this);
