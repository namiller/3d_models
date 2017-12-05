# 3d_models
CAD models

# scad -> stl
(sudo apt-get install openscad)
openscad -o filename.stl filename.scad

# stl -> gcode
(sudo apt-get install slic3r)
(configure 3d printer/fillament settings and export settings as settings.ini)

slic3r --load settings.ini -o filename.gcode filename.stl

# Future work:
Add bazel rules for generating gcode from scad files.
