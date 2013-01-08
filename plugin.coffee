
path = require 'path'

Snockets = require 'snockets'
snockets = new Snockets()

module.exports = (wintersmith, callback) ->

	class SnocketsPlugin extends wintersmith.ContentPlugin

		constructor: (@_filename, @_base, @_source) ->

		# Change extension to JS
		getFilename: -> @_filename.replace /coffee$/, 'js'

		render: (locals, contents, templates, callback) ->
			
			# Get full path
			file = path.join @_base, @_filename

			# Create concatinated and minified output file
			snockets.getConcatenation file, minify: true, (err, js) ->
				callback null, new Buffer js
				
	SnocketsPlugin.fromFile = (filename, base, callback) ->
		callback null, new SnocketsPlugin filename, base

	# Glob any js or coffee files
	wintersmith.registerContentPlugin 'scripts', '**/*.+(js|coffee)', SnocketsPlugin
	do callback
