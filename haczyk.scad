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
t        = 3;    // material thickness
inner    = 50;   // inner width
wall_hi  = 20;   // tall wall height
wall_lo  = 10;   // short wall height
depth    = 20;   // extrusion depth
foot_len = 17;   // inner length of the floor step
lip      = 5;    // inner lip height at the short wall

outer = inner + t;   // 53

// 2D cross section of the hook, drawn in the XZ plane
module profile() {
    polygon(points = [
        [0,           0],           // outer 
        [0,       -10],         
        [56, -10]  ,
        [56, 17]   ,
        [76,17],
        [76,0],
        [79,0],
        [79,20],
        [53,20],
        [53,-7],
        [23,-7],
        [23, -2],
        [20, -2],
        [20, -7],
        [3,-7],
        [3,0]
    ]);
}

// ----- model -----
linear_extrude(height = depth, convexity = 10)
    profile();
