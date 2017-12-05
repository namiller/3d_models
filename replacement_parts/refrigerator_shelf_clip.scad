difference() {
    union() {
        difference() {
            difference() {
                mirror([0,1,0]) {
                    rotate([90, 0, 0]) {
                        linear_extrude(height = 21.5) {
                            // The shorter triangle side (and base)
                            difference() {
                                union() {
                                    square([8.5, 15]);
                                    square([15, 4]);
                                }
                                polygon([[0,0],[6.5,15],[0,15]]);
                            }
                            // The taller, curved side
                            translate([12,0]) {
                                    difference() {
                                    square([8, 25]);
                                    translate([109, 25]) {
                                        circle(105, $fn=1000);
                                    }
                                }
                            }
                        }
                    }
                }
                
                // The groves
                for (i = [0:3]) {
                    translate([10.25,3.5 + (14.5/3)*i, 4]) {
                        cylinder(25, 2.5, 2.5, $fn=30);
                    }
                }
            }
            
            translate([14,2,0]) {
                cube([7, 17.5, 23]);
            }
        }
        
        translate([14, 10.75, 10]) {
            rotate([0, 90, 0]) {
                cylinder(6, 2.5, 2.5, $fn=100);
            }
        }
    }
    
    union() {
        translate([10, 5, 7.5]) {
            rotate([0,90,0]) {
                cylinder(6,1,1, $fn=100);
            }
        }
        translate([10, 16.5, 7.5]) {
            rotate([0,90,0]) {
                cylinder(6,1,1, $fn=100);
            }
        }
    }
}