// haczyk.scad
// Haczyk (hook / open bracket) modelled from the hand sketch haczyk.png
//
// Interpretation of the dimensions written on the drawing:
//   53 mm  - outer width          (50 inner + 3 wall)
//   50 mm  - inner width
//   20 mm  - height of the tall (right) wall
//   10 mm  - height of the short (left) wall
//    3 mm  - material thickness
//   20 mm  - depth (extrusion), taken from the top view
// The two unlabelled-looking values (17 and 5) are approximations of the
// inner step shown at the bottom of the profile; adjust foot_len / lip
// below if your reading differs.

// ----- parameters -----
long = 123.3;
walls = 1.5;
h1 = 1.5;
h2 = 2.5;
H1 = 13.2;
H2 = 40.2;

long2 = 163;
H3 = 13;

// 2D cross section of the hook, drawn in the XZ plane
module profile() {
    polygon(points = [
        [0,           0],           // outer 
        [0, -h1],
        [long, -h1],
        [long, -h1 + h2],
        [long + walls, -h1 + h2],
        [long + walls, -h1 + h2 - H2],
        [-walls, -h1 + h2 - H1],
        [-walls, 0]

    ]);
}


module profile2() {
    polygon(points = [
        [0,           0],           // outer 
        [0, -h1],
        [long2, -h1],
        [long2, -h1 + h2],
        [long2 + walls, -h1 + h2],
        [long2 + walls, -h1 + h2 - H3],
        [-walls, -h1 + h2 - H3],
        [-walls, 0]

    ]);
}
// ----- model -----
linear_extrude(height = 163)
    profile();


translate([0, 0, 163])
rotate([90, 90, 90])
linear_extrude(height = 123.3)
    profile2();