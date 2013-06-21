// Generated by CoffeeScript 1.6.1
(function() {
  var Ships, Weapons;

  Ships = require('./objects/ships');

  Weapons = require('./objects/weapons');

  module.exports = {
    create: function() {
      var large, small, small2;
      small = Ships.small();
      small2 = Ships.small();
      large = Ships.large(125, 150);
      return {
        targetables: [small, small2, large],
        weapons: [],
        projectiles: []
      };
    },
    progress: function(state) {
      var dt, item, new_items, next_state, renderables, _i, _j, _len, _len1;
      next_state = {
        targetables: [],
        projectiles: [],
        weapons: []
      };
      dt = 0.1;
      renderables = state.targetables.concat(state.projectiles);
      for (_i = 0, _len = renderables.length; _i < _len; _i++) {
        item = renderables[_i];
        console.log(item);
        new_items = [].concat(item.update(dt, state));
        for (_j = 0, _len1 = new_items.length; _j < _len1; _j++) {
          item = new_items[_j];
          switch (item.type) {
            case "weapon":
              next_state.weapons.push(item);
              break;
            case "ship":
              next_state.targetables.push(item);
              break;
            case "projectiles":
              next_state.projectiles.push(item);
          }
        }
      }
      return next_state;
    }
  };

}).call(this);
