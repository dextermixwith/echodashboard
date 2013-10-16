restify = require 'restify'
sys = require 'util'
rest = require 'restler'
Cookies = require 'cookies'

sessionId = ''

login = (req, res, next) =>
	restOptions = 
		username : 'john.armstrong-prior@esendex.com'
		password : '*******'
		headers :
			'Content-Type' : 'text/xml'
	sys.puts 'Logging in...'
	rest.post('https://api.esendex.com/v1.0/session/constructor', restOptions)
		.on 'complete', (result) =>
			sessionId = result.session.id.toString()
			sys.puts 'sessionid = ' + sessionId
			sessionId = new Buffer(sessionId).toString('base64')
			sys.puts 'base 64 encoded: ' + sessionId
			cookies = new Cookies req, res
			cookies.set 'sessionid', sessionId, 'httpOnly' : false
			res.send 'Logged in OK'

respondWithBatches = (req, res, next) =>
	cookies = new Cookies req, res
	sessionId = cookies.get 'sessionid'
	sys.puts 'session id = ' + sessionId
	restOptions = 
		headers :
			'Content-Type' : 'text/xml'
			'Authorization' : 'Basic ' + sessionId

	sys.puts 'Getting batches'
	rest.get('https://api.esendex.com/v1.0/messagebatches', restOptions)
		.on 'complete', (result) =>
			res.send result

server = restify.createServer 
	name : 'dasboardProxyAPI'

server.get '/batches', respondWithBatches
server.post '/login', login

server.listen 1234, () =>
	console.log '%s listening at %s', server.name, server.url