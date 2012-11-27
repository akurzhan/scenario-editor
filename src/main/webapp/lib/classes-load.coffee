$a = window.beats

$a.models_with_extensions = [ 'Begin', 'CapacityProfile',
  'Controller', 'ControllerSet', 'DemandProfile',
  'Density', 'Display_position', 'Dynamics', 'End', 'Event', 'EventSet',
  'FundamentalDiagramProfile', 'Input', 'Intersection', 'Link', 'LinkList',
  'Network', 'NetworkList', 'Node', 'NodeList', 'Output',
  'Phase', 'Plan', 'PlanList', 'PlanSequence', 'Point', 'Position',  'Scenario',
  'Sensor', 'SensorList', 'Settings', 'Signal', 'SignalList',
  'Splitratio', 'SplitratioProfile'
]

$a.models_without_extensions = [ 'ActivationIntervals', 'Beats'
  'Column', 'Column_name', 'Column_names', 'DemandProfileSet', 'Description', 
  'DestinationNetworks', 'DownstreamBoundaryCapacityProfileSet',
  'FeedbackElements', 'FundamentalDiagram', 'FundamentalDiagramProfileSet',
  'InitialDensitySet', 'Inputs', 'IntersectionCacheEntry',
  'IntersectionCache', 'Interval', 'Link_reference', 'Link_references', 
  'Linkpair', 'Marker', 'NetworkConnections', 'Networkpair', 'Outputs',
  'Parameter', 'Parameters', 'Plan_reference', 'Queue_controller', 
  'Road', 'Roads', 'Roadway_markers', 'Route', 'Routes', 'Row'
  'ScenarioElement', 'Shape', 'SplitratioEvent',
  'SplitRatioProfileSet', 'Stage', 'Table', 'TargetElements', 'Units',
  'Vehicle_type', 'VehicleTypes', 'VehicleTypeOrder',
  'Weavingfactors', 'WeavingFactorSet' ]

$a.collections = ['NodeListCollection','NodeListView', 
  'LinkListCollection', 'LinkListView', 'SensorListCollection', 'SensorListView',
  'ControllerSetCollection', 'ControllerSetView'
]

$a.map_views = [
  'AppView', 'BrowserView', 'BrowserTypeView',  
  'ContextMenuItemView', 'ContextMenuView', 'DemandVisualizer', 'EditorView',
  'EditorLinkView', 'EditorSensorView', 'EditorNodeView', 'FileUploadView',
  'LayersMenuView', 'LayersMenuViewItem', 'MapLinkView', 'MapMarkerView',
  'MapNetworkView', 'MapNodeView', 'MapSensorView', 'MapControllerView', 
  'MapEventView', 'MapSignalView', 'MessagePanelView', 'TreeView',
  'TreeParentItemView', 'TreeChildItemView',
  'TreeChildItemLinkView', 'TreeChildItemNetworkView', 'TreeChildItemNodeView',
  'NavBarView','NavParentItemView','NavChildItemView'
]

$a.utils= ['ArrayText',  'ContextMenuHandler', 'GoogleMapRouteHandler', 
  'ReferenceHelper', 'Util'
]
