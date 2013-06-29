PIXI = require('../lib/pixi.dev.js')
window.PIXI = document.PIXI = PIXI

object_renderer = require './object_renderer'

module.exports =
  create: (context) ->
    # create a renderer instance.
    renderer = PIXI.autoDetectRenderer(
      window.innerWidth - 50,
      window.innerHeight - 50
    )

    @renderer = renderer

    # add the renderer view element to the DOM
    context.innerHTML = ""
    context.appendChild @renderer.view

    # The looping function
    #
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

      # Create a wrapper to ignore empty sprites
      stage.add = (sprites) ->
        # Use empty concat to accomadate single items
        for sprite in [].concat(sprites)
          if sprite?
            stage.addChild sprite

      # Loops through each object
      # adding it as a sprite
      render_objects = (objects) ->
        for object in objects
          stage.add object_renderer(object)

      # Rende all targetables and projectiles
      render_objects(state.projectiles)
      render_objects(state.targetables)

      stage
