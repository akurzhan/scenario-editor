class window.beats.DemandSet extends Backbone.Model
  ### $a = alias for beats namespace ###
  $a = window.beats
  @from_xml1: (xml, object_with_id) ->
    deferred = []
    obj = @from_xml2(xml, deferred, object_with_id)
    fn() for fn in deferred
    obj
  
  @from_xml2: (xml, deferred, object_with_id) ->
    return null if (not xml? or xml.length == 0)
    obj = new window.beats.DemandSet()
    description = xml.children('description')
    obj.set('description', $a.Description.from_xml2(description, deferred, object_with_id)) if description? and description != ""
    demandProfile = xml.children('demandProfile')
    obj.set('demandprofile', _.map($(demandProfile), (demandProfile_i) -> $a.DemandProfile.from_xml2($(demandProfile_i), deferred, object_with_id))) if demandprofile? and demandprofile != ""
    id = $(xml).attr('id')
    obj.set('id', Number(id)) if id? and id != ""
    project_id = $(xml).attr('project_id')
    obj.set('project_id', Number(project_id)) if project_id? and project_id != ""
    name = $(xml).attr('name')
    obj.set('name', name) if name? and name != ""
    crudFlag = $(xml).attr('crudFlag')
    obj.set('crudFlag', crudFlag) if crudFlag? and crudFlag != ""
    mod_stamp = $(xml).attr('mod_stamp')
    obj.set('mod_stamp', mod_stamp) if mod_stamp? and mod_stamp != ""
    if obj.resolve_references
      obj.resolve_references(deferred, object_with_id)
    obj
  
  to_xml: (doc) ->
    xml = doc.createElement('DemandSet')
    if @encode_references
      @encode_references()
    xml.appendChild(@get('description').to_xml(doc)) if @has('description')
    _.each(@get('demandprofile') || [], (a_demandprofile) -> xml.appendChild(a_demandprofile.to_xml(doc)))
    xml.setAttribute('id', @get('id')) if @has('id')
    xml.setAttribute('project_id', @get('project_id')) if @has('project_id')
    if @has('name') && @name != "" then xml.setAttribute('name', @get('name'))
    xml.setAttribute('crudFlag', @get('crudFlag')) if @has('crudFlag')
    if @has('mod_stamp') && @mod_stamp != "0" then xml.setAttribute('mod_stamp', @get('mod_stamp'))
    xml
  
  deep_copy: -> DemandSet.from_xml1(@to_xml(), {})
  inspect: (depth = 1, indent = false, orig_depth = -1) -> null
  make_tree: -> null