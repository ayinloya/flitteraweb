@Utils =
  prettyDate: (date)->
    if date
      if Config.dateFormat
        moment(date).format(Config.dateFormat)
      else
        moment(date).format('D/M/YYYY')

  timeSince: (date)->
    if date
      seconds = Math.floor((new Date() - date) / 1000)
      interval = Math.floor(seconds / 31536000)
      return interval + "years ago"  if interval > 1
      interval = Math.floor(seconds / 2592000)
      return interval + " months ago"  if interval > 1
      interval = Math.floor(seconds / 86400)
      return interval + " days ago"  if interval > 1
      interval = Math.floor(seconds / 3600)
      return interval + " hours ago"  if interval > 1
      interval = Math.floor(seconds / 60)
      return interval + " minutes"  if interval > 1
      "just now"

  isMobile: ->
    /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test navigator.userAgent

  loginRequired: ->
    Router.go '/sign-in'

  initTwitter: ->
    Twitter = Npm.require('twit');
    conf=
      consumer_key: 'cfkShihTzAt8lSnkVyY55uep3'
      consumer_secret: 'nqek9o7ZGe0yMArRQJ10aH0sLcKtT7qm5tu2chqpt12w85wtyv'
      access_token: '1621263949-luTkfbICzKo5gHy0fsQpBrMFytzAu36r0pAVTI5'
      access_token_secret: '1gk0chMyaoG7Y272ume9ruHjX8OZNaUK6l4tVe67wFuXE'
    console.log conf.consumer_key
    client = new Twitter(conf)

    return client
  