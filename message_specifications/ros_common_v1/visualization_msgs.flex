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
module ROS::Common::v1.visualization_msgs

import ROS::Common::v1.std_msgs (ColorRGBA, Header)
import ROS::Common::v1.geometry_msgs (Point, Pose, Quaternion, Vector3)
import ROS::Common::v1.builtin (DurationPrim)


enum ImageMarkerUint8Constants uint8 {
    CIRCLE = 0;
    LINE_STRIP = 1;
    LINE_LIST = 2;
    POLYGON = 3;
    POINTS = 4;
    ADD = 0;
    REMOVE = 1;
}

// Interaction mode for this control "3D" interaction modes work with the mouse+SHIFT+CTRL or with 3D cursors.
enum InteractiveMarkerControlInteractionModeConstants uint8 {
    // This control is only meant for visualization; no context menu.
    NONE = 0;
    // Like NONE, but right-click menu is active.
    MENU = 1;
    // Element can be left-clicked.
    BUTTON = 2;
    // Translate along local x-axis.
    MOVE_AXIS = 3;
    // Translate in local y-z plane.
    MOVE_PLANE = 4;
    // Rotate around local x-axis.
    ROTATE_AXIS = 5;
    // Combines MOVE_PLANE and ROTATE_AXIS.
    MOVE_ROTATE = 6;
    // Translate freely in 3D space.
    MOVE_3D = 7;
    // Rotate freely in 3D space about the origin of parent frame.
    ROTATE_3D = 8;
    // Full 6-DOF freedom of translation and rotation about the cursor origin.
    MOVE_ROTATE_3D = 9;
}

// Orientation mode: controls how orientation changes.
enum InteractiveMarkerControlOrientationModeConstants uint8 {
    // Follow orientation of interactive marker
    INHERIT = 0;
    // Keep orientation fixed at initial state
    FIXED = 1;
    // Align y-z plane with screen (x: forward, y:left, z:up).
    VIEW_FACING = 2;
}

// Type of the event
enum InteractiveMarkerFeedbackUint8Constants uint8 {
    // sent while dragging to keep up control of the marker
    KEEP_ALIVE = 0;
    // the pose has been changed using one of the controls
    POSE_UPDATE = 1;
    // a menu entry has been selected
    MENU_SELECT = 2;
    // a button control has been clicked
    BUTTON_CLICK = 3;
    MOUSE_DOWN = 4;
    MOUSE_UP = 5;
}

// Type holds the purpose of this message. It must be one of UPDATE or KEEP_ALIVE.
enum InteractiveMarkerUpdateTypeConstants uint8 {
    // Indicates the that the server is still living. The sequence number does not increase. No payload data should
    // be filled out (markers, poses, or erases).
    KEEP_ALIVE = 0;
    // Incremental update to previous state. The sequence number must be 1 higher than for the previous update.
    UPDATE = 1;
}

enum MarkerUint8Constants uint8 {
    ARROW = 0;
    CUBE = 1;
    SPHERE = 2;
    CYLINDER = 3;
    LINE_STRIP = 4;
    LINE_LIST = 5;
    CUBE_LIST = 6;
    SPHERE_LIST = 7;
    POINTS = 8;
    TEXT_VIEW_FACING = 9;
    MESH_RESOURCE = 10;
    TRIANGLE_LIST = 11;
    ADD = 0;
    MODIFY = 0;
    DELETE = 2;
    DELETEALL = 3;
}

// Command_type stores the type of response desired when this menu entry is clicked.
enum MenuEntryCommandTypeConstants uint8 {
    // send an InteractiveMarkerFeedback message with menu_entry_id set to this entry's id.
    FEEDBACK = 0;
    // execute "rosrun" with arguments given in the command field (above).
    ROSRUN = 1;
    // execute "roslaunch" with arguments given in the command field (above).
    ROSLAUNCH = 2;
}

message struct ImageMarker {
    header: Header;
    // namespace, used with id to form a unique id
    ns: string;
    // unique id within the namespace
    id: int32;
    // CIRCLE/LINE_STRIP/etc.
    _type: int32;
    // ADD/REMOVE
    action: int32;
    // 2D, in pixel-coords
    position: Point;
    // the diameter for a circle, etc.
    scale: float32;
    outline_color: ColorRGBA;
    // whether to fill in the shape with color
    filled: uint8;
    // color [0.0-1.0]
    fill_color: ColorRGBA;
    // How long the object should last before being automatically deleted. 0 means forever
    lifetime: DurationPrim;
    // used for LINE_STRIP/LINE_LIST/POINTS/etc., 2D in pixel coords
    points: Point[];
    // a color for each line, point, etc.
    outline_colors: ColorRGBA[];
}

// Time/frame info. If header.time is set to 0, the marker will be retransformed into its frame on each timestep.
// You will receive the pose feedback in the same frame. Otherwise, you might receive feedback in a different
// frame. For rviz, this will be the current 'fixed frame' set by the user.
message struct InteractiveMarker {
    header: Header;
    // Initial pose. Also, defines the pivot point for rotations.
    pose: Pose;
    // Identifying string. Must be globally unique in the topic that this message is sent through.
    name: string;
    // Short description (< 40 characters).
    description: string;
    // Scale to be used for default controls (default=1).
    scale: float32;
    // All menu and submenu entries associated with this marker.
    menu_entries: MenuEntry[];
    // List of controls displayed for this marker.
    controls: InteractiveMarkerControl[];
}

// Represents a control that is to be displayed together with an interactive marker Identifying string for
// this control. You need to assign a unique value to this to receive feedback from the GUI on what actions
// the user performs on this control (e.g. a button click).
message struct InteractiveMarkerControl {
    name: string;
    // Defines the local coordinate frame (relative to the pose of the parent interactive marker) in which is
    // being rotated and translated. Default: Identity
    orientation: Quaternion;
    orientation_mode: InteractiveMarkerControlOrientationModeConstants;
    interaction_mode: InteractiveMarkerControlInteractionModeConstants;
    // If true, the contained markers will also be visible when the gui is not in interactive mode.
    always_visible: bit;
    // Markers to be displayed as custom visual representation. Leave this empty to use the default control handles.
    // Note:
    // - The markers can be defined in an arbitrary coordinate frame, but will be transformed into the local frame
    //   of the interactive marker.
    // - If the header of a marker is empty, its pose will be interpreted as relative to the pose of the parent
    // interactive marker.
    markers: Marker[];
    // In VIEW_FACING mode, set this to true if you don't want the markers to be aligned with the camera view
    // point. The markers will show up as in INHERIT mode.
    independent_marker_orientation: bit;
    // Short description (< 40 characters) of what this control does, e.g. "Move the robot". Default: A generic
    // description based on the interaction mode
    description: string;
}

// Time/frame info.
message struct InteractiveMarkerFeedback {
    header: Header;
    // Identifying string. Must be unique in the topic namespace.
    client_id: string;
    // Specifies which interactive marker and control this message refers to
    marker_name: string;
    control_name: string;
    event_type: uint8;
    // Current pose of the marker Note: Has to be valid for all feedback types.
    pose: Pose;
    // Contains the ID of the selected menu entry Only valid for MENU_SELECT events.
    menu_entry_id: uint32;
    // If event_type is BUTTON_CLICK, MOUSE_DOWN, or MOUSE_UP, mouse_point may contain the 3 dimensional position
    // of the event on the control. If it does, mouse_point_valid will be true. mouse_point will be relative to
    // the frame listed in the header.
    mouse_point: Point;
    mouse_point_valid: bit;
}

// Identifying string. Must be unique in the topic namespace that this server works on.
message struct InteractiveMarkerInit {
    server_id: string;
    // Sequence number. The client will use this to detect if it has missed a subsequent update. Every update
    // message will have the same sequence number as an init message. Clients will likely want to unsubscribe
    // from the init topic after a successful initialization to avoid receiving duplicate data.
    seq_num: uint64;
    // All markers.
    markers: InteractiveMarker[];
}

// Time/frame info.
message struct InteractiveMarkerPose {
    header: Header;
    // Initial pose. Also, defines the pivot point for rotations.
    pose: Pose;
    // Identifying string. Must be globally unique in the topic that this message is sent through.
    name: string;
}

// Identifying string. Must be unique in the topic namespace that this server works on.
message struct InteractiveMarkerUpdate {
    server_id: string;
    // Sequence number. The client will use this to detect if it has missed an update.
    seq_num: uint64;
    _type: InteractiveMarkerUpdateTypeConstants;
    // Markers to be added or updated
    markers: InteractiveMarker[];
    // Poses of markers that should be moved
    poses: InteractiveMarkerPose[];
    // Names of markers to be erased
    erases: string[];
}

// See http://www.ros.org/wiki/rviz/DisplayTypes/Marker and http://www.ros.org/wiki/rviz/Tutorials/Markers%3A%20Basic%20Shapes
// for more information on using this message with rviz
message struct Marker {
    // header for time/frame information
    header: Header;
    // Namespace to place this object in... used in conjunction with id to create a unique name for the object
    ns: string;
    // object ID useful in conjunction with the namespace for manipulating and deleting the object later
    id: int32;
    // Type of object
    _type: int32;
    // 0 add/modify an object, 1 (deprecated), 2 deletes an object, 3 deletes all objects
    action: int32;
    // Pose of the object
    pose: Pose;
    // Scale of the object 1,1,1 means default (usually 1 meter square)
    scale: Vector3;
    // Color [0.0-1.0]
    color: ColorRGBA;
    // How long the object should last before being automatically deleted. 0 means forever
    lifetime: DurationPrim;
    // If this marker should be frame-locked, i.e. retransformed into its frame every timestep
    frame_locked: bit;
    // Only used if the type specified has some use for them (eg. POINTS, LINE_STRIP, ...)
    points: Point[];
    // Only used if the type specified has some use for them (eg. POINTS, LINE_STRIP, ...) number of colors must
    // either be 0 or equal to the number of points NOTE: alpha is not yet used
    colors: ColorRGBA[];
    // NOTE: only used for text markers
    text: string;
    // NOTE: only used for MESH_RESOURCE markers
    mesh_resource: string;
    mesh_use_embedded_materials: bit;
}

message struct MarkerArray {
    markers: Marker[];
}

// MenuEntry message. Each InteractiveMarker message has an array of MenuEntry messages. A collection of MenuEntries
// together describe a menu/submenu/subsubmenu/etc tree, though they are stored in a flat array. The tree
// structure is represented by giving each menu entry an ID number and a "parent_id" field. Top-level entries
// are the ones with parent_id = 0. Menu entries are ordered within their level the same way they are ordered
// in the containing array. Parent entries must appear before their children. Example:
// - id = 3 parent_id = 0 title = "fun"
// - id = 2 parent_id = 0 title = "robot"
// - id = 4 parent_id = 2 title = "pr2"
// - id = 5 parent_id = 2 title = "turtle" Gives a menu tree like this:
// - fun
// - robot
// - pr2
// - turtle ID is a number for each menu entry. Must be unique within the control, and should never be 0.
message struct MenuEntry {
    id: uint32;
    // ID of the parent of this menu entry, if it is a submenu. If this menu entry is a top-level entry, set parent_id
    // to 0.
    parent_id: uint32;
    // menu / entry title
    title: string;
    // Arguments to command indicated by command_type (below)
    command: string;
    command_type: MenuEntryCommandTypeConstants;
}

