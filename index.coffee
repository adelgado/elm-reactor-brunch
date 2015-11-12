{spawn} = require 'child_process'

class ElmReactorBrunch

	brunchPlugin: true

	constructor: ->
		@reactor = spawn 'elm-reactor'
		@reactor.stdout.on 'data', @log
		@reactor.stderr.on 'data', @log
		@reactor.on 'close', @onReactorClose

	log: (something) ->
		console.log 'Elm Reactor: ', something.toString()

	onReactorClose: (code) =>
		@log 'child process exited with code ' + code

module.exports = ElmReactorBrunch
