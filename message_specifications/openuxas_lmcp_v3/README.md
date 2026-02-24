# OpenUxAS LMCP v3

[Flex](https://flexlang.org/) interface specifications for the Lightweight Message Construction Protocol (LMCP) v3, as used by [OpenUxAS](https://github.com/afrl-rq/OpenAMASE/) — an open-source multi-UAV mission automation system from the Air Force Research Laboratory (AFRL/RQ).

## Overview

LMCP (Lightweight Message Construction Protocol) defines the machine-to-machine communication data structures for UAV mission planning and autonomy. This package provides [Flex](https://flexlang.org/) specifications covering the full CMASI (Common Mission Automation Services Interface) message set, the IMPACT extended mission types, and UxAS-native routing, task coordination, and service control messages.

All types use MKSD units and WGS84 Earth coordinates, as defined in the upstream [CMASI specification](https://github.com/afrl-rq/OpenAMASE/blob/master/OpenAMASE/docs/lmcp/CMASI.xml). This module is released to the public domain under the Air Force Open Source Agreement Version 1.0.

## Module Structure

| File                                                         | Description                                                                                                                  |
|--------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------|
| [`afrl/cmasi.flex`](afrl/cmasi.flex)                         | Core CMASI types: geometry, zones, entity state/config, payloads, tasks, navigation actions, and automation request/response |
| [`afrl/cmasi/perceive.flex`](afrl/cmasi/perceive.flex)       | Entity perception and tracking actions                                                                                       |
| [`afrl/impact.flex`](afrl/impact.flex)                       | IMPACT extension: multi-vehicle types, specialized tasks, batch planning, and operational infrastructure                     |
| [`uxas/messages/route.flex`](uxas/messages/route.flex)       | Route planning requests, responses, and graph structures                                                                     |
| [`uxas/messages/task.flex`](uxas/messages/task.flex)         | Task lifecycle, assignment coordination, sensor footprints, and automation pipeline                                          |
| [`uxas/messages/uxnative.flex`](uxas/messages/uxnative.flex) | UxAS service control: entity lifecycle, autopilot keepalive, bandwidth testing, and sub-task execution                       |

## Key Types

### `afrl/cmasi.flex`

**Geometry** — spatial primitives used across zones and tasks:
- `AbstractGeometry` — abstract base for all geometric shapes
- `Location3D` — WGS84 lat/lon point with altitude and altitude type
- `Circle`, `Polygon`, `Rectangle` — concrete geometric shapes
- `Wedge` — angular range constraint (azimuth/elevation centerline and extent)

**Zones** — operational boundaries:
- `AbstractZone` — base with altitude bounds, time window, and affected aircraft
- `KeepInZone` — required operating area
- `KeepOutZone` — prohibited area classified by `ZoneAvoidanceType` (Physical, Regulatory, Acoustic, Threat, Visual)
- `OperatingRegion` — named combination of keep-in and keep-out zone IDs

**Entity Configuration & State**:
- `EntityConfiguration` — base vehicle capabilities (speed, altitude, payload list)
- `EntityState` — full kinematic state: position, velocity, angular rates, energy, payload states, current command
- `AirVehicleConfiguration` — air vehicle speed/altitude envelopes and available maneuver types
- `AirVehicleState` — extends `EntityState` with airspeed, vertical speed, and wind
- `FlightProfile` — named operating mode with speed, pitch, climb rate, and energy rate

**Payloads**:
- `PayloadConfiguration`, `PayloadState`, `PayloadAction` — abstract payload bases
- `CameraConfiguration`, `CameraState`, `CameraAction` — EO/IR sensor config, state, and FOV commands
- `GimbalConfiguration`, `GimbalState` — gimbal mount constraints and current pointing state
- `GimbalAngleAction`, `GimbalScanAction`, `GimbalStareAction` — gimbal control commands
- `VideoStreamConfiguration`, `VideoStreamState`, `VideoStreamAction` — video stream management

**Tasks** — mission assignments:
- `Task` — base with ID, label, eligible entities, priority, and parameters
- `SearchTask` — base sensor search with wavelength bands, dwell time, and GSD
- `AreaSearchTask`, `LineSearchTask`, `PointSearchTask` — geometric search patterns
- `LoiterTask` — holding pattern at a specified action
- `MustFlyTask` — mandatory waypoint task

**Navigation & Actions**:
- `VehicleAction` — abstract action base with associated task list
- `NavigationAction` — abstract navigation action base
- `VehicleActionCommand` — command envelope with vehicle ID and status
- `Waypoint` — routing point with speed, turn type, contingency waypoints, and action list
- `MissionCommand` — ordered waypoint list sent to a vehicle
- `FollowPathCommand` — timed path with repeat mode
- `GoToWaypointAction`, `LoiterAction`, `FlightDirectorAction`, `StopMovementAction` — concrete navigation commands

**Automation Interface**:
- `AutomationRequest` — task and vehicle constraints submitted to the planner
- `AutomationResponse` — mission commands and vehicle action commands returned by the planner
- `ServiceStatus` — planner progress and error messages
- `SessionStatus` — simulation run state and timing

**Enums**: `WavelengthBand`, `NavigationMode`, `FOVOperationMode`, `GimbalPointingMode`, `ZoneAvoidanceType`, `LoiterType`, `LoiterDirection`, `SpeedType`, `TurnType`, `CommandStatusType`, `AltitudeType`, `SimulationStatusType`, `TravelMode`, `WaypointTransferMode`, `ServiceStatusType`

---

### `afrl/cmasi/perceive.flex`

**Entity Perception & Tracking** — imports from `afrl.cmasi`:
- `EntityPerception` — perceived entity position, velocity, and attitude with uncertainty estimates
- `TrackEntityAction` — command a sensor to track a specific entity by ID
- `TrackEntityTask` — persistent tracking task with sensor modality and GSD requirements

---

### `afrl/impact.flex`

**Vehicle Types** — extends `EntityConfiguration`/`EntityState`:
- `GroundVehicleConfiguration`, `GroundVehicleState` — ground vehicle with road graph ID
- `SurfaceVehicleConfiguration`, `SurfaceVehicleState` — surface (water) vehicle
- `RadioTowerConfiguration`, `RadioTowerState` — fixed communication relay infrastructure

**Specialized Tasks** — extends CMASI task types:
- `EscortTask` — escort a supported entity along a prescribed route
- `CommRelayTask` — relay communications between an entity and a tower
- `ImpactPointSearchTask`, `ImpactLineSearchTask` — search tasks keyed to interest-region IDs
- `PatternSearchTask` — area search with explicit spiral, sector, or sweep pattern
- `WatchTask`, `MultiVehicleWatchTask` — sensor stare on a specific entity
- `BlockadeTask`, `CordonTask` — constrain entity movement with standoff vehicles
- `AngledAreaSearchTask` — sweep-angle search from a defined start point

**Payloads & Power**:
- `ImpactPayloadConfiguration` — multi-payload configuration with `ImpactPayloadType` enum (EO, FLIR, GMTI, CommRelay, LaserDesignator, and others)
- `PowerConfiguration`, `PowerPlantState` — power plant type (Gasoline, JP5, JP8, FuelCell, Hybrid) and runtime state
- `RadioConfiguration`, `RadioState` — communication relay payload

**Batch Planning**:
- `ImpactAutomationRequest`, `ImpactAutomationResponse` — sandboxed automation trials with play/solution IDs
- `BatchRoutePlanRequest`, `BatchRoutePlanResponse` — multi-vehicle, multi-task route cost computation
- `BatchSummaryRequest`, `BatchSummaryResponse` — task assignment feasibility summary
- `TaskSummary`, `VehicleSummary` — per-vehicle time, energy, and comms estimates

**Interest Regions & Environment**:
- `AreaOfInterest`, `PointOfInterest`, `LineOfInterest` — named geographic features
- `WaterZone`, `WaterReport` — water area boundaries and current/wave conditions
- `DeployImpactPayload` — action to deploy a specific payload against a target

**Component Lifecycle**: `ImpactHeartbeat`, `ImpactComponentJoin`, `ImpactComponentLeave`

**Enums**: `ImpactPayloadType`, `PowerPlant`, `AreaSearchPattern`

---

### `uxas/messages/route.flex`

**Route Planning** — imports `Waypoint`, `KeyValuePair`, `Location3D` from `afrl.cmasi`:
- `RouteConstraints` — start/end location and heading constraints for a single route segment
- `RouteRequest` — multi-vehicle, multi-segment planning request
- `RoutePlanRequest` — single-vehicle planning request
- `RoutePlan` — waypoint sequence with cost and error fields
- `RoutePlanResponse`, `RouteResponse` — nested plan results per vehicle

**Graph Structures** — for road/airspace network representation:
- `GraphNode`, `GraphEdge` — nodes with coordinates and edges with intermediate waypoints
- `GraphRegion` — named graph of nodes and edges

**Egress Planning**:
- `EgressRouteRequest` — request escape routes from a start point within a radius
- `EgressRouteResponse` — list of egress node locations and headings

---

### `uxas/messages/task.flex`

**Task Lifecycle** — imports from `afrl.cmasi`:
- `TaskInitialized`, `TaskActive`, `TaskComplete`, `TaskPause`, `TaskResume`, `CancelTask` — task state machine messages
- `TaskProgress`, `TaskProgressRequest` — real-time percent-complete reporting

**Assignment & Coordination**:
- `TaskOption` — a feasible execution option for a task (vehicle, cost, start/end pose)
- `TaskPlanOptions` — all options for a task with compositional relationship string
- `TaskOptionCost` — inter-task travel cost between options
- `AssignmentCostMatrix` — full cost matrix for the assignment solver
- `TaskAssignment`, `TaskAssignmentSummary` — final vehicle-to-task binding
- `AssignmentCoordinatorTask` — coordination task for distributed assignment
- `AssignmentCoordination` — pairing of a coordinated request with a vehicle planning state

**Implementation Pipeline**:
- `TaskImplementationRequest`, `TaskImplementationResponse` — request and return waypoints for a specific task option

**Automation Wrappers**:
- `UniqueAutomationRequest`, `UniqueAutomationResponse` — stamped automation request/response with sandbox flag
- `TaskAutomationRequest`, `TaskAutomationResponse` — task-level automation wrappers
- `CoordinatedAutomationRequest` — multi-vehicle coordinated request with planning states
- `PlanningState` — vehicle position and heading at planning time

**Sensor Footprints**:
- `FootprintRequest`, `SensorFootprintRequests` — request camera footprint geometry
- `SensorFootprint`, `SensorFootprintResponse` — footprint dimensions, GSD, and slant range

---

### `uxas/messages/uxnative.flex`

**Service Control** — imports `EntityState`, `Location3D`, `Task` from `afrl.cmasi`:
- `CreateNewService`, `KillService` — dynamic service instantiation and teardown
- `StartupComplete` — abstract startup acknowledgment

**Entity Lifecycle**:
- `EntityJoin`, `EntityExit` — entity appears in or leaves the simulation
- `EntityLocation` — lightweight position-only entity update
- `AutopilotKeepAlive` — heartbeat enabling autopilot and gimbal control

**Sub-Task Execution**:
- `SubTaskExecution` — ordered or unordered list of sub-tasks to execute
- `SubTaskAssignment` — sub-task list paired with neighboring entity states

**Diagnostics**:
- `BandwidthTest`, `BandwidthReceiveReport` — inter-entity communication bandwidth measurement
- `OnboardProcessorIsAlive` — vehicle processor heartbeat

**Utilities**:
- `IncrementWaypoint` — advance a vehicle to its next waypoint
- `VideoRecord` — start/stop video recording

## Usage

```flex
// Import core geometry and automation types
import OpenUxAS::LMCP::v3.afrl.cmasi (
  Location3D, AutomationRequest, AutomationResponse, MissionCommand
)

// Import IMPACT extended tasks
import OpenUxAS::LMCP::v3.afrl.impact (
  ImpactAutomationRequest, ImpactAutomationResponse, TaskSummary
)

// Import route planning
import OpenUxAS::LMCP::v3.uxas.messages.route (
  RouteRequest, RouteResponse
)

// Import task coordination
import OpenUxAS::LMCP::v3.uxas.messages.task (
  UniqueAutomationRequest, UniqueAutomationResponse, TaskAssignmentSummary
)
```

## Dependencies

All modules within this package are self-contained. Internal dependencies:

- `afrl/cmasi/perceive.flex` → `OpenUxAS::LMCP::v3.afrl.cmasi`
- `afrl/impact.flex` → `OpenUxAS::LMCP::v3.afrl.cmasi`
- `uxas/messages/route.flex` → `OpenUxAS::LMCP::v3.afrl.cmasi`
- `uxas/messages/task.flex` → `OpenUxAS::LMCP::v3.afrl.cmasi`
- `uxas/messages/uxnative.flex` → `OpenUxAS::LMCP::v3.afrl.cmasi`

## References

- [OpenAMASE / OpenUxAS — AFRL/RQ](https://github.com/afrl-rq/OpenAMASE/)
- [CMASI XML Specification](https://github.com/afrl-rq/OpenAMASE/blob/master/OpenAMASE/docs/lmcp/CMASI.xml)
- [Flex Language](https://flexlang.org/)

## License

Released to the public domain under the **Air Force Open Source Agreement Version 1.0**.
