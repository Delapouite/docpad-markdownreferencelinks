DocpadPlugin = require "#{__dirname}/../../plugin.coffee"

class MarkdownReferenceLinksPlugin extends DocpadPlugin
	name: 'markdownreferencelinks'

	# Parsing all files has finished
	contextualizeFinished: ({docpad,logger,util},next) ->
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
						document.contentSrc += '[' + key + ']: ' + document.links[key] + '\n'
					document.save()
				tasks.complete()

module.exports = MarkdownReferenceLinksPlugin
