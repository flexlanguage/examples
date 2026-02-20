# ROS Common v1

Flex interface specifications for ROS (Robot Operating System) common message types.

## Overview

This module provides [Flex](https://flexlang.org/) definitions for the standard [ROS](https://www.ros.org/) message packages.

These specifications allow ROS message types to be used for data transformation, code generation, and system integration in robotics applications.

## Module Structure

| File                                                 | Description                                                                                         |
|------------------------------------------------------|-----------------------------------------------------------------------------------------------------|
| [`builtin.flex`](builtin.flex)                       | Core ROS primitives (`TimePrim`, `DurationPrim`)                                                    |
| [`std_msgs.flex`](std_msgs.flex)                     | Standard message wrappers (`Header`, `Bool`, `String`, `ColorRGBA`, multi-arrays)                   |
| [`geometry_msgs.flex`](geometry_msgs.flex)           | Spatial data (`Point`, `Pose`, `Quaternion`, `Transform`, `Twist`, `Wrench`, `Vector3`)             |
| [`sensor_msgs.flex`](sensor_msgs.flex)               | Sensor data (`Image`, `Imu`, `LaserScan`, `PointCloud2`, `NavSatFix`, `JointState`, `BatteryState`) |
| [`nav_msgs.flex`](nav_msgs.flex)                     | Navigation (`Odometry`, `Path`, `OccupancyGrid`, `MapMetaData`)                                     |
| [`actionlib_msgs.flex`](actionlib_msgs.flex)         | Action server (`GoalID`, `GoalStatus`, `GoalStatusArray`)                                           |
| [`diagnostic_msgs.flex`](diagnostic_msgs.flex)       | Diagnostics (`DiagnosticArray`, `DiagnosticStatus`, `KeyValue`)                                     |
| [`shape_msgs.flex`](shape_msgs.flex)                 | 3D shapes (`Mesh`, `Plane`, `SolidPrimitive`)                                                       |
| [`stereo_msgs.flex`](stereo_msgs.flex)               | Stereo vision (`DisparityImage`)                                                                    |
| [`trajectory_msgs.flex`](trajectory_msgs.flex)       | Motion planning (`JointTrajectory`, `MultiDOFJointTrajectory`)                                      |
| [`visualization_msgs.flex`](visualization_msgs.flex) | RViz visualization (`Marker`, `InteractiveMarker`, `MenuEntry`)                                     |

## Key Message Types

**Geometry** - Poses, transforms, and kinematic data for robot localization and manipulation:
- `Pose`, `PoseStamped`, `PoseWithCovariance` - Position and orientation
- `Transform`, `TransformStamped` - Coordinate frame relationships
- `Twist`, `Accel`, `Wrench` - Velocity, acceleration, and force

**Sensors** - Common robot sensor interfaces:
- `Image`, `CompressedImage`, `CameraInfo` - Camera data and calibration
- `LaserScan`, `PointCloud2` - LIDAR and depth sensors
- `Imu`, `MagneticField` - Inertial and magnetic sensors
- `NavSatFix` - GPS/GNSS positioning
- `JointState` - Robot joint positions, velocities, and efforts

**Navigation** - Autonomous navigation primitives:
- `Odometry` - Robot pose and velocity estimates
- `Path` - Waypoint sequences for path planning
- `OccupancyGrid` - 2D probability maps for obstacle avoidance

**Visualization** - RViz display types:
- `Marker`, `MarkerArray` - 3D visualization primitives
- `InteractiveMarker` - User-manipulable 3D controls

## Usage

Import specific message types from the appropriate module:

```flex
import ROS::Common::v1.geometry_msgs (Pose, Transform)
import ROS::Common::v1.sensor_msgs (Image, LaserScan)
import ROS::Common::v1.nav_msgs (Odometry, Path)
```

## Dependencies

- `tangram::flex::helpers::v1.annotations` - Flex annotation helpers (`@Length`, `@Rename`)
