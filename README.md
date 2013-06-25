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
npm install beefy browserify -g
```

Then simply running the `deploy.sh` script
```bash
./deploy.sh
```
And point your browser to [http://localhost:9966](http://localhost:9966)

Development
-----------
Alternatively you can run the `development.sh` script and it will start the server with auto reloading of all the files required.

This requires two more dependencies
  + [beefy](http://didact.us/beefy/)
  + [nodemon](http://remy.github.io/nodemon)

```bash
npm install
./development.sh
```

[Then just visit the app](http://localhost:9966/client/dev/index.html)

Organization of Code
-------------------

    - main.js -- fire everything off

    - gameplay.coffee -- holds the update loop base
    - renderer.coffee -- holds the render loop base

    - objects folder -- All the parts of the game which come together

Attributes
---------
Uses pixi rendering engine

Icons by
--------

Bullet designed by mathies janssen from The Noun Project
Shark Fin designed by Razlan Hanafiah from the Noun Project
