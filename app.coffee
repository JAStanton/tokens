console.log "Initializing: #{new Date}"

routes   = require './routes'
mysql    = require 'mysql'
express  = require 'express'
db       = require './common/db.js'
user     = require './models/user.js'
http     = require 'http'
Snockets = require 'snockets'

snockets = new Snockets()

snockets.scan __dirname + '/public/assets/javascripts/mobile.coffee', (err, depGraph) ->
  console.warn err if err

snockets.scan __dirname + '/public/assets/javascripts/mobile_vendor.coffee', (err, depGraph) ->
  console.warn err if err

app = express()
app.configure ->
  app.set 'port', 1337
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'jade'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use require('stylus').middleware({ src: __dirname + '/public' })
  app.use app.router
  app.use express.static(__dirname + '/public')

app.configure 'development', ->
  app.use express.errorHandler(dumpExceptions: true, showStack: true)

app.configure 'production', ->
  app.use express.errorHandler()

app.get '/', routes.index

# app.get '/api/users', user.list
# app.get '/api/users/:id', user.get
# app.post '/api/users', user.new


http.createServer(app).listen app.get('port'), ->
  console.log "Express server listening on port #{app.get('port')}"
