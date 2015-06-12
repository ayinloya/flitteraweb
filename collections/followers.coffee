@Followers = new Meteor.Collection('followers');

Schemas.Followers = new SimpleSchema
  followerId:
    type: String
  name:
    type: String
  profileImageUrl:
    type: String

  createdAt: 
    type: Date
    autoValue: ->
      if this.isInsert
        new Date()

  updatedAt:
    type:Date
    optional:true
    autoValue: ->
      if this.isUpdate
        new Date()

  picture:
    type: String
    autoform:
      afFieldInput:
        type: 'fileUpload'
        collection: 'Attachments'

  owner: 
    type: String
    regEx: SimpleSchema.RegEx.Id
    autoValue: ->
      if this.isInsert
        Meteor.userId()
    autoform:
      options: ->
        _.map Meteor.users.find().fetch(), (user)->
          label: user.emails[0].address
          value: user._id

Followers.attachSchema(Schemas.Followers)