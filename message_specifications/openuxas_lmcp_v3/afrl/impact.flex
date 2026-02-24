// LMCP is releasable to the public domain under the Air Force Open Source Agreement Version 1.0.
module OpenUxAS::LMCP::v3.afrl.impact

import OpenUxAS::LMCP::v3.afrl.cmasi ( SearchTask, VehicleAction, Wedge, AltitudeType, PayloadConfiguration, AbstractGeometry, PayloadState, LoiterAction, AutomationResponse, Location3D, EntityState, Waypoint, AutomationRequest, EntityConfiguration, Task, AbstractZone )


struct VehicleSummary {
  VehicleID: int64;
  DestinationTaskID: int64;
  InitialTaskID: int64;
  InitialTaskPercentage: float32;
  EstimateTimeToTaskPercentage: int64;
  TimeToArrive: int64;
  TimeOnTask: int64;
  EnergyRemaining: float32;
  BeyondCommRange: bit;
}

struct SurfaceVehicleConfiguration extends EntityConfiguration {
  WaterArea: int64;
  MinimumSpeed: float32;
  MaximumSpeed: float32;
  EnergyRate: float32;
  MaxBankAngle: float32;
  MaxBankRate: float32;
}

struct AreaOfInterest {
  AreaID: int64;
  Area: AbstractGeometry;
}

struct RadioState extends PayloadState {
  Enabled: bit;
  InRange: bit;
}

struct EscortTask extends SearchTask {
  SupportedEntityID: int64;
  RouteID: int64;
  PrescribedWaypoints: Waypoint[];
  StandoffDistance: float32;
}

enum ImpactPayloadType int32 {
  Unknown = 0;
  EO = 1;
  FLIR = 2;
  MWIR = 3;
  LFIR = 4;
  Track = 5;
  Tag = 6;
  Megaphone = 7;
  Siren = 8;
  SearchLight = 9;
  FiftyCal = 10;
  M240B = 11;
  Flashbang = 12;
  TearGas = 13;
  Taser = 14;
  HeatBeam = 15;
  SEGM = 16;
  CommRelay = 17;
  GMTI = 18;
  LaserDesignator = 19;
}

struct ImpactPayloadConfiguration extends PayloadConfiguration {
  AvailablePayloads: ImpactPayloadType[];
}

struct TaskSummary {
  TaskID: int64;
  PerformingVehicles: VehicleSummary[];
  BestEffort: float32;
}

enum PowerPlant int32 {
  Gasoline = 0;
  JP5 = 1;
  JP8 = 2;
  FuelCell = 3;
  Hybrid = 4;
}

struct PowerConfiguration extends PayloadConfiguration {
  NominalPowerConfiguration: PowerPlant;
}

enum AreaSearchPattern int32 {
  Spiral = 0;
  Sector = 1;
  Sweep = 2;
}

struct CommRelayTask extends Task {
  SupportedEntityID: int64;
  DestinationLocation: Location3D;
  TowerID: int64;
}

struct ImpactComponentLeave {
  ComponentLabel: string;
}

struct ImpactPointSearchTask extends SearchTask {
  SearchLocationID: int64;
  SearchLocation: Location3D;
  StandoffDistance: float32;
  ViewAngleList: Wedge[];
  DesiredAction: LoiterAction;
}

struct SpeedAltPair {
  VehicleID: int64;
  Speed: float32;
  Altitude: float32;
  AltitudeType: AltitudeType;
}

struct ImpactAutomationRequest {
  RequestID: int64;
  TrialRequest: AutomationRequest;
  OverridePlanningConditions: SpeedAltPair[];
  PlayID: int64;
  SolutionID: int64;
  Sandbox: bit;
}

struct WaterZone extends AbstractZone {

}

struct ImpactAutomationResponse {
  ResponseID: int64;
  TrialResponse: AutomationResponse;
  PlayID: int64;
  SolutionID: int64;
  Sandbox: bit;
  Summaries: TaskSummary[];
}

struct ConfigurationRequest {
  VehicleID: int64[];
}

struct ImpactLineSearchTask extends SearchTask {
  LineID: int64;
  ViewAngleList: Wedge[];
  UseInertialViewAngles: bit;
}

struct RadioTowerState extends EntityState {
  Enabled: bit;
}

struct PointOfInterest {
  PointID: int64;
  Location: Location3D;
}

struct GroundVehicleState extends EntityState {

}

struct PatternSearchTask extends SearchTask {
  SearchLocationID: int64;
  SearchLocation: Location3D;
  Pattern: AreaSearchPattern;
  Extent: float32;
}

struct BlockadeTask extends Task {
  BlockedEntityID: int64;
  StandoffDistance: float32;
  NumberVehicles: uint8;
  ProtectedLocation: Location3D;
}

struct BatchSummaryResponse {
  ResponseID: int64;
  Summaries: TaskSummary[];
}

struct WatchTask extends SearchTask {
  WatchedEntityID: int64;
}

struct CordonTask extends Task {
  CordonLocation: Location3D;
  StandoffDistance: float32;
}

struct GroundVehicleConfiguration extends EntityConfiguration {
  RoadGraphID: int64;
  MinimumSpeed: float32;
  MaximumSpeed: float32;
  EnergyRate: float32;
}

struct SurfaceVehicleState extends EntityState {
  BankAngle: float32;
  Speed: float32;
}

struct RadioTowerConfiguration extends EntityConfiguration {
  Position: Location3D;
  Range: float32;
  Enabled: bit;
}

struct LineOfInterest {
  LineID: int64;
  Line: Location3D[];
}

struct MultiVehicleWatchTask extends SearchTask {
  WatchedEntityID: int64;
  NumberVehicles: uint8;
}

struct TaskTimingPair {
  VehicleID: int64;
  InitialTaskID: int64;
  InitialTaskPercentage: float32;
  DestinationTaskID: int64;
  TimeToGo: int64;
}

struct AngledAreaSearchTask extends SearchTask {
  SearchAreaID: int64;
  SweepAngle: float32;
  StartPoint: Location3D;
}

struct RadioConfiguration extends PayloadConfiguration {
  Range: float32;
  RallyPoint: Location3D;
  Timeout: int64;
}

struct DeployImpactPayload extends VehicleAction {
  VehicleID: int64;
  DeployedPayload: ImpactPayloadType;
  TargetEntityID: int64;
}

struct BatchSummaryRequest {
  RequestID: int64;
  Vehicles: int64[];
  TaskList: int64[];
  InterTaskPercentage: float32[];
  OperatingRegion: int64;
}

struct BatchRoutePlanRequest {
  RequestID: int64;
  Vehicles: int64[];
  TaskList: int64[];
  OperatingRegion: int64;
  ComputeTaskToTaskTiming: bit;
  ComputeInterTaskToTaskTiming: bit;
  InterTaskPercentage: float32[];
}

struct ImpactHeartbeat {
  ComponentLabel: string;
  HeartbeatTime: int64;
}

struct BatchRoutePlanResponse {
  ResponseID: int64;
  VehicleTiming: TaskTimingPair[];
}

struct PowerPlantState extends PayloadState {
  ActivePowerPlant: PowerPlant;
}

struct WaterReport {
  Area: AbstractGeometry;
  CurrentSpeed: float32;
  CurrentDirection: float32;
  WaveDirection: float32;
  WaveHeight: float32;
}

struct ImpactComponentJoin {
  ComponentLabel: string;
}

