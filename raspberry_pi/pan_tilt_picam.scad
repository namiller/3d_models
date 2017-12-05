/*
* An adapter between the Adafruit Pan/Tilt gimbal and the rapsberry pi camera.
*/

module rounded_quadrant(size, radius){
  difference() {
    square(size);
    translate(size - [radius, radius]) {
      difference(){
        square([radius+.1,radius+.1]);
        circle(radius, $fn=50);
      }
    }
  }
}

module four_sym(){
  for (i = [0:4]) {
    mirror([i%2, 0, 0]) mirror([0, floor(i/2), 0]) children();
  }
}

module rounded_square(size, radius) {
  four_sym() rounded_quadrant(size/2, radius);
}

module camera_mount() {  
  linear_extrude(1) {
    rounded_square([25,24], 2);
  }
  
  linear_extrude(5.5) {
    translate([0,3.8]) {
      four_sym(){
        translate([10.5, 6.25]) {
          circle(.95, $fn=50);
        }
      }
    }
  }
  
  linear_extrude(4) {
    intersection(){
      translate([0,3.8]) {
        four_sym(){
          translate([10.5, 6.25]) {
            circle(4.7/2, $fn=50);
          }
        }
      }
      rounded_square([25,24], 2);
    }
  }
}

module base_perim() {
  intersection() {
    square([29.6,30.2], true);
    circle(18, $fn=50);
  }
}

translate([0,2,1]) {
  camera_mount();
}

linear_extrude(10) {
  difference() {
    base_perim();
		// TODO(namiller): Consider replacing 26.5 with 25.
    square([26.5,30.2], true);
  }
}

linear_extrude(2) {
  base_perim();
}
