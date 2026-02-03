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
module ROS::Common::v1.shape_msgs

import ROS::Common::v1.geometry_msgs (Point)
import tangram::flex::helpers::v1.annotations (Length)

// For the BOX type, the X, Y, and Z dimensions are the length of the corresponding sides of the box.
enum SolidPrimitiveTypeConstants uint8 {
    BOX_X = 0;
    BOX_Y = 1;
    BOX_Z = 2;
}

enum SolidPrimitiveUint8Constants uint8 {
    BOX = 1;
    SPHERE = 2;
    CYLINDER = 3;
    CONE = 4;
    SPHERE_RADIUS = 0;
    CYLINDER_HEIGHT = 0;
    CYLINDER_RADIUS = 1;
    CONE_HEIGHT = 0;
    CONE_RADIUS = 1;
}

// Definition of a mesh list of triangles; the index values refer to positions in vertices[]
message struct Mesh {
    triangles: MeshTriangle[];
    // the actual vertices that make up the mesh
    vertices: Point[];
}

// Definition of a triangle's vertices
message struct MeshTriangle {
    @Length(3)
    vertex_indices: uint32[];
}

// Representation of a plane, using the plane equation ax + by + cz + d = 0 a := coef[0] b := coef[1] c :=
// coef[2] d := coef[3]
message struct Plane {
    @Length(4)
    coef: float64[];
}

// Define box, sphere, cylinder, cone All shapes are defined to have their bounding boxes centered around
// 0,0,0.
message struct SolidPrimitive {
    // The type of the shape
    _type: SolidPrimitiveTypeConstants;
    // The dimensions of the shape
    dimensions: float64[];
}

