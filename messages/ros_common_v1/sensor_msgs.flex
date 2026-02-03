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
module ROS::Common::v1.sensor_msgs

import ROS::Common::v1.std_msgs (Header)
import ROS::Common::v1.geometry_msgs (Point32, Quaternion, Transform, Twist, Vector3, Wrench)
import ROS::Common::v1.builtin (TimePrim)
import tangram::flex::helpers::v1.annotations (Length)

// Power supply health constants
enum BatteryStatePowerSupplyHealthConstants uint8 {
    POWER_SUPPLY_HEALTH_UNKNOWN = 0;
    POWER_SUPPLY_HEALTH_GOOD = 1;
    POWER_SUPPLY_HEALTH_OVERHEAT = 2;
    POWER_SUPPLY_HEALTH_DEAD = 3;
    POWER_SUPPLY_HEALTH_OVERVOLTAGE = 4;
    POWER_SUPPLY_HEALTH_UNSPEC_FAILURE = 5;
    POWER_SUPPLY_HEALTH_COLD = 6;
    POWER_SUPPLY_HEALTH_WATCHDOG_TIMER_EXPIRE = 7;
    POWER_SUPPLY_HEALTH_SAFETY_TIMER_EXPIRE = 8;
}

// Power supply status constants
enum BatteryStatePowerSupplyStatusConstants uint8 {
    POWER_SUPPLY_STATUS_UNKNOWN = 0;
    POWER_SUPPLY_STATUS_CHARGING = 1;
    POWER_SUPPLY_STATUS_DISCHARGING = 2;
    POWER_SUPPLY_STATUS_NOT_CHARGING = 3;
    POWER_SUPPLY_STATUS_FULL = 4;
}

// Power supply technology (chemistry) constants
enum BatteryStatePowerSupplyTechnologyConstants uint8 {
    POWER_SUPPLY_TECHNOLOGY_UNKNOWN = 0;
    POWER_SUPPLY_TECHNOLOGY_NIMH = 1;
    POWER_SUPPLY_TECHNOLOGY_LION = 2;
    POWER_SUPPLY_TECHNOLOGY_LIPO = 3;
    POWER_SUPPLY_TECHNOLOGY_LIFE = 4;
    POWER_SUPPLY_TECHNOLOGY_NICD = 5;
    POWER_SUPPLY_TECHNOLOGY_LIMN = 6;
}

enum JoyFeedbackUint8Constants uint8 {
    TYPE_LED = 0;
    TYPE_RUMBLE = 1;
    TYPE_BUZZER = 2;
}

enum NavSatFixUint8Constants uint8 {
    COVARIANCE_TYPE_UNKNOWN = 0;
    COVARIANCE_TYPE_APPROXIMATED = 1;
    COVARIANCE_TYPE_DIAGONAL_KNOWN = 2;
    COVARIANCE_TYPE_KNOWN = 3;
}

enum NavSatStatusInt8Constants int8 {
    STATUS_FIX = 0;
    STATUS_SBAS_FIX = 1;
    STATUS_GBAS_FIX = 2;
}

enum NavSatStatusUint16Constants uint16 {
    SERVICE_GPS = 1;
    SERVICE_GLONASS = 2;
    SERVICE_COMPASS = 4;
    SERVICE_GALILEO = 8;
}

enum PointFieldUint8Constants uint8 {
    INT8 = 1;
    UINT8 = 2;
    INT16 = 3;
    UINT16 = 4;
    INT32 = 5;
    UINT32 = 6;
    FLOAT32 = 7;
    FLOAT64 = 8;
}

// Radiation type enums If you want a value added to this list, send an email to the ros-users list
enum RangeRadiationTypeConstants uint8 {
    ULTRASOUND = 0;
    INFRARED = 1;
}

message struct BatteryState {
    header: Header;
    // Voltage in Volts (Mandatory)
    voltage: float32;
    // Temperature in Degrees Celsius (If unmeasured NaN)
    temperature: float32;
    // Negative when discharging (A) (If unmeasured NaN)
    current: float32;
    // Current charge in Ah (If unmeasured NaN)
    charge: float32;
    // Capacity in Ah (last full capacity) (If unmeasured NaN)
    capacity: float32;
    // Capacity in Ah (design capacity) (If unmeasured NaN)
    design_capacity: float32;
    // Charge percentage on 0 to 1 range (If unmeasured NaN)
    percentage: float32;
    // The charging status as reported. Values defined above
    power_supply_status: BatteryStatePowerSupplyStatusConstants;
    // The battery health metric. Values defined above
    power_supply_health: BatteryStatePowerSupplyHealthConstants;
    // The battery chemistry. Values defined above
    power_supply_technology: BatteryStatePowerSupplyTechnologyConstants;
    // True if the battery is present
    present: bit;
    // An array of individual cell voltages for each cell in the pack If individual voltages unknown but number
    // of cells known set each to NaN
    cell_voltage: float32[];
    // An array of individual cell temperatures for each cell in the pack If individual temperatures unknown but
    // number of cells known set each to NaN
    cell_temperature: float32[];
    // The location into which the battery is inserted. (slot number or plug)
    location: string;
    // The best approximation of the battery serial number
    serial_number: string;
}

// This message defines meta information for a camera. It should be in a camera namespace on topic "camera_info"
// and accompanied by up to five image topics named: image_raw - raw data from the camera driver, possibly
// Bayer encoded image - monochrome, distorted image_color - color, distorted image_rect - monochrome, rectified
// image_rect_color - color, rectified The image_pipeline contains packages (image_proc, stereo_image_proc)
// for producing the four processed image topics from image_raw and camera_info. The meaning of the camera
// parameters are described in detail at http://www.ros.org/wiki/image_pipeline/CameraInfo. The image_geometry
// package provides a user-friendly interface to common operations using this meta information. If you want
// to, e.g., project a 3d point into image coordinates, we strongly recommend using image_geometry. If the
// camera is uncalibrated, the matrices D, K, R, P should be left zeroed out. In particular, clients may assume
// that K[0] == 0.0 indicates an uncalibrated camera. Image acquisition info # ######################################################################
// Time of image acquisition, camera coordinate frame ID
message struct CameraInfo {
    // Header timestamp should be acquisition time of image Header frame_id should be optical frame of camera
    // origin of frame should be optical center of camera +x should point to the right in the image +y should
    // point down in the image +z should point into the plane of the image
    header: Header;
    // The image dimensions with which the camera was calibrated. Normally this will be the full camera resolution
    // in pixels.
    height: uint32;
    width: uint32;
    // The distortion model used. Supported models are listed in sensor_msgs/distortion_models.h. For most cameras,
    // "plumb_bob" - a simple model of radial and tangential distortion - is sufficient.
    distortion_model: string;
    // The distortion parameters, size depending on the distortion model. For "plumb_bob", the 5 parameters are:
    // (k1, k2, t1, t2, k3).
    D: float64[];
    // Intrinsic camera matrix for the raw (distorted) images. [fx 0 cx] K = [ 0 fy cy] [ 0 0 1] Projects 3D points
    // in the camera coordinate frame to 2D pixel coordinates using the focal lengths (fx, fy) and principal point
    // (cx, cy).
    @Length(9)
    K: float64[];
    // Rectification matrix (stereo cameras only) A rotation matrix aligning the camera coordinate system to the
    // ideal stereo image plane so that epipolar lines in both stereo images are parallel.
    @Length(9)
    R: float64[];
    // Projection/camera matrix [fx' 0 cx' Tx] P = [ 0 fy' cy' Ty] [ 0 0 1 0] By convention, this matrix specifies
    // the intrinsic (camera) matrix of the processed (rectified) image. That is, the left 3x3 portion is the
    // normal camera intrinsic matrix for the rectified image. It projects 3D points in the camera coordinate
    // frame to 2D pixel coordinates using the focal lengths (fx', fy') and principal point (cx', cy') - these
    // may differ from the values in K. For monocular cameras, Tx = Ty = 0. Normally, monocular cameras will also
    // have R = the identity and P[1:3,1:3] = K. For a stereo pair, the fourth column [Tx Ty 0]' is related to
    // the position of the optical center of the second camera in the first camera's frame. We assume Tz = 0 so
    // both cameras are in the same stereo image plane. The first camera always has Tx = Ty = 0. For the right
    // (second) camera of a horizontal stereo pair, Ty = 0 and Tx = -fx' * B, where B is the baseline between
    // the cameras. Given a 3D point [X Y Z]', the projection (x, y) of the point onto the rectified image is
    // given by: [u v w]' = P * [X Y Z 1]' x = u / w y = v / w This holds for both images of a stereo pair.
    @Length(12)
    P: float64[];
    // Binning refers here to any camera setting which combines rectangular neighborhoods of pixels into larger
    // "super-pixels." It reduces the resolution of the output image to (width / binning_x) x (height / binning_y).
    // The default values binning_x = binning_y = 0 is considered the same as binning_x = binning_y = 1 (no subsampling).
    binning_x: uint32;
    binning_y: uint32;
    // Region of interest (subwindow of full camera resolution), given in full resolution (unbinned) image coordinates.
    // A particular ROI always denotes the same window of pixels on the camera sensor, regardless of binning settings.
    // The default setting of roi (all values 0) is considered the same as full resolution (roi.width = width,
    // roi.height = height).
    roi: RegionOfInterest;
}

// This message is used by the PointCloud message to hold optional data associated with each point in the
// cloud. The length of the values array should be the same as the length of the points array in the PointCloud,
// and each value should be associated with the corresponding point. Channel names in existing practice include:
// "u", "v" - row and column (respectively) in the left stereo image. This is opposite to usual conventions
// but remains for historical reasons. The newer PointCloud2 message has no such problem. "rgb" - For point
// clouds produced by color stereo cameras. uint8 (R,G,B) values packed into the least significant 24 bits,
// in order. "intensity" - laser or pixel intensity. "distance" The channel name should give semantics of
// the channel (e.g. "intensity" instead of "value").
message struct ChannelFloat32 {
    name: string;
    // The values array should be 1-1 with the elements of the associated PointCloud.
    values: float32[];
}

// This message contains a compressed image
message struct CompressedImage {
    // Header timestamp should be acquisition time of image Header frame_id should be optical frame of camera
    // origin of frame should be optical center of camera +x should point to the right in the image +y should
    // point down in the image +z should point into to plane of the image
    header: Header;
    // Specifies the format of the data Acceptable values: jpeg, png
    format: string;
    // Compressed image buffer
    data: uint8[];
}

// Single pressure reading. This message is appropriate for measuring the pressure inside of a fluid (air,
// water, etc). This also includes atmospheric or barometric pressure. This message is not appropriate for
// force/pressure contact sensors.
message struct FluidPressure {
    // timestamp of the measurement frame_id is the location of the pressure sensor
    header: Header;
    // Absolute pressure reading in Pascals.
    fluid_pressure: float64;
    // 0 is interpreted as variance unknown
    variance: float64;
}

// Single photometric illuminance measurement. Light should be assumed to be measured along the sensor's x-axis
// (the area of detection is the y-z plane). The illuminance should have a 0 or positive value and be received
// with the sensor's +X axis pointing toward the light source. Photometric illuminance is the measure of the
// human eye's sensitivity of the intensity of light encountering or passing through a surface. All other
// Photometric and Radiometric measurements should not use this message. This message cannot represent: Luminous
// intensity (candela/light source output) Luminance (nits/light output per area) Irradiance (watt/area),
// etc.
message struct Illuminance {
    // timestamp is the time the illuminance was measured frame_id is the location and direction of the reading
    header: Header;
    // Measurement of the Photometric Illuminance in Lux.
    illuminance: float64;
    // 0 is interpreted as variance unknown
    variance: float64;
}

// This message contains an uncompressed image (0, 0) is at top-left corner of image
message struct Image {
    // Header timestamp should be acquisition time of image Header frame_id should be optical frame of camera
    // origin of frame should be optical center of camera +x should point to the right in the image +y should
    // point down in the image +z should point into to plane of the image If the frame_id here and the frame_id
    // of the CameraInfo message associated with the image conflict the behavior is undefined
    header: Header;
    // image height, that is, number of rows
    height: uint32;
    // image width, that is, number of columns
    width: uint32;
    // Encoding of pixels -- channel meaning, ordering, size taken from the list of strings in include/sensor_msgs/image_encodings.h
    encoding: string;
    // is this data bigendian?
    is_bigendian: uint8;
    // Full row length in bytes
    step: uint32;
    // actual matrix data, size is (step * rows)
    data: uint8[];
}

// This is a message to hold data from an IMU (Inertial Measurement Unit) Accelerations should be in m/s^2
// (not in g's), and rotational velocity should be in rad/sec If the covariance of the measurement is known,
// it should be filled in (if all you know is the variance of each measurement, e.g. from the datasheet, just
// put those along the diagonal) A covariance matrix of all zeros will be interpreted as "covariance unknown",
// and to use the data a covariance will have to be assumed or gotten from some other source If you have no
// estimate for one of the data elements (e.g. your IMU doesn't produce an orientation estimate), please set
// element 0 of the associated covariance matrix to -1 If you are interpreting this message, please check
// for a value of -1 in the first element of each covariance matrix, and disregard the associated estimate.
message struct Imu {
    header: Header;
    orientation: Quaternion;
    // Row major about x, y, z axes
    @Length(9)
    orientation_covariance: float64[];
    angular_velocity: Vector3;
    // Row major about x, y, z axes
    @Length(9)
    angular_velocity_covariance: float64[];
    linear_acceleration: Vector3;
    // Row major x, y z
    @Length(9)
    linear_acceleration_covariance: float64[];
}

// This is a message that holds data to describe the state of a set of torque controlled joints. The state
// of each joint (revolute or prismatic) is defined by:
// * the position of the joint (rad or m),
// * the velocity of the joint (rad/s or m/s) and
// * the effort that is applied in the joint (Nm or N). Each joint is uniquely identified by its name The
// header specifies the time at which the joint states were recorded. All the joint states in one message
// have to be recorded at the same time. This message consists of a multiple arrays, one for each part of
// the joint state. The goal is to make each of the fields optional. When e.g. your joints have no effort
// associated with them, you can leave the effort array empty. All arrays in this message should have the
// same size, or be empty. This is the only way to uniquely associate the joint name with the correct states.
message struct JointState {
    header: Header;
    name: string[];
    position: float64[];
    velocity: float64[];
    effort: float64[];
}

// Reports the state of a joysticks axes and buttons.
message struct Joy {
    // timestamp in the header is the time the data is received from the joystick
    header: Header;
    // the axes measurements from a joystick
    axes: float32[];
    // the buttons measurements from a joystick
    buttons: int32[];
}

// Declare of the type of feedback
message struct JoyFeedback {
    _type: uint8;
    // This will hold an id number for each type of each feedback. Example, the first led would be id=0, the second
    // would be id=1
    id: uint8;
    // Intensity of the feedback, from 0.0 to 1.0, inclusive. If device is actually binary, driver should treat
    // 0<=x<0.5 as off, 0.5<=x<=1 as on.
    intensity: float32;
}

// This message publishes values for multiple feedback at once.
message struct JoyFeedbackArray {
    array: JoyFeedback[];
}

// This message is a submessage of MultiEchoLaserScan and is not intended to be used separately.
message struct LaserEcho {
    // Multiple values of ranges or intensities. Each array represents data from the same angle increment.
    echoes: float32[];
}

// Single scan from a planar laser range-finder If you have another ranging device with different behavior
// (e.g. a sonar array), please find or create a different message, since applications will make fairly laser-specific
// assumptions about this data
message struct LaserScan {
    // timestamp in the header is the acquisition time of the first ray in the scan. in frame frame_id, angles
    // are measured around the positive Z axis (counterclockwise, if Z is up) with zero angle being forward along
    // the x axis
    header: Header;
    // start angle of the scan [rad]
    angle_min: float32;
    // end angle of the scan [rad]
    angle_max: float32;
    // angular distance between measurements [rad]
    angle_increment: float32;
    // time between measurements [seconds] - if your scanner is moving, this will be used in interpolating position
    // of 3d points
    time_increment: float32;
    // time between scans [seconds]
    scan_time: float32;
    // minimum range value [m]
    range_min: float32;
    // maximum range value [m]
    range_max: float32;
    // range data [m] (Note: values < range_min or > range_max should be discarded)
    ranges: float32[];
    // intensity data [device-specific units]. If your device does not provide intensities, please leave the array
    // empty.
    intensities: float32[];
}

// Measurement of the Magnetic Field vector at a specific location. If the covariance of the measurement is
// known, it should be filled in (if all you know is the variance of each measurement, e.g. from the datasheet,
// just put those along the diagonal) A covariance matrix of all zeros will be interpreted as "covariance
// unknown", and to use the data a covariance will have to be assumed or gotten from some other source
message struct MagneticField {
    // timestamp is the time the field was measured frame_id is the location and orientation of the field measurement
    header: Header;
    // x, y, and z components of the field vector in Tesla If your sensor does not output 3 axes, put NaNs in
    // the components not reported.
    magnetic_field: Vector3;
    // Row major about x, y, z axes 0 is interpreted as variance unknown
    @Length(9)
    magnetic_field_covariance: float64[];
}

// Representation of state for joints with multiple degrees of freedom, following the structure of JointState.
// It is assumed that a joint in a system corresponds to a transform that gets applied along the kinematic
// chain. For example, a planar joint (as in URDF) is 3DOF (x, y, yaw) and those 3DOF can be expressed as
// a transformation matrix, and that transformation matrix can be converted back to (x, y, yaw) Each joint
// is uniquely identified by its name The header specifies the time at which the joint states were recorded.
// All the joint states in one message have to be recorded at the same time. This message consists of a multiple
// arrays, one for each part of the joint state. The goal is to make each of the fields optional. When e.g.
// your joints have no wrench associated with them, you can leave the wrench array empty. All arrays in this
// message should have the same size, or be empty. This is the only way to uniquely associate the joint name
// with the correct states.
message struct MultiDOFJointState {
    header: Header;
    joint_names: string[];
    transforms: Transform[];
    twist: Twist[];
    wrench: Wrench[];
}

// Single scan from a multi-echo planar laser range-finder If you have another ranging device with different
// behavior (e.g. a sonar array), please find or create a different message, since applications will make
// fairly laser-specific assumptions about this data
message struct MultiEchoLaserScan {
    // timestamp in the header is the acquisition time of the first ray in the scan. in frame frame_id, angles
    // are measured around the positive Z axis (counterclockwise, if Z is up) with zero angle being forward along
    // the x axis
    header: Header;
    // start angle of the scan [rad]
    angle_min: float32;
    // end angle of the scan [rad]
    angle_max: float32;
    // angular distance between measurements [rad]
    angle_increment: float32;
    // time between measurements [seconds] - if your scanner is moving, this will be used in interpolating position
    // of 3d points
    time_increment: float32;
    // time between scans [seconds]
    scan_time: float32;
    // minimum range value [m]
    range_min: float32;
    // maximum range value [m]
    range_max: float32;
    // range data [m] (Note: NaNs, values < range_min or > range_max should be discarded) +Inf measurements are
    // out of range
    // -Inf measurements are too close to determine exact distance.
    ranges: LaserEcho[];
    // intensity data [device-specific units]. If your device does not provide intensities, please leave the array
    // empty.
    intensities: LaserEcho[];
}

// Navigation Satellite fix for any Global Navigation Satellite System Specified using the WGS 84 reference
// ellipsoid header.stamp specifies the ROS time for this measurement (the corresponding satellite time may
// be reported using the sensor_msgs/TimeReference message). header.frame_id is the frame of reference reported
// by the satellite receiver, usually the location of the antenna. This is a Euclidean frame relative to the
// vehicle, not a reference ellipsoid.
message struct NavSatFix {
    header: Header;
    // satellite fix status information
    status: NavSatStatus;
    // Latitude [degrees]. Positive is north of equator; negative is south.
    latitude: float64;
    // Longitude [degrees]. Positive is east of prime meridian; negative is west.
    longitude: float64;
    // Altitude [m]. Positive is above the WGS 84 ellipsoid (quiet NaN if no altitude is available).
    altitude: float64;
    @Length(9)
    position_covariance: float64[];
    position_covariance_type: uint8;
}

// Navigation Satellite fix status for any Global Navigation Satellite System Whether to output an augmented
// fix is determined by both the fix type and the last time differential corrections were received. A fix
// is valid when status >= STATUS_FIX.
message struct NavSatStatus {
    STATUS_NO_FIX: int8;
    status: int8;
    service: uint16;
}

// This message holds a collection of 3d points, plus optional additional information about each point. Time
// of sensor data acquisition, coordinate frame ID.
message struct PointCloud {
    header: Header;
    // Array of 3d points. Each Point32 should be interpreted as a 3d point in the frame given in the header.
    points: Point32[];
    // Each channel should have the same number of elements as points array, and the data in each channel should
    // correspond 1:1 with each point. Channel names in common practice are listed in ChannelFloat32.msg.
    channels: ChannelFloat32[];
}

// This message holds a collection of N-dimensional points, which may contain additional information such
// as normals, intensity, etc. The point data is stored as a binary blob, its layout described by the contents
// of the "fields" array. The point cloud data may be organized 2d (image-like) or 1d (unordered). Point clouds
// organized as 2d images may be produced by camera depth sensors such as stereo or time-of-flight. Time of
// sensor data acquisition, and the coordinate frame ID (for 3d points).
message struct PointCloud2 {
    header: Header;
    // 2D structure of the point cloud. If the cloud is unordered, height is 1 and width is the length of the
    // point cloud.
    height: uint32;
    width: uint32;
    // Describes the channels and their layout in the binary data blob.
    fields: PointField[];
    // Is this data bigendian?
    is_bigendian: bit;
    // Length of a point in bytes
    point_step: uint32;
    // Length of a row in bytes
    row_step: uint32;
    // Actual point data, size is (row_step*height)
    data: uint8[];
    // True if there are no invalid points
    is_dense: bit;
}

// This message holds the description of one point entry in the PointCloud2 message format.
message struct PointField {
    // Name of field
    name: string;
    // Offset from start of point struct
    offset: uint32;
    // Datatype enumeration, see above
    datatype: uint8;
    // How many elements in the field
    count: uint32;
}

// Single range reading from an active ranger that emits energy and reports one range reading that is valid
// along an arc at the distance measured. This message is not appropriate for laser scanners. See the LaserScan
// message if you are working with a laser scanner. This message also can represent a fixed-distance (binary)
// ranger. This sensor will have min_range===max_range===distance of detection. These sensors follow REP 117
// and will output -Inf if the object is detected and +Inf if the object is outside of the detection range.
message struct Range {
    // timestamp in the header is the time the ranger returned the distance reading
    header: Header;
    // the type of radiation used by the sensor (sound, IR, etc) [enum]
    radiation_type: RangeRadiationTypeConstants;
    // the size of the arc that the distance reading is valid for [rad] the object causing the range reading may
    // have been anywhere within -field_of_view/2 and field_of_view/2 at the measured range. 0 angle corresponds
    // to the x-axis of the sensor.
    field_of_view: float32;
    // minimum range value [m]
    min_range: float32;
    // maximum range value [m] Fixed distance rangers require min_range==max_range
    max_range: float32;
    // range data [m] (Note: values < range_min or > range_max should be discarded) Fixed distance rangers only
    // output -Inf or +Inf.
    // -Inf represents a detection within fixed distance. (Detection too close to the sensor to quantify) +Inf
    // represents no detection within the fixed distance. (Object out of range)
    range: float32;
}

// This message is used to specify a region of interest within an image. When used to specify the ROI setting
// of the camera when the image was taken, the height and width fields should either match the height and
// width fields for the associated image; or height = width = 0 indicates that the full resolution image was
// captured.
message struct RegionOfInterest {
    // Leftmost pixel of the ROI (0 if the ROI includes the left edge of the image)
    x_offset: uint32;
    // Topmost pixel of the ROI (0 if the ROI includes the top edge of the image)
    y_offset: uint32;
    // Height of ROI
    height: uint32;
    // Width of ROI
    width: uint32;
    // True if a distinct rectified ROI should be calculated from the "raw" ROI in this message. Typically this
    // should be False if the full image is captured (ROI not used), and True if a subwindow is captured (ROI
    // used).
    do_rectify: bit;
}

// Single reading from a relative humidity sensor. Defines the ratio of partial pressure of water vapor to
// the saturated vapor pressure at a temperature.
message struct RelativeHumidity {
    // timestamp of the measurement frame_id is the location of the humidity sensor
    header: Header;
    // Expression of the relative humidity from 0.0 to 1.0. 0.0 is no partial pressure of water vapor 1.0 represents
    // partial pressure of saturation
    relative_humidity: float64;
    // 0 is interpreted as variance unknown
    variance: float64;
}

// Single temperature reading.
message struct Temperature {
    // timestamp is the time the temperature was measured frame_id is the location of the temperature reading
    header: Header;
    // Measurement of the Temperature in Degrees Celsius
    temperature: float64;
    // 0 is interpreted as variance unknown
    variance: float64;
}

// Measurement from an external time source not actively synchronized with the system clock.
message struct TimeReference {
    // stamp is system time for which measurement was valid frame_id is not used
    header: Header;
    // corresponding time from this external source
    time_ref: TimePrim;
    // (optional) name of time source
    source: string;
}

