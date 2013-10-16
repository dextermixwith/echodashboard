sys = require 'util'
APISession = require '../../../lib/APISession.coffee'
sinon = require 'sinon'

stubReslter = 
  post : ->

postResult =
	on : ->
		on : ->

postArgs = 
  headers: 
  	"Content-Type": "text/xml"
  password: "password"
  username: "username"

mockRest = sinon.mock(stubReslter)
mockRest.expects('post').withExactArgs("https://api.esendex.com/v1.0/session/constructor", postArgs).once().returns(postResult)
successCallback = (sessionId) ->
	sys.puts sessionId
failCallback = (response) ->
	sys.puts response.statusCode
describe 'Login successfully tests', ->
	apiSession = APISession.create(stubReslter)
	it 'Calls the session constructor endpoint', ->
		apiSession.login "username", "password", successCallback, failCallback
		mockRest.verify()