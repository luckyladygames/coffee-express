fs            = require 'fs'
{print}       = require 'util'
which         = require('which')
{spawn, exec} = require 'child_process'

# ANSI Terminal Colors
bold  = '\x1B[0;1m'
red   = '\x1B[0;31m'
green = '\x1B[0;32m'
reset = '\x1B[0m'

log = (message, color, explanation) ->
  console.log color + message + reset + ' ' + (explanation or '')

# mocha test
test = (callback) ->
  process.env["NODE_ENV"] = "test"
  options = [
    '--compilers'
    'coffee:coffee-script'
    '--colors'
    '--require'
    'should'
    '--recursive'
  ]
  try
    cmd = which.sync 'mocha'
    spec = spawn cmd, options
    spec.stdout.pipe process.stdout
    spec.stderr.pipe process.stderr
    spec.on 'exit', (status) ->
        callback?() if status is 0
  catch err
    log err.message, red
    log 'Mocha is not installed - try npm install mocha -g', red

task 'docs', 'Generate annotated source code with Docco', ->
  fs.readdir 'app', (err, contents) ->
    files = ("app/#{file}" for file in contents when /\.coffee$/.test file)
    try
      cmd = which.sync 'docco'
      docco = spawn cmd, files
      docco.stdout.pipe process.stdout
      docco.stderr.pipe process.stderr
      docco.on 'exit', (status) -> callback?() if status is 0
    catch err
      log err.message, red
      log 'Docco is not installed - try npm install docco -g', red


task 'test', 'Run Mocha tests', ->
    build()
    test -> log "done", green

# Run the server in development mode, restarting it when source files change
task 'dev', 'start dev env', ->
  process.env["NODE_ENV"] = "development"
  supervisor = spawn 'supervisor', ['-w','app', '-e', 'js|coffee|jade', '-i', 'app/public/generated', 'server.coffee']
  supervisor.stdout.pipe process.stdout
  supervisor.stderr.pipe process.stderr
  log 'Watching js and jade files and running server', green
  
