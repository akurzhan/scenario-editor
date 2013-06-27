# This class renders the menu items for the Layers Menu
# The isShowing field is used for items in the menu that
# toggle show/hide on the map. Note that if it finds
# there is a submenu attached to it, then it will call
# back to LayerMenuView to create a new menu and attach it to itself
class window.beats.LayersMenuViewItem extends Backbone.View
  $a = window.beats
  tagName : 'li'
  isShowing: true

  initialize: (@parent, @values) ->
    @collection = eval(@values.collection) if @values.collection
    @triggerShow = @values.triggerShow if @values.triggerShow
    @triggerHide = @values.triggerHide if @values.triggerHide
    @event_arg = @values.param if @values.param
    @template = _.template($('#child-item-menu-template').html())
    displayText = values.label
    # values.link indicates a submenu and we display '>>' in the view
    # to indicate a menu
    displayText = "#{values.label} &raquo; " if @values.link
    @$el.html @template({text: displayText}) if @values.label
    @$el.attr 'class', @values.className if @values.className
    @$el.attr 'href', @values.href if @values.href
    @$el.attr 'id', @values.link if @values.link
    @events = {'click': @values.event } if @values.event
    @render()
    # again we'll create a submenu if values.link is set
    @_createSubMenu @values.items, @values.link if @values.link
    # puts a check mark if this item needs checkmarks
    if @values.triggerShow
      @check(true)
      @isShowing = true
    if @values.initiallyChecked is false
      @check(false)
      @isShowing = false

  render: ->
    $("##{@parent}").append(@el)
    @

  # if a submenu is needed this call the LayersMenuView again to generate a
  # whole menu and attach it to this item
  _createSubMenu: (items, id) ->
    attrs = {
      className: 'dropdown-menu submenu-hide'
      id: "sub-#{id}"
      parentId: id
      menuItems: items
    }
    new $a.LayersMenuView(attrs)

  # adds the checkmark to the item or takes it aways
  check: (show) ->
    if show
      @$el.addClass "icon-ok"
    else
      @$el.removeClass "icon-ok"

  # This function is called on the click if we are toggling the checkmark to
  # show/hide. Not every item operates like this. You can see in
  # menu-data.coffee which items call this method and which do not
  toggleVisible: =>
    if @isShowing
      @collection.trigger(@triggerHide, @event_arg)
      @isShowing = false
      @check(false)
    else
      @collection.trigger(@triggerShow, @event_arg)
      @isShowing = true
      @check(true)
      
  # This function is called on the click if we are toggling the checkmark to
  # show/hide. Not every item operates like this. You can see in
  # menu-data.coffee which items call this method and which do not
  toggleMapTypeVisible: =>
    if @isShowing
      $a.broker.trigger(@triggerHide, false)
      @isShowing = false
      @check(false)
    else
      $a.broker.trigger(@triggerShow, true)
      @isShowing = true
      @check(true)