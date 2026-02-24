// LMCP is releasable to the public domain under the Air Force Open Source Agreement Version 1.0.
module OpenUxAS::LMCP::v3.uxas.messages.task

import OpenUxAS::LMCP::v3.afrl.cmasi ( Waypoint, WavelengthBand, AutomationRequest, AutomationResponse, Location3D, Task )


struct TaskAssignment {
  TaskID: int64;
  OptionID: int64;
  AssignedVehicle: int64;
  TimeThreshold: int64;
  TimeTaskCompleted: int64;
}

struct CancelTask {
  Vehicles: int64[];
  CanceledTasks: int64[];
}

struct SensorFootprint {
  FootprintResponseID: int64;
  VehicleID: int64;
  CameraID: int64;
  GimbalID: int64;
  HorizontalFOV: float32;
  AglAltitude: float32;
  GimbalElevation: float32;
  AspectRatio: float32;
  AchievedGSD: float32;
  CameraWavelength: WavelengthBand;
  HorizontalToLeadingEdge: float32;
  HorizontalToTrailingEdge: float32;
  HorizontalToCenter: float32;
  WidthCenter: float32;
  SlantRangeToCenter: float32;
}

struct TaskActive {
  TaskID: int64;
  EntityID: int64;
  TimeTaskActivated: int64;
}

struct TaskOptionCost {
  VehicleID: int64;
  IntialTaskID: int64;
  IntialTaskOption: int64;
  DestinationTaskID: int64;
  DestinationTaskOption: int64;
  TimeToGo: int64;
}

struct FootprintRequest {
  FootprintRequestID: int64;
  VehicleID: int64;
  EligibleWavelengths: WavelengthBand[];
  GroundSampleDistances: float32[];
  AglAltitudes: float32[];
  ElevationAngles: float32[];
}

struct TaskAssignmentSummary {
  CorrespondingAutomationRequestID: int64;
  OperatingRegion: int64;
  TaskList: TaskAssignment[];
}

struct TaskInitialized {
  TaskID: int64;
}

struct TaskProgressRequest {
  RequestID: int64;
  TaskID: int64;
}

struct AssignmentCoordinatorTask extends Task {

}

struct TaskImplementationRequest {
  RequestID: int64;
  StartingWaypointID: int64;
  VehicleID: int64;
  StartPosition: Location3D;
  StartHeading: float32;
  StartTime: int64;
  RegionID: int64;
  TaskID: int64;
  OptionID: int64;
  TimeThreshold: int64;
}

struct TaskComplete {
  TaskID: int64;
  EntitiesInvolved: int64[];
  TimeTaskCompleted: int64;
}

struct TaskOption {
  TaskID: int64;
  OptionID: int64;
  EligibleEntities: int64[];
  Cost: int64;
  StartLocation: Location3D;
  StartHeading: float32;
  EndLocation: Location3D;
  EndHeading: float32;
}

struct TaskPlanOptions {
  CorrespondingAutomationRequestID: int64;
  TaskID: int64;
  Composition: string;
  Options: TaskOption[];
}

struct TaskImplementationResponse {
  ResponseID: int64;
  TaskID: int64;
  OptionID: int64;
  VehicleID: int64;
  TaskWaypoints: Waypoint[];
  FinalLocation: Location3D;
  FinalHeading: float32;
  FinalTime: int64;
}

struct TaskPause {
  TaskID: int64;
}

struct PlanningState {
  EntityID: int64;
  PlanningPosition: Location3D;
  PlanningHeading: float32;
}

struct CoordinatedAutomationRequest {
  RequestID: int64;
  MaximumResponseTime: int64;
  OriginalRequest: AutomationRequest;
  PlanningStates: PlanningState[];
}

struct TaskAutomationResponse {
  ResponseID: int64;
  OriginalResponse: AutomationResponse;
}

struct AssignmentCostMatrix {
  CorrespondingAutomationRequestID: int64;
  TaskLevelRelationship: string;
  TaskList: int64[];
  OperatingRegion: int64;
  CostMatrix: TaskOptionCost[];
}

struct TaskAutomationRequest {
  RequestID: int64;
  OriginalRequest: AutomationRequest;
  SandBoxRequest: bit;
  PlanningStates: PlanningState[];
}

struct SensorFootprintResponse {
  ResponseID: int64;
  Footprints: SensorFootprint[];
}

struct AssignmentCoordination {
  CoordinatedAutomationRequestID: int64;
  PlanningState: PlanningState;
}

struct TaskResume {
  TaskID: int64;
  RestartCompletely: bit;
  ReAssign: TaskAssignment;
}

struct UniqueAutomationRequest {
  RequestID: int64;
  OriginalRequest: AutomationRequest;
  SandBoxRequest: bit;
  PlanningStates: PlanningState[];
}

struct SensorFootprintRequests {
  RequestID: int64;
  Footprints: FootprintRequest[];
}

struct UniqueAutomationResponse {
  ResponseID: int64;
  OriginalResponse: AutomationResponse;
}

struct TaskProgress {
  ResponseID: int64;
  TaskID: int64;
  PercentComplete: float32;
  EntitiesEngaged: int64[];
}

