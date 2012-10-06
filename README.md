coffee-express 
==============

(Yet another Express+CoffeeScript template)

This is how I like to lay out my Express + CoffeeScript projects. It uses CoffeeScript 
instead of JavaScript and it has bits to make the coffeescript compiling as transparent 
and frictionless as possible. 

For backend development, instead of `node server.js` we can run `coffee server.coffee`. 
All the node.js bits inside still work the same but we do not need to compile the 
coffeescript first. 

For frontend development, the express middleware, [connect-coffee-script](https://github.com/wdavidw/node-connect-coffee-script) that compile and cache CoffeeScript just in time. The same goes for the stylus css generator. Just write your code in CoffeeScript or Stylus and ask for them as .js or .css files. 

Dependencies
============

* [CoffeeScript](http://coffeescript.org) for client side and server development
* [connect-coffee-script](ttps://github.com/wdavidw/node-connect-coffee-script)
* [Mocha](http://visionmedia.github.com/mocha/) testing framework with should.js 
* [Jade](http://jade-lang.com/) templates for HTML generation
* [Stylus](http://learnboost.github.com/stylus/) for CSS generation
* [Docco](http://jashkenas.github.com/docco/) for documentation generation

Application Layout
==================

    app/                    <- the application
        lib/                <- put misc. libraries in here 
        routes/             <- organize express routes in here
        views/              <- jade templates ...
        public/             <- public files (or ment to be public)
            src/            <- coffeescript/stylus source files
            generated/      <- generated coffeescript files ...
            static/         <- static, public files (.png, .js, .css, etc.)
        index.coffee        <- main entry point into the Application
    docs/                   <- generated documentation
    test/                   <- tests go in here
    server.coffee           <- starts the web server(s)
    Cakefile                <- App. specific tasks
    package.json            <- mmm. npm package definitions

USING
=====

1. Git clone the repo
1. Delete the .git directory
1. `npm install`
1. `git init` 
1. push it to your own repo

LICENSE
=======

MIT
