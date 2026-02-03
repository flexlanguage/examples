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
module ROS::Common::v1.std_msgs

import ROS::Common::v1.builtin (DurationPrim, TimePrim)


message struct Bool {
    data: bit;
}

message struct Byte {
    data: int8;
}

// Please look at the MultiArrayLayout message definition for documentation on all multiarrays.
message struct ByteMultiArray {
    // specification of data layout
    layout: MultiArrayLayout;
    // array of data
    data: int8[];
}

message struct Char {
    data: uint8;
}

message struct ColorRGBA {
    r: float32;
    g: float32;
    b: float32;
    a: float32;
}

message struct Duration {
    data: DurationPrim;
}

abstract extensible message struct Empty {
}

message struct Float32 {
    data: float32;
}

// Please look at the MultiArrayLayout message definition for documentation on all multiarrays.
message struct Float32MultiArray {
    // specification of data layout
    layout: MultiArrayLayout;
    // array of data
    data: float32[];
}

message struct Float64 {
    data: float64;
}

// Please look at the MultiArrayLayout message definition for documentation on all multiarrays.
message struct Float64MultiArray {
    // specification of data layout
    layout: MultiArrayLayout;
    // array of data
    data: float64[];
}

// Standard metadata for higher-level stamped data types. This is generally used to communicate timestamped
// data in a particular coordinate frame. sequence ID: consecutively increasing ID
message struct Header {
    seq: uint32;
    // Two-integer timestamp that is expressed as:
    // * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    // * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs') time-handling sugar
    // is provided by the client library
    stamp: TimePrim;
    // Frame this data is associated with
    frame_id: string;
}

message struct Int16 {
    data: int16;
}

// Please look at the MultiArrayLayout message definition for documentation on all multiarrays.
message struct Int16MultiArray {
    // specification of data layout
    layout: MultiArrayLayout;
    // array of data
    data: int16[];
}

message struct Int32 {
    data: int32;
}

// Please look at the MultiArrayLayout message definition for documentation on all multiarrays.
message struct Int32MultiArray {
    // specification of data layout
    layout: MultiArrayLayout;
    // array of data
    data: int32[];
}

message struct Int64 {
    data: int64;
}

// Please look at the MultiArrayLayout message definition for documentation on all multiarrays.
message struct Int64MultiArray {
    // specification of data layout
    layout: MultiArrayLayout;
    // array of data
    data: int64[];
}

message struct Int8 {
    data: int8;
}

// Please look at the MultiArrayLayout message definition for documentation on all multiarrays.
message struct Int8MultiArray {
    // specification of data layout
    layout: MultiArrayLayout;
    // array of data
    data: int8[];
}

message struct MultiArrayDimension {
    // label of given dimension
    label: string;
    // size of given dimension (in type units)
    size: uint32;
    // stride of given dimension
    stride: uint32;
}

// The multiarray declares a generic multi-dimensional array of a particular data type. Dimensions are ordered
// from outer most to inner most.
message struct MultiArrayLayout {
    // Array of dimension properties
    dim: MultiArrayDimension[];
    // padding elements at front of data
    data_offset: uint32;
}

message struct String {
    data: string;
}

message struct Time {
    data: TimePrim;
}

message struct UInt16 {
    data: uint16;
}

// Please look at the MultiArrayLayout message definition for documentation on all multiarrays.
message struct UInt16MultiArray {
    // specification of data layout
    layout: MultiArrayLayout;
    // array of data
    data: uint16[];
}

message struct UInt32 {
    data: uint32;
}

// Please look at the MultiArrayLayout message definition for documentation on all multiarrays.
message struct UInt32MultiArray {
    // specification of data layout
    layout: MultiArrayLayout;
    // array of data
    data: uint32[];
}

message struct UInt64 {
    data: uint64;
}

// Please look at the MultiArrayLayout message definition for documentation on all multiarrays.
message struct UInt64MultiArray {
    // specification of data layout
    layout: MultiArrayLayout;
    // array of data
    data: uint64[];
}

message struct UInt8 {
    data: uint8;
}

// Please look at the MultiArrayLayout message definition for documentation on all multiarrays.
message struct UInt8MultiArray {
    // specification of data layout
    layout: MultiArrayLayout;
    // array of data
    data: uint8[];
}

