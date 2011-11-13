#Goal
This plugin for [Docpad](http://github.com/balupton/docpad) provides a way to put links references into the header of a document so they can be used later inside its markdown content.

#Example using a links array
	---
	layout: default
	title: My Markdown post
	links:
	  - http://daringfireball.net/projects/markdown/syntax
	  - http://github.com/balupton/docpad
	---
	It's possible to use [markdown reference-style links][0] from the header with this [docpad][1] plugin.

#Example using a links object
	---
	layout: default
	title: My Markdown post
	links:
	  markdown: 'http://daringfireball.net/projects/markdown/syntax'
	  docpad: 'http://github.com/balupton/docpad'
	---
	It's possible to use [markdown reference-style links][markdown] from the header with this [docpad][] plugin.

#Install

Just drop the markdownreferencelinks directory into the *plugins* directory of you docpad project.
