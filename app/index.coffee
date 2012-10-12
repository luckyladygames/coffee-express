_ = require "underscore"
fs = require "fs"
express = require 'express'
stylus = require 'stylus'
connectCoffee = require 'connect-coffee-script'
nib = require 'nib'

app = express()

# Default Configuration
app.configure ->
    __base = process.cwd()
    app.use express.cookieParser "tempSecret"
    app.use express.bodyParser()

    env = app.get("env")
    
    if env == "development"
        app.use express.errorHandler()

    # detect asking for a css files and dynamically renders the stylus file to
    # what is requested
    app.use stylus.middleware
        src:    "#{__base}/app/public/src"
        dest:   "#{__base}/app/public/generated"
        
        # in development mode we will force recompile 
        force:  if app.get("env") == "production" then false else true
        compile: (str, path) ->
            stylus(str)
                .set("filename", path)
                .set("compress", env == "production")
                .use(nib())
                .import('nib')
    
    app.use connectCoffee
        src:    "#{__base}/app/public/src"
        dest:   "#{__base}/app/public/generated"
        bare:   false

    # serve both static (.jpg/.png/etc) and generated files
    app.use express.static "#{__base}/app/public/generated"
    app.use express.static "#{__base}/app/public/static"

    # Set View Engine
    app.set 'view engine', 'jade'
    app.set 'views', "#{__base}/app/views"

# Add routes to the application
require("./routes/example")(app)

# Define Port
port = process.env.PORT  or 3000

# Start Server
app.listen port, ->
    console.log "App Started, Listening on #{port}\nPress CTRL-C to stop server."
