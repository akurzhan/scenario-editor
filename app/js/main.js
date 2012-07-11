// Generated by CoffeeScript 1.3.1
(function() {
  var load_sirius_classes, sirius_classes_with_extensions, sirius_classes_without_extensions, sirius_map_view_classes;

  sirius_classes_with_extensions = ['Begin', 'Controller', 'ControllerSet', 'Data_sources', 'Density', 'Display_position', 'Dynamics', 'End', 'Event', 'EventSet', 'Input', 'Intersection', 'Link', 'LinkList', 'Network', 'NetworkList', 'Node', 'NodeList', 'Od', 'ODList', 'Output', 'Phase', 'Plan', 'PlanList', 'PlanSequence', 'Point', 'Position', 'Scenario', 'Sensor', 'SensorList', 'Settings', 'Signal', 'SignalList'];

  sirius_classes_without_extensions = ['ALatLng', 'CapacityProfile', 'Data_source', 'Decision_point', 'Decision_point_split', 'Decision_points', 'DecisionPoints', 'DemandProfile', 'DemandProfileSet', 'Description', 'DirectionsCacheEntry', 'DirectionsCache', 'DownstreamBoundaryCapacityProfileSet', 'EncodedPolyline', 'FeedbackElements', 'From', 'FundamentalDiagram', 'FundamentalDiagramProfile', 'FundamentalDiagramProfileSet', 'InitialDensitySet', 'Inputs', 'IntersectionCacheEntry', 'IntersectionCache', 'Knob', 'Lane_count_change', 'Levels', 'LinkGeometry', 'Link_reference', 'Linkpair', 'Links', 'NetworkConnections', 'Networkpair', 'Od_demandProfile', 'ODDemandProfileSet', 'Outputs', 'On_off_switch', 'Outputs', 'Parameter', 'Parameters', 'Plan_reference', 'Points', 'Postmile', 'Qcontroller', 'Route_segment', 'Route_segments', 'RouteSegments', 'ScenarioElement', 'Splitratio', 'SplitratioEvent', 'SplitratioProfile', 'SplitRatioProfileSet', 'Stage', 'TargetElements', 'To', 'Units', 'Vehicle_type', 'VehicleTypes', 'VehicleTypeOrder', 'Weavingfactors', 'WeavingfactorSet'];

  sirius_map_view_classes = ['MapNetworkModel', 'AppView', 'MapLinkView', 'MapMarkerView', 'MapNetworkView', 'MapNodeView', 'MapSensorView', 'MapControllerView', 'MapEventView', 'MapSignalView', 'Util', 'TreeView', 'TreeParentItemView', 'TreeChildItemView', 'NavBarView', 'NavParentItemView', 'NavChildItemView', 'FileUploadView'];

  load_sirius_classes = function(after) {
    return head.js("js/Sirius.js", function() {
      var class_paths;
      class_paths = _.map(sirius_classes_without_extensions, function(cname) {
        return "js/" + cname + ".js";
      });
      class_paths = class_paths.concat(_.flatten(_.map(sirius_map_view_classes, function(cname) {
        return "js/" + cname + ".js";
      })));
      class_paths = class_paths.concat(_.flatten(_.map(sirius_classes_with_extensions, function(cname) {
        return ["js/" + cname + ".js", "js/extensions/" + cname + ".js"];
      })));
      class_paths.push(after);
      return head.js.apply(this, class_paths);
    });
  };

  window.load_context_menu_and_app_view = function() {
    return head.js('js/LayersHandlerItem.js', 'js/LayersHandler.js', 'js/menu-data.js', '../libs/js/ContextMenu.js', function() {
      var lmenu;
      window.sirius.broker = _.clone(Backbone.Events);
      new window.sirius.AppView();
      lmenu = new window.LayersHandler({});
      lmenu.createHTML();
      return lmenu.attachEvents();
    });
  };

  head.js('https://www.google.com/jsapi', '../libs/js/jquery-1.7.1.js', '../libs/js/jquery-ui-1.8.18.min.js', '../libs/js/underscore.js', '../libs/js/backbone.js', '../libs/js/bootstrap/js/bootstrap.js', function() {
    return load_sirius_classes(function() {
      return google.load("maps", "3", {
        callback: "window.load_context_menu_and_app_view()",
        other_params: "libraries=geometry,drawing&sensor=false"
      });
    });
  });

}).call(this);
