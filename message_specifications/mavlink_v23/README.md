# MAVLink v2.3

Flex interface specifications for the MAVLink v2.3 messaging protocol.

## Overview

[MAVLink](https://mavlink.io/en/) is a lightweight messaging protocol for communicating with drones and between onboard drone components. These Flex modules provide type-safe message definitions for MAVLink v2.3, enabling seamless integration with drone autopilots, ground control stations, and companion computers.

The specification is organized into three modules: a custom frame definition, a minimal core set, and a comprehensive common message library. All types are defined using [Flex](https://flexlang.org/) interface specification language.

## Module Structure

| File | Description |
|------|-------------|
| [`tangramcustom.flex`](tangramcustom.flex) | Base `MessageFrame` structure for all MAVLink v2 messages |
| [`minimal.flex`](minimal.flex) | Core enums and `Heartbeat` message for basic MAVLink connectivity |
| [`common.flex`](common.flex) | Comprehensive message and enum library covering all standard MAVLink functionality |

## Key Message Types

**Core Communication** - Essential system messages:
- `Heartbeat` - System health and status beacon
- `SystemTime` - System and GPS timestamps
- `Ping` - Protocol keepalive and latency measurement
- `CommandAck` - Command acknowledgment

**Navigation & Position** - Location and movement data:
- `GlobalPositionInt` - Global position with covariances
- `LocalPositionNed` - Local position in NED frame
- `Altitude` - Altitude estimates from multiple sources
- `GpsRawInt` - Raw GPS sensor data
- `GpsRtk` - RTK GPS corrections

**Attitude & Orientation** - Vehicle attitude information:
- `Attitude` - Roll, pitch, yaw angles
- `AttitudeQuaternion` - Quaternion-based attitude
- `AttitudeTarget` - Desired attitude setpoint

**Sensors** - Sensor data messages:
- `RawImu` - Accelerometer, gyroscope, magnetometer data
- `ScaledImu` - Scaled IMU readings
- `HighresImu` - High-resolution IMU data
- `DistanceSensor` - Rangefinder/lidar measurements
- `OpticalFlow` - Optical flow sensor data

**Control & Actuators** - Command and control:
- `CommandLong` - Long command with up to 7 parameters
- `CommandInt` - Integer command with position
- `SetMode` - Change system mode
- `ActuatorControlTarget` - Actuator control values
- `ServoOutputRaw` - Raw servo/motor output values

**Mission & Waypoint** - Mission planning:
- `MissionItem` - Mission command with position
- `MissionItemInt` - Integer-based mission item
- `MissionCount` - Total mission items
- `MissionCurrent` - Current mission item index
- `MissionAck` - Mission upload/download acknowledgment

**Camera & Gimbal** - Imaging systems:
- `CameraInformation` - Camera capabilities and settings
- `CameraTrigger` - Camera shutter trigger event
- `CameraImageCaptured` - Captured image metadata
- `MountOrientation` - Gimbal orientation

**Battery & Power** - Power system monitoring:
- `BatteryStatus` - Battery status and capacity
- `PowerStatus` - System power rail status

**Parameters** - Configuration management:
- `ParamValue` - Parameter value
- `ParamSet` - Set parameter value
- `ParamRequestRead` - Request specific parameter
- `ParamRequestList` - Request all parameters

**Telemetry & Data Streams** - Data transmission:
- `DataStream` - Data stream configuration
- `DataTransmissionHandshake` - File transfer initiation
- `EncapsulatedData` - Encapsulated data payload

**Status & Diagnostics** - System health:
- `SysStatus` - System status and resource usage
- `ExtendedSysState` - Extended system state
- `Vibration` - Vibration levels
- `EstimatorStatus` - State estimator status

## Key Enums

**System Types & States** - Vehicle identification:
- `MavType` - Vehicle type (quadrotor, fixed-wing, helicopter, etc.)
- `MavAutopilot` - Autopilot type (PX4, ArduPilot, etc.)
- `MavState` - System state (boot, standby, active, emergency, etc.)
- `MavComponent` - Component IDs (autopilot, camera, gimbal, GPS, IMU, etc.)

**Mode & Control** - Flight modes and control flags:
- `MavModeFlag` - Mode flags (armed, manual, guided, auto, etc.)
- `MavMode` - Predefined mode combinations
- `MavFrame` - Coordinate frame definitions

**Mission & Commands** - Mission planning:
- `MavCmd_ID` - Command IDs for mission items
- `MavMissionType` - Mission type (waypoints, fence, rally points)
- `MavMissionResult` - Mission operation results

**Sensors & Hardware** - Sensor types:
- `MavSensorOrientation` - Sensor mounting orientation
- `MavDistanceSensor` - Distance sensor type
- `GpsFixType` - GPS fix type (no fix, 2D, 3D, RTK, etc.)

**Results & Status** - Operation results:
- `MavResult` - Command result codes
- `MavCmdAck` - Command acknowledgment status
- `MavSeverity` - Message severity levels

**Battery & Power** - Power management:
- `MavBatteryType` - Battery chemistry type
- `MavBatteryChargeState` - Battery charge state
- `MavBatteryFunction` - Battery function/purpose

**Camera & Gimbal** - Imaging control:
- `CameraMode` - Camera operating mode
- `CameraCapFlags` - Camera capability flags
- `GimbalDeviceFlags` - Gimbal control flags

## Usage

To use these message types in a Flex specification:

```flex
import MAVLink::v23.minimal (Heartbeat, MavType, MavState)
import MAVLink::v23.common (GlobalPositionInt, Attitude, CommandLong)
```

## Dependencies

The modules have the following dependency structure:
- `tangramcustom` imports `tangram::flex::helpers::v1.annotations` for length annotations
- `minimal` imports `tangramcustom.MessageFrame` as the base message type
- `common` imports both `minimal` (for core enums) and `tangramcustom` (for message framing)

## License

MAVLink is available under the MIT license.
