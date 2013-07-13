Getting Starting
================

Dependencies
  + [nodejs](http://nodejs.org)
  + [browserify](http://browserify.org)

Deployment
----------

clone the repository and enter it.
```bash
git clone https://github.com/nbardy/battleships
cd battleships
```
If you don't already have browserify intall it with npm.

```bash
npm install browserify -g
```

Then simply running the `deploy.sh` script
```bash
./deploy.sh
```
And point your browser to [http://localhost:8080](http://localhost:8080)

Development
-----------
Alternatively you can run the `development.sh` script and it will start the server with auto reloading of all the files required.

This requires two more dependencies
  + [beefy](http://didact.us/beefy/)
  + [nodemon](http://remy.github.io/nodemon)

This will require root(sudo)
```bash
npm install nodemon beefy -g
```

Then run the script
```bash
./development.sh
```

[Then just visit the app](http://localhost:9966/client/dev/index.html)

Organization of Code
-------------------

    - server.coffee -- handles the all the incoming routes and websocket traffic

    - lib/ -- homebaked libraries

    - server/ -- All of the game server logic
        - main.js -- sets up the main game loop
        - gameplay/ -- holds the gameplay logic
        - new_game/ -- holds a new game configuration
        - objects/ -- holds all the various object definitons (Everything in game is a collection of objects)
    
    - client/ -- All of the code passed clientside
        - js/
            - main.js/ --external libraries
            - lobby/ -- handles the lobby for joining games
            - renderer/ -- Code rendering the game

Attributes
---------
Uses pixi rendering engine

Icons by
--------

Bullet designed by mathies janssen from The Noun Project
Shark Fin designed by Razlan Hanafiah from the Noun Project
