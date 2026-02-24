// LMCP is releasable to the public domain under the Air Force Open Source Agreement Version 1.0.
module OpenUxAS::LMCP::v3.uxas.messages.route

import OpenUxAS::LMCP::v3.afrl.cmasi ( Waypoint, KeyValuePair, Location3D )


struct RouteConstraints {
  RouteID: int64;
  StartLocation: Location3D;
  StartHeading: float32;
  UseStartHeading: bit;
  EndLocation: Location3D;
  EndHeading: float32;
  UseEndHeading: bit;
}

struct RouteRequest {
  RequestID: int64;
  AssociatedTaskID: int64;
  VehicleID: int64[];
  OperatingRegion: int64;
  RouteRequests: RouteConstraints[];
  IsCostOnlyRequest: bit;
}

struct RoutePlan {
  RouteID: int64;
  Waypoints: Waypoint[];
  RouteCost: int64;
  RouteError: KeyValuePair[];
}

struct RoutePlanResponse {
  ResponseID: int64;
  AssociatedTaskID: int64;
  VehicleID: int64;
  OperatingRegion: int64;
  RouteResponses: RoutePlan[];
}

struct RouteResponse {
  ResponseID: int64;
  Routes: RoutePlanResponse[];
}

struct GraphEdge {
  EdgeID: int64;
  StartNode: int64;
  EndNode: int64;
  Waypoints: Location3D[];
}

struct GraphNode {
  NodeID: int64;
  Coordinates: Location3D;
  AssociatedEdges: int64[];
}

struct GraphRegion {
  ID: int64;
  NodeList: GraphNode[];
  EdgeList: GraphEdge[];
}

struct EgressRouteResponse {
  ResponseID: int64;
  NodeLocations: Location3D[];
  Headings: float32[];
}

struct EgressRouteRequest {
  RequestID: int64;
  StartLocation: Location3D;
  Radius: float32;
}

struct RoutePlanRequest {
  RequestID: int64;
  AssociatedTaskID: int64;
  VehicleID: int64;
  OperatingRegion: int64;
  RouteRequests: RouteConstraints[];
  IsCostOnlyRequest: bit;
}

