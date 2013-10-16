sys = require("util")
rest = require("restler")

class  APISession 
  constructor : (restler) ->
    @sessionId = ""
    @restler = restler or rest
  login: (username, password, successCallback, failCallback) =>
    restOptions =
      username: username
      password: password
      headers:
        "Content-Type": "text/xml"

    sys.puts "Logging in..."
    @restler.post("https://api.esendex.com/v1.0/session/constructor", restOptions)
      .on "success", (result, response) =>
        sys.puts response.statusCode
        sessionId = result.session.id.toString()
        sys.puts "sessionid = " + sessionId
        @sessionId = new Buffer(sessionId).toString("base64")
        sys.puts "base 64 encoded: " + @sessionId
        successCallback(@sessionId)
      .on "fail", (data, response) =>
        failCallback response

module.exports.create = (restler)->
  new APISession(restler)