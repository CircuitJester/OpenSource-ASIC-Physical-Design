read_db /project/openroad/i2c_master/2_floorplan.odb

read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

read_sdc /project/constraints/i2c_master.sdc

set_wire_rc -signal -layer metal3
set_wire_rc -clock -layer metal3

global_placement \
  -density 0.30 \
  -timing_driven

estimate_parasitics -placement

report_design_area
report_checks -path_delay max -fields {slew cap input_pin} -digits 3

write_db /project/openroad/i2c_master/3_placement.odb
write_def /project/openroad/i2c_master/3_placement.def
