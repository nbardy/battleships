// Generated by CoffeeScript 1.6.1
(function() {
  var PIXI, object_renderer;

  PIXI = require('../lib/pixi.dev.js');

  window.PIXI = document.PIXI = PIXI;

  object_renderer = require('./object_renderer');

  module.exports = {
    create: function(context) {
      var renderer;
      renderer = PIXI.autoDetectRenderer(window.innerWidth - 50, window.innerHeight - 50);
      this.renderer = renderer;
      context.innerHTML = "";
      context.appendChild(this.renderer.view);
      return {
        update: function(state) {
          var stage;
          stage = this.getStage(state);
          return renderer.render(stage);
        },
        getStage: function(state) {
          var render_objects, stage;
          stage = new PIXI.Stage(0x66FF99);
          stage.add = function(sprite) {
            if (sprite != null) {
              return stage.addChild(sprite);
            }
          };
          render_objects = function(objects) {
            var object, _i, _len, _results;
            _results = [];
            for (_i = 0, _len = objects.length; _i < _len; _i++) {
              object = objects[_i];
              _results.push(stage.add(object_renderer(object)));
            }
            return _results;
          };
          render_objects(state.projectiles);
          render_objects(state.targetables);
          return stage;
        }
      };
    }
  };

}).call(this);
