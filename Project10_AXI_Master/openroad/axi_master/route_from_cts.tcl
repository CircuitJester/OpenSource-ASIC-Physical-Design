read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

read_db /project/openroad/axi_master/4_cts_manual.odb
read_sdc /project/openroad/axi_master/4_cts_manual.sdc

source /OpenROAD-flow-scripts/flow/platforms/nangate45/setRC.tcl

set_routing_layers -signal metal2-metal7

global_route

report_checks -path_delay max -fields {slew cap input_pin} -digits 3
report_checks -path_delay min -fields {slew cap input_pin} -digits 3

detailed_route -no_pin_access


report_checks -path_delay max -fields {slew cap input_pin} -digits 3
report_checks -path_delay min -fields {slew cap input_pin} -digits 3

write_db /project/openroad/axi_master/5_route.odb
write_sdc -no_timestamp /project/openroad/axi_master/5_route.sdc
