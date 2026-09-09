read_db /project/openroad/spi_master/3_io.odb

read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

set_wire_rc -signal -layer metal3
set_wire_rc -clock -layer metal3

global_placement \
  -density 0.30 \
  -timing_driven

estimate_parasitics -placement

report_design_area
report_checks -path_delay max -fields {slew cap input_pin} -digits 3

write_db /project/openroad/spi_master/4_place.odb
write_def /project/openroad/spi_master/4_place.def
