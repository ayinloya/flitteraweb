Template.home.rendered = () ->
	w = new WOW().init()

	# TODO: End after home destroyed

	# make sure div stays full width/height on resize
	# global vars
	winWidth = $(window).width()
	winHeight = $(window).height()

	# set initial div height / width
	$("#intro").css
	  width: winWidth
	  height: winHeight

	$(window).resize ->
	  $("#intro").css
	    width: $(window).width()
	    height: $(window).height()

	#Skroll doesn't work so well on mobile imo
	unless Utils.isMobile
		options =
			forceHeight: false
			smoothScrolling: false

		skrollr.init(options).refresh()
		
	Meteor.call 'fetchFollowers', Meteor.userId(), (e,t,d) ->
		# console.log(e) if e
		# console.log(t) if t
		# console.log(d) if d
		

Template.home.destroyed = () ->
	#For Skrollr
	$('body').attr('style','')