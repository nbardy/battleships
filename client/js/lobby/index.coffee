window.socket = socket

module.exports =
  create: (context, games) ->
    string = ""
    for id, game of games
      string += """
      <span>ID:</span> #{game.id}
      <br />
      <span>Players: </span> #{game.players.join(",")}
      <br />
      <button class="join-button"
        data-game-id="#{game.id}">Join</button>
      """

    joinButtons = document.getElementsByClassName('join-button')
    context.innerHTML = string

    for button in joinButtons
      gameID = button.getAttribute('data-game-id')
      button.onclick = (x)->
        socket.emit "join", this.getAttribute('data-game-id')
