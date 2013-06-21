module.exports =
  progress: (state) ->
    next_state = {targetables: [], projectiles: [], weapons: []}
    dt = 0.1

    renderables = state.targetables.concat(state.projectiles)
    for item in renderables
      # Get new items for next_state produes from the old state
      # Concat to treat singular objects as an array
      new_items = [].concat(item.update(dt, state))

      for item in new_items
        switch item.type
          when "weapon" then next_state.weapons.push item
          when "ship" then next_state.targetables.push item
          when "projectiles" then next_state.projectiles.push item

    next_state

