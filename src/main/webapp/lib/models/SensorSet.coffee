class window.beats.SensorSet extends Backbone.Model
  ### $a = alias for beats namespace ###
  $a = window.beats
  @from_xml1: (xml, object_with_id) ->
    deferred = []
    obj = @from_xml2(xml, deferred, object_with_id)
    fn() for fn in deferred
    obj
  
  @from_xml2: (xml, deferred, object_with_id) ->
    return null if (not xml? or xml.length == 0)
    obj = new window.beats.SensorSet()
    sensor = xml.children('sensor')
    obj.set('sensor', _.map($(sensor), (sensor_i) -> $a.Sensor.from_xml2($(sensor_i), deferred, object_with_id)))
    project_id = $(xml).attr('project_id')
    obj.set('project_id', Number(project_id))
    id = $(xml).attr('id')
    obj.set('id', Number(id))
    name = $(xml).attr('name')
    obj.set('name', name)
    description = $(xml).attr('description')
    obj.set('description', description)
    mod_stamp = $(xml).attr('mod_stamp')
    obj.set('mod_stamp', mod_stamp)
    lockedForEdit = $(xml).attr('lockedForEdit')
    obj.set('lockedForEdit', (lockedForEdit.toString().toLowerCase() == 'true') if lockedForEdit?)
    lockedForHistory = $(xml).attr('lockedForHistory')
    obj.set('lockedForHistory', (lockedForHistory.toString().toLowerCase() == 'true') if lockedForHistory?)
    if obj.resolve_references
      obj.resolve_references(deferred, object_with_id)
    obj
  
  to_xml: (doc) ->
    xml = doc.createElement('SensorSet')
    if @encode_references
      @encode_references()
    _.each(@get('sensor') || [], (a_sensor) -> xml.appendChild(a_sensor.to_xml(doc)))
    if @has('project_id') && @project_id != 0 then xml.setAttribute('project_id', @get('project_id'))
    xml.setAttribute('id', @get('id')) if @has('id')
    if @has('name') && @name != "0" then xml.setAttribute('name', @get('name'))
    if @has('description') && @description != "0" then xml.setAttribute('description', @get('description'))
    if @has('mod_stamp') && @mod_stamp != "0" then xml.setAttribute('mod_stamp', @get('mod_stamp'))
    if @has('lockedForEdit') && @lockedForEdit != false then xml.setAttribute('lockedForEdit', @get('lockedForEdit'))
    if @has('lockedForHistory') && @lockedForHistory != false then xml.setAttribute('lockedForHistory', @get('lockedForHistory'))
    xml
  
  deep_copy: -> SensorSet.from_xml1(@to_xml(), {})
  inspect: (depth = 1, indent = false, orig_depth = -1) -> null
  make_tree: -> null