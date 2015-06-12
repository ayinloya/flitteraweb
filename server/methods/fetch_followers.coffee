Meteor.methods
  fetchFollowers: (userId) ->
    if userId     
      client = Utils.initTwitter()
      console.log "fetching followers for #{userId}"
      user =  Meteor.users.findOne userId

      params = 
        screen_name: user.profile.screenName
      client.get('followers/list', params ,Meteor.bindEnvironment (error, followers, response) -> 
        console.log "logging followers"
        followers = _.toArray(followers)[0]
        _.each(followers, (follower, k)-> 
          console.log "ids are: #{follower.id_str}"
        # console.log followers
          x=0
          Followers.insert({followerId: follower.id_str}, (e, f) ->
            if e 
              console.log("Error saving #{e}")
            else
              console.log("saved #{f}")
              )
          )
        return followers
        )
    else
      return null
    