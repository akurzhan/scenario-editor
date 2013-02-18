# Creates the log In screen and sends user information out to rest API for authentication
class window.beats.LogInView extends Backbone.View
	$a = window.beats
	events : {
    'click #login-button' : 'logIn'
  }

	# draw the user element to the screen
	initialize: (attrs) ->
    @$el.attr 'title', attrs.title
    @$el.attr 'id', "user-dialog"
    @template = _.template($("#login-template").html())
    @$el.html(@template())
    $a.broker.on("app:logInCallback", @logInCallback)
    @render()
    @$el.dialog('open')

  # render the dialog box. The calling function has responsability for appending
  # it as well as calling el.tabs and el.diaload('open')
  render:  ->
    @$el.dialog
      autoOpen: false,
      modal: true,
      closeOnEscape: false,
      minHeight: 240,
      open: ->
        $('.ui-state-default').blur() #hack to get ui dialog focus bug
      close: =>
        @$el.remove()
    $('.ui-dialog-titlebar-close').css('visibility', 'hidden')

  # Attempts to log into project manager by sending authentication request
  # to server
  logIn: (event) ->
    # prevent the default action of submitting the form
    event.preventDefault()
    # get username and password from log-in dialog
    args = {
      username: $('body').find('#user-name').val()
      password: $('body').find('#password').val()
    }

    # Create Session Model and attempt to log in
    $a.usersession = new $a.UserSession(args)
    $a.usersession.setHeaders()

    # Kick Off Ajax Request to Log In
    $a.usersession.fetch()

  # Called after login attempt (trip to server)
  logInCallback: (event) ->
    # Check if User is authenticated, if so remove log in window 
    # and renable screen 
    if $a.usersession.isAuthenticated()
      $('#user-dialog').remove()
      # For now automatically generate network list, in future login should change menu config
      $a.broker.trigger("app:open_network_browser")
    else
      $('#user-login-error').html('Invalid Username or Password')

