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
module ROS::Common::v1.nav_msgs

import ROS::Common::v1.builtin (TimePrim)
import ROS::Common::v1.geometry_msgs (Point, Pose, PoseStamped, PoseWithCovariance, TwistWithCovariance)
import ROS::Common::v1.std_msgs (Header)


// an array of cells in a 2D grid
message struct GridCells {
    header: Header;
    cell_width: float32;
    cell_height: float32;
    cells: Point[];
}

// This hold basic information about the characterists of the OccupancyGrid The time at which the map was
// loaded
message struct MapMetaData {
    map_load_time: TimePrim;
    // The map resolution [m/cell]
    resolution: float32;
    // Map width [cells]
    width: uint32;
    // Map height [cells]
    height: uint32;
    // The origin of the map [m, m, rad]. This is the real-world pose of the cell (0,0) in the map.
    origin: Pose;
}

// This represents a 2-D grid map, in which each cell represents the probability of occupancy.
message struct OccupancyGrid {
    header: Header;
    // MetaData for the map
    info: MapMetaData;
    // The map data, in row-major order, starting with (0,0). Occupancy probabilities are in the range [0,100].
    // Unknown is -1.
    data: int8[];
}

// This represents an estimate of a position and velocity in free space. The pose in this message should be
// specified in the coordinate frame given by header.frame_id. The twist in this message should be specified
// in the coordinate frame given by the child_frame_id
message struct Odometry {
    header: Header;
    child_frame_id: string;
    pose: PoseWithCovariance;
    twist: TwistWithCovariance;
}

// An array of poses that represents a Path for a robot to follow
message struct Path {
    header: Header;
    poses: PoseStamped[];
}

