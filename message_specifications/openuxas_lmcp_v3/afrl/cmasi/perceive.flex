// LMCP is releasable to the public domain under the Air Force Open Source Agreement Version 1.0.
module OpenUxAS::LMCP::v3.afrl.cmasi.perceive

import OpenUxAS::LMCP::v3.afrl.cmasi ( VehicleAction, WavelengthBand, Location3D, Task )


struct TrackEntityAction extends VehicleAction {
  EntityID: uint32;
  SensorID: uint32;
  ReturnToWaypoint: uint32;
}

struct EntityPerception {
  PerceivedEntityID: uint32;
  PerceiverID: uint32;
  PerceiverPayloads: uint32[];
  Velocity: float32[];
  VelocityError: float32[];
  VelocityValid: bit;
  Attitude: float32[];
  AttitudeError: float32[];
  AttitudeValid: bit;
  Location: Location3D;
  LocationError: float32[];
  TimeLastSeen: int64;
}

struct TrackEntityTask extends Task {
  EntityID: uint32;
  SensorModality: WavelengthBand;
  GroundSampleDistance: float32;
}

