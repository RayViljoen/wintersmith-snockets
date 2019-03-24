
path = require 'path'

Snockets = require 'snockets'
snockets = new Snockets()

module.exports = (wintersmith, callback) ->
	class SnocketsPlugin extends wintersmith.ContentPlugin

		constructor: (@_filepath, @_source) ->

		# Change extension to JS
		getFilename: -> path.basename(@_filepath.full).replace /coffee$/, 'js'

		getView: ->
			(env, locals, contents, templates, callback) ->
				# Create concatenated and minified output file
				snockets.getConcatenation @_filepath.full, minify: true, (err, js) ->
					callback null, new Buffer js

	SnocketsPlugin.fromFile = (filepath, callback) ->
		callback null, new SnocketsPlugin filepath

	# Glob any js or coffee files
	wintersmith.registerContentPlugin 'scripts', '**/*.+(js|coffee)', SnocketsPlugin
	do callback
