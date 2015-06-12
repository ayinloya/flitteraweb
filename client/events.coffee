Template.dashboard.events
  "click #headerToggle": () ->
    if $('body').attr('class') != "header-visible"
      $('body').addClass("header-visible")
      console.log "hhhhhhhhhhh"
    else
      $('body').removeClass("header-visible")
      console.log "llllllllllllll"
      