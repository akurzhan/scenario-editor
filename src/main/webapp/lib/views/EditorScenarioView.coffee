# This creates the editor dialogs for Network Element
class window.beats.EditorScenarioView extends window.beats.EditorView
  $a = window.beats
  events : {
    'blur #scenario-name' : 'saveScenarioName'
    'blur #scenario-description' : 'saveScenarioDescription'
    'click #scen-locked-for-edit' : 'saveLockedForEdit'
    'click #scen-locked-for-history' : 'saveLockedForHistory'
  }

  # the options argument has the network model and type of dialog to create('network')
  initialize: (options) ->
    options.templateData = @_getTemplateData(options.model, options.message)
    super options

  # call the super class to set up the dialog box and then set the select box
  render: ->
    super @elem
    @_checkMode()
    @

  # set up the mode correctly
  scenarioMode: ->
    super
    @$el.find(".scenario-editor :input").attr("disabled", false)

  networkMode: ->
    super

  # Once an editor is created we sets field to respond to the appropriate modes
  _checkMode: ->
    @viewMode() if $a.Mode.VIEW
    @scenarioMode() if $a.Mode.SCENARIO
    @networkMode() if $a.Mode.NETWORK
  
  # creates a hash of values taken from the model for the html template
  _getTemplateData: (model, message) ->
    'name': model.name()
    'description': model.description_text()
    'message': message if message?
    'lockedForEdit': if model.locked_for_edit() then "checked" else ""
    'lockedForHistory': if model.locked_for_history() then "checked" else ""

  # This is used to save the scenario name when focus is
  # lost from the element
  saveScenarioName: (e) ->
    id = e.currentTarget.id
    @model.set_name($("##{id}").val())

  # This is used to save the scenario description when focus is
  # lost from the element
  saveScenarioDescription: (e) ->
    id = e.currentTarget.id
    @model.set_description_text($("##{id}").val())

  # This saves the checkbox indicating the scenario is locked for edit
  saveLockedForEdit: (e) ->
    id = e.currentTarget.id
    @model.set_locked_for_edit($("##{id}").prop('checked'))

  # This saves the checkbox indicating the scenario is locked for history
  saveLockedForHistory: (e) ->
    id = e.currentTarget.id
    @model.set_locked_for_history($("##{id}").prop('checked'))