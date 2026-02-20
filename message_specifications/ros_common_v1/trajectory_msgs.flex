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
module ROS::Common::v1.trajectory_msgs

import ROS::Common::v1.builtin (DurationPrim)
import ROS::Common::v1.std_msgs (Header)
import ROS::Common::v1.geometry_msgs (Transform, Twist)


message struct JointTrajectory {
    header: Header;
    joint_names: string[];
    points: JointTrajectoryPoint[];
}

// Each trajectory point specifies either positions[, velocities[, accelerations]] or positions[, effort]
// for the trajectory to be executed. All specified values are in the same order as the joint names in JointTrajectory.msg
message struct JointTrajectoryPoint {
    positions: float64[];
    velocities: float64[];
    accelerations: float64[];
    effort: float64[];
    time_from_start: DurationPrim;
}

// The header is used to specify the coordinate frame and the reference time for the trajectory durations
message struct MultiDOFJointTrajectory {
    header: Header;
    joint_names: string[];
    points: MultiDOFJointTrajectoryPoint[];
}

// Each multi-dof joint can specify a transform (up to 6 DOF)
message struct MultiDOFJointTrajectoryPoint {
    transforms: Transform[];
    // There can be a velocity specified for the origin of the joint
    velocities: Twist[];
    // There can be an acceleration specified for the origin of the joint
    accelerations: Twist[];
    time_from_start: DurationPrim;
}

