newGroup = (id, max_persons) ->
  id: id
  persons: []
  max_persons: max_persons
  # Add player to the list
  add: (person) ->
    @persons.push(person)

  isFull: ->
    @persons.length >= @max_persons

module.exports =
  create: ({open_games, max_persons, on_full} = {}) ->

    open_games ?= 5
    max_persons ?= 4
    on_full ?= -> true

    lobby =
      # A map of open games
      #   id: game
      open_groups: {}
      current_id: 0

      # Adds person to group by id
      # Usage:
      #  lobby.group(4).add(person)
      group: (id) ->
        group = @open_groups[id]
        # Pass back join function
        add: (person) =>
          group.add person

          if group.isFull()
            # Fire the callback
            on_full(group.persons)
            # Remove group from the lobby
            delete @open_groups[id]
            # create a new group to take its place
            @spawnEmptyGroup()

          true

      spawnEmptyGroup: ->
        @open_groups[@current_id] = newGroup(@current_id++, max_persons)

    # Creates the appropiate amount of initial open games
    groups_spawned = 0
    while groups_spawned++ < open_games
      lobby.spawnEmptyGroup()

    lobby
