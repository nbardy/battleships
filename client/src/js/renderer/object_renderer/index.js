// Generated by CoffeeScript 1.6.1
(function() {
  var lookup;

  lookup = function(object) {
    if (object.type === 'ship') {
      return require('./ship')(object);
    } else if (object.type === 'projectile') {
      return require('./projectile')(object);
    } else {

    }
  };

  module.exports = lookup;

}).call(this);
