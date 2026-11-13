// Letter "C" polygon, extruded
//   longest edge (overall height) : 190 mm
//   shorter ends (arm length)     :  80 mm
//   band width (whole thing wide) :  40 mm
//   extrusion depth               :  30 mm
// Overall size: 80 wide x 190 tall x 30 deep, opening faces +X.

height = 190;  // longest edge
arm    = 80;   // shorter ends
band   = 40;   // whole thing wide
depth  = 30;   // extrusion

// Screw slots (stadium / obround), through the back band
slot_d   = 4;        // hole diameter
slot_len = 10;       // overall slot length
slot_x   = band / 2; // centred on height axis (band centre)
slot_y   = [20, 162];

module stadium(x, y) {
    translate([x, y, -1])
        linear_extrude(height = depth + 2)
            hull() {
                translate([0, -(slot_len - slot_d) / 2]) circle(d = slot_d, $fn = 64);
                translate([0,  (slot_len - slot_d) / 2]) circle(d = slot_d, $fn = 64);
            }
}

difference() {
    linear_extrude(height = depth)
        polygon(points = [
            [0,            0          ],
            [arm,          0          ],
            [arm,          band       ],
            [band,         band       ],
            [band,         height-band],
            [arm,          height-band],
            [arm,          height     ],
            [0,            height     ]
        ]);

    for (y = slot_y)
        stadium(slot_x, y);
}
