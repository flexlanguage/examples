// LMCP is releasable to the public domain under the Air Force Open Source Agreement Version 1.0.
module OpenUxAS::LMCP::v3.afrl.cmasi




message struct KeyValuePair {
  Key: string;
  Value: string;
}

extensible message struct Task {
  TaskID: int64;
  Label: string;
  EligibleEntities: int64[];
  RevisitRate: float32;
  Parameters: KeyValuePair[];
  Priority: uint8;
  Required: bit;
}

enum WavelengthBand int32 {
  AllAny = 0;
  EO = 1;
  LWIR = 2;
  SWIR = 3;
  MWIR = 4;
  Other = 5;
}

extensible message struct SearchTask extends Task {
  DesiredWavelengthBands: WavelengthBand[];
  DwellTime: int64;
  GroundSampleDistance: float32;
}

message struct Wedge {
  AzimuthCenterline: float32;
  VerticalCenterline: float32;
  AzimuthExtent: float32;
  VerticalExtent: float32;
}

abstract extensible message struct AbstractGeometry {

}

message struct AreaSearchTask extends SearchTask {
  SearchArea: AbstractGeometry;
  ViewAngleList: Wedge[];
}

enum SimulationStatusType int32 {
  Stopped = 0;
  Running = 1;
  Paused = 2;
  Reset = 3;
}

message struct SessionStatus {
  State: SimulationStatusType;
  StartTime: int64;
  ScenarioTime: int64;
  RealTimeMultiple: float32;
  Parameters: KeyValuePair[];
}

extensible message struct PayloadConfiguration {
  PayloadID: int64;
  PayloadKind: string;
  Parameters: KeyValuePair[];
}

message struct VideoStreamConfiguration extends PayloadConfiguration {
  AvailableSensorList: int64[];
}

enum AltitudeType int32 {
  AGL = 0;
  MSL = 1;
}

extensible message struct AbstractZone {
  ZoneID: int64;
  MinAltitude: float32;
  MinAltitudeType: AltitudeType;
  MaxAltitude: float32;
  MaxAltitudeType: AltitudeType;
  AffectedAircraft: int64[];
  StartTime: int64;
  EndTime: int64;
  Padding: float32;
  Label: string;
  Boundary: AbstractGeometry;
}

enum ZoneAvoidanceType int32 {
  Physical = 0;
  Regulatory = 1;
  Acoustic = 2;
  Threat = 3;
  Visual = 4;
}

extensible message struct KeepOutZone extends AbstractZone {
  ZoneType: ZoneAvoidanceType;
}

enum LoiterDirection int32 {
  VehicleDefault = 0;
  CounterClockwise = 1;
  Clockwise = 2;
}

enum CommandStatusType int32 {
  Pending = 0;
  Approved = 1;
  InProcess = 2;
  Executed = 3;
  Cancelled = 4;
}

extensible message struct VehicleAction {
  AssociatedTaskList: int64[];
}

extensible message struct VehicleActionCommand {
  CommandID: int64;
  VehicleID: int64;
  VehicleActionList: VehicleAction[];
  Status: CommandStatusType;
}

enum SpeedType int32 {
  Airspeed = 0;
  Groundspeed = 1;
}

extensible message struct Location3D {
  Latitude: float64;
  Longitude: float64;
  Altitude: float32;
  AltitudeType: AltitudeType;
}

enum TurnType int32 {
  TurnShort = 0;
  FlyOver = 1;
}

extensible message struct Waypoint extends Location3D {
  Number: int64;
  NextWaypoint: int64;
  Speed: float32;
  SpeedType: SpeedType;
  ClimbRate: float32;
  TurnType: TurnType;
  VehicleActionList: VehicleAction[];
  ContingencyWaypointA: int64;
  ContingencyWaypointB: int64;
  AssociatedTasks: int64[];
}

message struct MissionCommand extends VehicleActionCommand {
  WaypointList: Waypoint[];
  FirstWaypoint: int64;
}

message struct AutomationResponse {
  MissionCommandList: MissionCommand[];
  VehicleCommandList: VehicleActionCommand[];
  Info: KeyValuePair[];
}

message struct AutomationRequest {
  EntityList: int64[];
  TaskList: int64[];
  TaskRelationships: string;
  OperatingRegion: int64;
  RedoAllTasks: bit;
}

enum TravelMode int32 {
  SinglePass = 0;
  ReverseCourse = 1;
  Loop = 2;
}

message struct PathWaypoint extends Waypoint {
  PauseTime: int64;
}

message struct FollowPathCommand extends VehicleActionCommand {
  FirstWaypoint: int64;
  WaypointList: PathWaypoint[];
  StartTime: int64;
  StopTime: int64;
  RepeatMode: TravelMode;
}

enum LoiterType int32 {
  VehicleDefault = 0;
  Circular = 1;
  Racetrack = 2;
  FigureEight = 3;
  Hover = 4;
}

extensible message struct NavigationAction extends VehicleAction {

}

message struct LoiterAction extends NavigationAction {
  LoiterType: LoiterType;
  Radius: float32;
  Axis: float32;
  Length: float32;
  Direction: LoiterDirection;
  Duration: int64;
  Airspeed: float32;
  Location: Location3D;
}

extensible message struct PayloadState {
  PayloadID: int64;
  Parameters: KeyValuePair[];
}

enum GimbalPointingMode int32 {
  Unknown = 0;
  AirVehicleRelativeAngle = 1;
  AirVehicleRelativeSlewRate = 2;
  LatLonSlaved = 3;
  InertialRelativeSlewRate = 4;
  Scan = 5;
  Stowed = 6;
}

extensible message struct GimballedPayloadState extends PayloadState {
  PointingMode: GimbalPointingMode;
  Azimuth: float32;
  Elevation: float32;
  Rotation: float32;
}

enum NavigationMode int32 {
  Waypoint = 0;
  Loiter = 1;
  FlightDirector = 2;
  TargetTrack = 3;
  FollowLeader = 4;
  LostComm = 5;
}

extensible message struct EntityState {
  ID: int64;
  u: float32;
  v: float32;
  w: float32;
  udot: float32;
  vdot: float32;
  wdot: float32;
  Heading: float32;
  Pitch: float32;
  Roll: float32;
  p: float32;
  q: float32;
  r: float32;
  Course: float32;
  Groundspeed: float32;
  Location: Location3D;
  EnergyAvailable: float32;
  ActualEnergyRate: float32;
  PayloadStateList: PayloadState[];
  CurrentWaypoint: int64;
  CurrentCommand: int64;
  Mode: NavigationMode;
  AssociatedTasks: int64[];
  Time: int64;
  Info: KeyValuePair[];
}

message struct AirVehicleState extends EntityState {
  Airspeed: float32;
  VerticalSpeed: float32;
  WindSpeed: float32;
  WindDirection: float32;
}

message struct GimbalState extends PayloadState {
  PointingMode: GimbalPointingMode;
  Azimuth: float32;
  Elevation: float32;
  Rotation: float32;
}

extensible message struct PayloadAction extends VehicleAction {
  PayloadID: int64;
}

message struct CameraAction extends PayloadAction {
  HorizontalFieldOfView: float32;
  AssociatedActions: PayloadAction[];
}

enum FOVOperationMode int32 {
  Continuous = 0;
  Discrete = 1;
}

message struct CameraConfiguration extends PayloadConfiguration {
  SupportedWavelengthBand: WavelengthBand;
  FieldOfViewMode: FOVOperationMode;
  MinHorizontalFieldOfView: float32;
  MaxHorizontalFieldOfView: float32;
  DiscreteHorizontalFieldOfViewList: float32[];
  VideoStreamHorizontalResolution: uint32;
  VideoStreamVerticalResolution: uint32;
}

message struct VideoStreamState extends PayloadState {
  ActiveSensor: int64;
}

message struct KeepInZone extends AbstractZone {

}

message struct StopMovementAction extends VehicleAction {
  Location: Location3D;
}

extensible message struct EntityConfiguration {
  ID: int64;
  Affiliation: string;
  EntityType: string;
  Label: string;
  NominalSpeed: float32;
  NominalAltitude: float32;
  NominalAltitudeType: AltitudeType;
  PayloadConfigurationList: PayloadConfiguration[];
  Info: KeyValuePair[];
}

message struct Polygon extends AbstractGeometry {
  BoundaryPoints: Location3D[];
}

message struct CameraState extends GimballedPayloadState {
  HorizontalFieldOfView: float32;
  VerticalFieldOfView: float32;
  Footprint: Location3D[];
  Centerpoint: Location3D;
}

message struct PointSearchTask extends SearchTask {
  SearchLocation: Location3D;
  StandoffDistance: float32;
  ViewAngleList: Wedge[];
}

message struct RemoveZones {
  ZoneList: int64[];
}

enum ServiceStatusType int32 {
  Information = 0;
  Warning = 1;
  Error = 2;
}

message struct ServiceStatus {
  PercentComplete: float32;
  Info: KeyValuePair[];
  StatusType: ServiceStatusType;
}

message struct GimbalScanAction extends PayloadAction {
  AzimuthSlewRate: float32;
  ElevationSlewRate: float32;
  StartAzimuth: float32;
  EndAzimuth: float32;
  StartElevation: float32;
  EndElevation: float32;
  Cycles: uint32;
}

message struct Circle extends AbstractGeometry {
  CenterPoint: Location3D;
  Radius: float32;
}

message struct RemoveEntities {
  EntityList: int64[];
}

message struct LoiterTask extends Task {
  DesiredAction: LoiterAction;
}

message struct RemoveTasks {
  TaskList: int64[];
}

message struct Rectangle extends AbstractGeometry {
  CenterPoint: Location3D;
  Width: float32;
  Height: float32;
  Rotation: float32;
}

message struct FlightProfile {
  Name: string;
  Airspeed: float32;
  PitchAngle: float32;
  VerticalSpeed: float32;
  MaxBankAngle: float32;
  EnergyRate: float32;
}

message struct MustFlyTask extends Task {
  Position: Location3D;
  UseAltitude: bit;
}

message struct FlightDirectorAction extends NavigationAction {
  Speed: float32;
  SpeedType: SpeedType;
  Heading: float32;
  Altitude: float32;
  AltitudeType: AltitudeType;
  ClimbRate: float32;
}

enum WaypointTransferMode int32 {
  RequestWaypoints = 0;
  AddWaypoints = 1;
  ClearWaypoints = 2;
  ReportWaypoints = 3;
}

message struct WeatherReport {
  Area: AbstractZone;
  WindSpeed: float32;
  WindDirection: float32;
  Visibility: float32;
  CloudCeiling: float32;
  CloudCoverage: float32;
}

message struct GimbalAngleAction extends PayloadAction {
  Azimuth: float32;
  Elevation: float32;
  Rotation: float32;
}

message struct LineSearchTask extends SearchTask {
  PointList: Location3D[];
  ViewAngleList: Wedge[];
  UseInertialViewAngles: bit;
}

message struct AirVehicleConfiguration extends EntityConfiguration {
  MinimumSpeed: float32;
  MaximumSpeed: float32;
  NominalFlightProfile: FlightProfile;
  AlternateFlightProfiles: FlightProfile[];
  AvailableLoiterTypes: LoiterType[];
  AvailableTurnTypes: TurnType[];
  MinimumAltitude: float32;
  MinAltitudeType: AltitudeType;
  MaximumAltitude: float32;
  MaxAltitudeType: AltitudeType;
}

message struct VideoStreamAction extends VehicleAction {
  VideoStreamID: int32;
  ActiveSensor: int32;
}

message struct GimbalConfiguration extends PayloadConfiguration {
  SupportedPointingModes: GimbalPointingMode[];
  MinAzimuth: float32;
  MaxAzimuth: float32;
  IsAzimuthClamped: bit;
  MinElevation: float32;
  MaxElevation: float32;
  IsElevationClamped: bit;
  MinRotation: float32;
  MaxRotation: float32;
  IsRotationClamped: bit;
  MaxAzimuthSlewRate: float32;
  MaxElevationSlewRate: float32;
  MaxRotationRate: float32;
  ContainedPayloadList: int64[];
}

message struct WaypointTransfer {
  EntityID: int64;
  Waypoints: Waypoint[];
  TransferMode: WaypointTransferMode;
}

message struct OperatorSignal {
  Signals: KeyValuePair[];
}

message struct GoToWaypointAction extends NavigationAction {
  WaypointNumber: int64;
}

message struct OperatingRegion {
  ID: int64;
  KeepInAreas: int64[];
  KeepOutAreas: int64[];
}

message struct GimbalStareAction extends PayloadAction {
  Starepoint: Location3D;
  Duration: int64;
}

message struct PayloadStowAction {
  PayloadID: int64;
}

