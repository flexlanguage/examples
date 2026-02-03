// ROS is available under the BSD license Copyright (C) 2009, Willow Garage, Inc.  
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met: 
//   - Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. 
//   - Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. 
//   - Neither the names of Willow Garage, Inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission. 
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, 
// THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS 
// BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE 
// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, 
// STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
module ROS::Common::v1.geometry_msgs

import ROS::Common::v1.std_msgs (Header)
import tangram::flex::helpers::v1.annotations (Length, Rename)

// This expresses acceleration in free space broken into its linear and angular parts.
message struct Accel {
    linear: Vector3;
    angular: Vector3;
}

// An accel with reference coordinate frame and timestamp
message struct AccelStamped {
    header: Header;
    accel: Accel;
}

// This expresses acceleration in free space with uncertainty.
message struct AccelWithCovariance {
    accel: Accel;
    // Row-major representation of the 6x6 covariance matrix The orientation parameters use a fixed-axis representation.
    // In order, the parameters are: (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z
    // axis)
    @Length(36)
    covariance: float64[];
}

// This represents an estimated accel with reference coordinate frame and timestamp.
message struct AccelWithCovarianceStamped {
    header: Header;
    accel: AccelWithCovariance;
}

// Mass [kg]
message struct Inertia {
    m: float64;
    // Center of mass [m]
    com: Vector3;
    // Inertia Tensor [kg-m^2] | ixx ixy ixz | I = | ixy iyy iyz | | ixz iyz izz |
    ixx: float64;
    ixy: float64;
    ixz: float64;
    iyy: float64;
    iyz: float64;
    izz: float64;
}

message struct InertiaStamped {
    header: Header;
    inertia: Inertia;
}

// This contains the position of a point in free space
message struct Point {
    x: float64;
    y: float64;
    z: float64;
}

// This contains the position of a point in free space(with 32 bits of precision). It is recommeded to use
// Point wherever possible instead of Point32. This recommendation is to promote interoperability. This message
// is designed to take up less space when sending lots of points at once, as in the case of a PointCloud.
message struct Point32 {
    x: float32;
    y: float32;
    z: float32;
}

// This represents a Point with reference coordinate frame and timestamp
message struct PointStamped {
    header: Header;
    point: Point;
}

// A specification of a polygon where the first and last points are assumed to be connected
message struct Polygon {
    points: Point32[];
}

// This represents a Polygon with reference coordinate frame and timestamp
message struct PolygonStamped {
    header: Header;
    polygon: Polygon;
}

// A representation of pose in free space, composed of position and orientation.
message struct Pose {
    position: Point;
    orientation: Quaternion;
}

// Deprecated Please use the full 3D pose. In general our recommendation is to use a full 3D representation
// of everything and for 2D specific applications make the appropriate projections into the plane for their
// calculations but optimally will preserve the 3D information during processing. If we have parallel copies
// of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything.
// And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid,
// as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the
// 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can
// do this for you. This expresses a position and orientation on a 2D manifold.
message struct Pose2D {
    x: float64;
    y: float64;
    theta: float64;
}

// An array of poses with a header for global reference.
message struct PoseArray {
    header: Header;
    poses: Pose[];
}

// A Pose with reference coordinate frame and timestamp
message struct PoseStamped {
    header: Header;
    pose: Pose;
}

// This represents a pose in free space with uncertainty.
message struct PoseWithCovariance {
    pose: Pose;
    // Row-major representation of the 6x6 covariance matrix The orientation parameters use a fixed-axis representation.
    // In order, the parameters are: (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z
    // axis)
    @Length(36)
    covariance: float64[];
}

// This expresses an estimated pose with a reference coordinate frame and timestamp
message struct PoseWithCovarianceStamped {
    header: Header;
    pose: PoseWithCovariance;
}

// This represents an orientation in free space in quaternion form.
message struct Quaternion {
    x: float64;
    y: float64;
    z: float64;
    w: float64;
}

// This represents an orientation with reference coordinate frame and timestamp.
message struct QuaternionStamped {
    header: Header;
    quaternion: Quaternion;
}

// This represents the transform between two coordinate frames in free space.
message struct Transform {
    translation: Vector3;
    rotation: Quaternion;
}

// This expresses a transform from coordinate frame header.frame_id to the coordinate frame child_frame_id
// This message is mostly used by the <a href="http://wiki.ros.org/tf">tf</a> package. See its documentation
// for more information.
message struct TransformStamped {
    header: Header;
    // the frame id of the child frame
    child_frame_id: string;
    @Rename("_transform")
    _transform: Transform;
}

// This expresses velocity in free space broken into its linear and angular parts.
message struct Twist {
    linear: Vector3;
    angular: Vector3;
}

// A twist with reference coordinate frame and timestamp
message struct TwistStamped {
    header: Header;
    twist: Twist;
}

// This expresses velocity in free space with uncertainty.
message struct TwistWithCovariance {
    twist: Twist;
    // Row-major representation of the 6x6 covariance matrix The orientation parameters use a fixed-axis representation.
    // In order, the parameters are: (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z
    // axis)
    @Length(36)
    covariance: float64[];
}

// This represents an estimated twist with reference coordinate frame and timestamp.
message struct TwistWithCovarianceStamped {
    header: Header;
    twist: TwistWithCovariance;
}

// This represents a vector in free space. It is only meant to represent a direction. Therefore, it does not
// make sense to apply a translation to it (e.g., when applying a generic rigid transformation to a Vector3,
// tf2 will only apply the rotation). If you want your data to be translatable too, use the geometry_msgs/Point
// message instead.
message struct Vector3 {
    x: float64;
    y: float64;
    z: float64;
}

// This represents a Vector3 with reference coordinate frame and timestamp
message struct Vector3Stamped {
    header: Header;
    vector: Vector3;
}

// This represents force in free space, separated into its linear and angular parts.
message struct Wrench {
    force: Vector3;
    torque: Vector3;
}

// A wrench with reference coordinate frame and timestamp
message struct WrenchStamped {
    header: Header;
    wrench: Wrench;
}

