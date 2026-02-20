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
module ROS::Common::v1.actionlib_msgs

import ROS::Common::v1.builtin (TimePrim)
import ROS::Common::v1.std_msgs (Header)


// and has since completed its execution (Terminal State) to some failure (Terminal State) because the goal
// was unattainable or invalid (Terminal State) and has not yet completed execution but the action server
// has not yet confirmed that the goal is canceled and was successfully cancelled (Terminal State) sent over
// the wire by an action server
enum GoalStatusUint8Constants uint8 {
    PENDING = 0;
    ACTIVE = 1;
    PREEMPTED = 2;
    SUCCEEDED = 3;
    ABORTED = 4;
    REJECTED = 5;
    PREEMPTING = 6;
    RECALLING = 7;
    RECALLED = 8;
    LOST = 9;
}

// The stamp should store the time at which this goal was requested. It is used by an action server when it
// tries to preempt all goals that were requested before a certain time
message struct GoalID {
    stamp: TimePrim;
    // The id provides a way to associate feedback and result message with specific goal requests. The id specified
    // must be unique.
    id: string;
}

message struct GoalStatus {
    goal_id: GoalID;
    status: uint8;
    // Allow for the user to associate a string with GoalStatus for debugging
    text: string;
}

// Stores the statuses for goals that are currently being tracked by an action server
message struct GoalStatusArray {
    header: Header;
    status_list: GoalStatus[];
}

