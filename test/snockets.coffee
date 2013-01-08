wintersmith = require 'wintersmith'
snockets    = require '../plugin'
rimraf      = require 'rimraf'
fs          = require 'fs'

# String to check compiled javascript file against
compiledScript = '(function(){var a;a="coffeescript"}).call(this);var module="javascript";(function(){var a;a="tree1"}).call(this),function(){var a;a="tree2"}.call(this),function(){var a;a="main"}.call(this)'

describe "Snockets compilation", ->

	# Install the snockets plugin
	before (done)->
		snockets wintersmith, ->
			do done

	# Check plugin compiles successfully
	it "should compile, concat & min both .coffee and .js files", (done)->

		# Wintersmith options
		options =
			'output': './test/temp',
			'contents': './test/contents',

		# Compile test contents
		wintersmith options, (err) ->
			throw err if err

			# Check main file compiled correctly
			fs.readFile './test/temp/js/main.js', (err, data) ->
				throw err if err
				unless data.toString() is compiledScript
					throw 'main.js did not compile as expected'
				do done

	# Cleanup temp directory
	after (done) ->
		rimraf './test/temp', (err) ->
			do done