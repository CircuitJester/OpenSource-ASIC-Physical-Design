read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

read_db /project/openroad/axi_master/5_1_grt.odb
read_sdc /project/openroad/axi_master/5_1_grt.sdc

source /OpenROAD-flow-scripts/flow/platforms/nangate45/setRC.tcl

set_propagated_clock [all_clocks]

detailed_route \
  -output_drc /project/openroad/axi_master/5_2_route.drc \
  -output_maze /project/openroad/axi_master/5_2_route.maze \
  -no_pin_access

report_checks -path_delay max -fields {slew cap input_pin} -digits 3
report_checks -path_delay min -fields {slew cap input_pin} -digits 3

write_db /project/openroad/axi_master/5_2_route.odb
write_sdc -no_timestamp /project/openroad/axi_master/5_2_route.sdc
