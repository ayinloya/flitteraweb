@subs = new SubsManager()

Router.configure
  layoutTemplate: "masterLayout"
  loadingTemplate: "loading"
  notFoundTemplate: "notFound"
  routeControllerNameConverter: "camelCase"
  load: ->
    if Meteor.isClient
      $('html, body').animate({ scrollTop: 0 }, 400)
      $('.content').hide().fadeIn(1000)

  onBeforeAction: ->
  	# Redirect to set username if required
    if Config.username and Meteor.userId() and not Meteor.user().username
      @redirect '/setUserName'
    @next()


Router.waitOn ->
  subs.subscribe 'user'

onAfterAction = ->
  window.scrollTo(0,0)

  # # Remove modal
  # $bd =  $('.modal-backdrop')
  # $bd.removeClass('in')
  # setTimeout ->
  #   $bd.remove()
  # , 300

Router.onAfterAction onAfterAction

#To allow non-logged in users to access more routes, add it in the config file
except = _.union Config.publicRoutes || [], [
  'home'
  'atSignIn'
  'atSignUp'
  'atForgotPassword'
  'atSignOut'
]
Router.plugin 'ensureSignedIn', except: except

