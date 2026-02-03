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
module ROS::Common::v1.stereo_msgs

import ROS::Common::v1.std_msgs (Header)
import ROS::Common::v1.sensor_msgs (Image, RegionOfInterest)


// Separate header for compatibility with current TimeSynchronizer. Likely to be removed in a later release,
// use image.header instead.
message struct DisparityImage {
    header: Header;
    // Floating point disparity image. The disparities are pre-adjusted for any x-offset between the principal
    // points of the two cameras (in the case that they are verged). That is: d = x_l - x_r - (cx_l - cx_r)
    image: Image;
    // Stereo geometry. For disparity d, the depth from the camera is Z = fT/d.
    f: float32;
    // Baseline, world units
    T: float32;
    // Subwindow of (potentially) valid disparity values.
    valid_window: RegionOfInterest;
    // The range of disparities searched. In the disparity image, any disparity less than min_disparity is invalid.
    // The disparity search range defines the horopter, or 3D volume that the stereo algorithm can "see". Points
    // with Z outside of: Z_min = fT / max_disparity Z_max = fT / min_disparity could not be found.
    min_disparity: float32;
    max_disparity: float32;
    // Smallest allowed disparity increment. The smallest achievable depth range resolution is delta_Z = (Z^2/fT)*delta_d.
    delta_d: float32;
}

