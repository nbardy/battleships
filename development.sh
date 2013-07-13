xdg-open 'http://localhost:9966/client/dev/index.html' &
NODE_ENV=development beefy --debug --live client/js/main.js & nodemon server.js && fg
