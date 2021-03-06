// Generated by CoffeeScript 1.6.1
(function() {

  module.exports = {
    progress: function(state, dt) {
      var all_items, item, new_items, next_state, _i, _j, _len, _len1;
      next_state = {
        targetables: [],
        projectiles: [],
        weapons: []
      };
      all_items = state.targetables.concat(state.projectiles).concat(state.weapons);
      for (_i = 0, _len = all_items.length; _i < _len; _i++) {
        item = all_items[_i];
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
            case "projectile":
              next_state.projectiles.push(item);
          }
          if (item.attached_to) {
            item.position.x = item.attached_to.position.x;
            item.position.y = item.attached_to.position.y;
          }
        }
      }
      return next_state;
    }
  };

}).call(this);
