// Generated by CoffeeScript 1.6.1
(function() {
  var PIXI;

  PIXI = require('./lib/pixi.dev.js');

  window.PIXI = document.PIXI = PIXI;

  module.exports = {
    create: function() {
      var renderer;
      renderer = PIXI.autoDetectRenderer(window.innerWidth - 50, window.innerHeight - 50);
      this.renderer = renderer;
      document.body.appendChild(this.renderer.view);
      return {
        update: function(state) {
          var stage;
          stage = this.getStage(state);
          return renderer.render(stage);
        },
        getStage: function(state) {
          var render_objects, stage;
          stage = new PIXI.Stage(0x66FF99);
          render_objects = function(objects) {
            var object, _i, _len, _results;
            _results = [];
            for (_i = 0, _len = objects.length; _i < _len; _i++) {
              object = objects[_i];
              if (object.render != null) {
                _results.push(stage.addChild(object.render()));
              } else {
                _results.push(void 0);
              }
            }
            return _results;
          };
          render_objects(state.targetables);
          render_objects(state.projectiles);
          return stage;
        }
      };
    }
  };

}).call(this);
