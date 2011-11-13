DocpadPlugin = require "docpad/lib/plugin.coffee"
util = require 'bal-util'

class MarkdownReferenceLinksPlugin extends DocpadPlugin
	name: 'markdownreferencelinks'
	priority: 800

	parseAfter: ({docpad,logger},next) ->
		documents = docpad.documents
		logger.log 'debug', 'Generating Markdown reference links'

		# Async
		tasks = new util.Group (err) ->
			logger.log 'debug', 'Generated Markdown reference links'
			next err

		# Find documents
		documents.find {}, (err,docs,length) ->
			return tasks.exit err  if err
			tasks.total = length
			docs.forEach (document) ->
				if document.links
					keys = Object.keys(document.links)
					keys.forEach (key) ->
						document.contentSrc += '\n' + '[' + key + ']: ' + document.links[key]
					document.store()
				tasks.complete()

module.exports = MarkdownReferenceLinksPlugin
