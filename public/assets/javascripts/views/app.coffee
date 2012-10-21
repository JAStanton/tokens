$.app = {}
$.app.app = null;

$.app.User = Backbone.Model.extend
  urlRoot: '/api/users'
  idAttribute: '_id'

$.app.Users = Backbone.Collection.extend
  url: '/api/users'
  model: $.app.User

$.app.Router = Backbone.Router.extend
  routes:
    "": "show_users"
    "users/:_id": "show_user"


$.app.bootstrap = ->
	$.app.app = new $.app.Router()

	Backbone.history.start
    pushState: true



