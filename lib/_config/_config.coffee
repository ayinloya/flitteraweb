# These values get propagated through the app
# E.g. The 'name' and 'subtitle' are used in seo.coffee

@Config =

	# Basic Details
	name: 'flittera'
	title: ->
			TAPi18n.__ 'configTitle'
	subtitle: ->
			TAPi18n.__ 'configSubtitle'
	logo: ->
		'<b>' + @name + '</b>'
	footer: ->
		@name + ' - Copyright ' + new Date().getFullYear()

	# Emails
	emails:
		from: 'no-reply@' + Meteor.absoluteUrl()
		contact: 'hello' + Meteor.absoluteUrl()

	# Username - if true, users are forced to set a username
	username: false
	
	# Localisation
	defaultLanguage: 'en'
	dateFormat: 'D/M/YYYY'

	# Meta / Extenrnal content
	privacyUrl: 'http://flittera.com'
	termsUrl: 'http://flittera.com'

	# For email footers
	legal:
		address: 'Jessnerstrasse 18, 12047 Berlin'
		name: 'Meteor Factory'
		url: 'http://flittera.com'

	about: 'http://flittera.io'
	blog: 'http://blog.flittera.io'

	socialMedia:
		facebook:
			url: 'http://facebook.com/ayinloya'
			icon: 'facebook'
		twitter:
			url: 'http://twitter.com/ayinloya'
			icon: 'twitter'
		github:
			url: 'http://github.com/ayinloya'
			icon: 'github'
		info:
			url: 'http://flittera.com'
			icon: 'link'

	#Routes
	homeRoute: '/'
	publicRoutes: ['home']
	dashboardRoute: '/dashboard'