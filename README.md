Starting
-------

```bash
git clone https://github.com/nbardy/battleships
cd battleships
npm install beefy browserify -g
./dev.sh
```
Then open port in 9966


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
