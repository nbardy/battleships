PIXI = require('./lib/pixi.dev.js')
window.PIXI = document.PIXI = PIXI

module.exports =
  create: ->
    # create a renderer instance.
    renderer = PIXI.autoDetectRenderer(400, 300)
    @renderer = renderer

    # add the renderer view element to the DOM
    document.body.appendChild(@renderer.view)

    update: (state) ->
      stage = @getStage(state)
      renderer.render stage

    # Takes in the current state compares it to the last state
    # and makes the proper adjustments
    #
    # Adding new sprites where needed removing
    getStage: (state) ->
      # create an new instance of a pixi stage
      stage = new PIXI.Stage(0x66FF99)

      render_objects = (objects) ->
        for object in objects
          if object.render?
            stage.addChild object.render()

      render_objects(state.targetables)
      render_objects(state.projectiles)

      stage
