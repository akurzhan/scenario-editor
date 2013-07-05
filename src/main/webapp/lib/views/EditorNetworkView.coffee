# This creates the editor dialogs for Network Element
class window.beats.EditorNetworkView extends window.beats.EditorView
  $a = window.beats
  events : {
    'blur #network-name' : 'saveNetworkName'
    'blur #network-description' : 'saveNetworkDescription'
    'click #locked-for-edit' : 'saveLockedForEdit'
    'click #locked-for-history' : 'saveLockedForHistory'
  }

  # the options argument has the network model and type of dialog to create('network')
  initialize: (options) ->
    options.templateData = @_getTemplateData(options.models)
    super options

  # call the super class to set up the dialog box and then set the select box
  render: ->
    super @elem
    @_checkMode()
    @

  # creates a hash of values taken from the model for the html template
  _getTemplateData: (models) ->
    'name': models[0].name()
    'description': models[0].description_text()
    'lockedForEdit': if models[0].locked_for_edit() then "checked" else ""
    'lockedForHistory': if models[0].locked_for_history() then "checked" else ""

  # This is used to save the network name when focus is
  # lost from the element
  saveNetworkName: (e) ->
    id = e.currentTarget.id
    _.each(@models, (m) -> m.set_name($("##{id}").val()))

  # This is used to save the network name when focus is
  # lost from the element
  saveNetworkDescription: (e) ->
    id = e.currentTarget.id
    _.each(@models, (m) -> m.set_description_text($("##{id}").val()))

  # This saves the checkbox indicating the network is locked for edit
  saveLockedForEdit: (e) ->
    id = e.currentTarget.id
    _.each(@models, (m) -> m.set_locked_for_edit($("##{id}").prop('checked')))

  # This saves the checkbox indicating the network is locked for history
  saveLockedForHistory: (e) ->
    id = e.currentTarget.id
    _.each(@models, (m) -> m.set_locked_for_history($("##{id}").prop('checked')))
