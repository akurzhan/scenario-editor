class window.sirius.SplitratioEvent extends Backbone.Model
  ### $a = alias for sirius namespace ###
  $a = window.sirius
  @from_xml1: (xml, object_with_id) ->
    deferred = []
    obj = @from_xml2(xml, deferred, object_with_id)
    fn() for fn in deferred
    obj
  
  @from_xml2: (xml, deferred, object_with_id) ->
    return null if (not xml? or xml.length == 0)
    obj = new window.sirius.SplitratioEvent()
    VehicleTypeOrder = xml.children('VehicleTypeOrder')
    obj.set('vehicletypeorder', $a.VehicleTypeOrder.from_xml2(VehicleTypeOrder, deferred, object_with_id))
    splitratio = xml.children('splitratio')
    obj.set('splitratio', _.map($(splitratio), (splitratio_i) -> $a.Splitratio.from_xml2($(splitratio_i), deferred, object_with_id)))
    if obj.resolve_references
      obj.resolve_references(deferred, object_with_id)
    obj
  
  to_xml: (doc) ->
    xml = doc.createElement('splitratioEvent')
    if @encode_references
      @encode_references()
    xml.appendChild(@get('vehicletypeorder').to_xml(doc)) if @has('vehicletypeorder')
    _.each(@get('splitratio') || [], (a_splitratio) -> xml.appendChild(a_splitratio.to_xml(doc)))
    xml
  
  deep_copy: -> SplitratioEvent.from_xml1(@to_xml(), {})
  inspect: (depth = 1, indent = false, orig_depth = -1) -> null
  make_tree: -> null