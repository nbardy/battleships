module.exports =
  progress: (state) ->
    next_state = {targetables: [], projectiles: [], weapons: []}
    dt = 0.1

    all_items = state.targetables
      .concat(state.projectiles)
      .concat(state.weapons)

    for item in all_items
      # Get new items for next_state produes from the old state
      # Concat to treat singular objects as an array
      new_items = [].concat(item.update(dt, state))

      for item in new_items
        switch item.type
          when "weapon" then next_state.weapons.push item
          when "ship" then next_state.targetables.push item
          when "projectile"
            next_state.projectiles.push item
        
        # move attachments
        if item.attached_to
          item.position.x = item.attached_to.position.x
          item.position.y = item.attached_to.position.y

    next_state
