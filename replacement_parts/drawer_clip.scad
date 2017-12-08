width = 24.8;

module base() {
  linear_extrude(2.5) {
    difference() {
      translate([width/-2,0,0]) square([width,16]);
      translate([0,9,0]) circle(4.5/2, $fn=60);
    }
  }
  linear_extrude(26) {
    translate([width/-2, 0, 0]) square([width, 2.2]);
  }
}
module support() {
  rotate([0,-90,0]) {
    linear_extrude(1.5) {
      polygon([[0,0],[0,7],[3,0]]);
    }
  }
}

module clip() {
  rotate([0, -90, 180]) {
    linear_extrude(width) {
      polygon([[10,0],[3,5],[0,0]]);
    }
  }
}

base();
translate([width/-2 + 1.5, 2.2, 2.5]) support();
translate([width/2, 2.2, 2.5]) support();
translate([width/-2,0,26-10]) clip();
