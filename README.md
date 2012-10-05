coffee-express
==============

An Opinionated Coffeescript + Express Framework

It makes use of these tools: 

* CoffeeScript for client side and server development
* Mocha testing framework with should.js 
* Jade templates for HTML generation
* Stylus for CSS generation
* Docco for documentation generation

Application Layout
==================

    app/                <- the application
        lib/            <- put misc. libraries in here 
        routes/         <- organize routes in here
        views/          <- jade templates ...
        public/         <- auto. gen stylus=>css, coffee=>js files
        static/         <- static, public files (.png, .js, .css, etc.)
        index.coffee    <- main entry point into the Application
    docs/               <- generated documentation
    test/               <- tests go in here
    server.coffee       <- starts the web server(s)
    Cakefile            <- App. specific tasks
    package.json        <- mmm. npm package definitions
