// LMCP is releasable to the public domain under the Air Force Open Source Agreement Version 1.0.
module OpenUxAS::LMCP::v3.uxas.messages.uxnative

import OpenUxAS::LMCP::v3.afrl.cmasi ( EntityState, Location3D, Task )


struct KillService {
  ServiceID: int64;
}

struct IncrementWaypoint {
  VehicleID: int64;
}

struct CreateNewService {
  ServiceID: int64;
  XmlConfiguration: string[];
}

struct SubTaskExecution {
  SubTasks: Task[];
  StrictOrder: bit;
}

abstract extensible struct StartupComplete {

}

struct VideoRecord {
  Record: bit;
}

struct EntityJoin {
  EntityID: int64;
  Label: string;
}

extensible struct EntityLocation {
  EntityID: int64;
  Position: Location3D;
  Time: int64;
}

struct AutopilotKeepAlive {
  AutopilotEnabled: bit;
  GimbalEnabled: bit;
  TimeSent: int64;
}

struct EntityExit {
  EntityID: int64;
  Label: string;
}

struct BandwidthTest extends EntityLocation {
  MessageID: int64;
  Payload: string;
}

struct BandwidthReceiveReport {
  EntitySender: EntityLocation;
  EntityReceiver: EntityLocation;
  TransferPayloadSize: uint32;
}

struct OnboardProcessorIsAlive {
  VehicleID: int64;
  TimeSent: int64;
}

struct SubTaskAssignment {
  SubTasks: Task[];
  Neighbors: EntityState[];
}

