read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

read_db /project/openroad/axi_master/4_cts_manual.odb
read_sdc /project/openroad/axi_master/4_cts_manual.sdc

source /OpenROAD-flow-scripts/flow/platforms/nangate45/setRC.tcl

set_propagated_clock [all_clocks]

pin_access

set_routing_layers -signal metal2-metal7

global_route -congestion_iterations 30

estimate_parasitics -global_routing

report_checks -path_delay max -fields {slew cap input_pin} -digits 3
report_checks -path_delay min -fields {slew cap input_pin} -digits 3

write_guides /project/openroad/axi_master/5_1_grt.route.guide
write_db /project/openroad/axi_master/5_1_grt.odb
write_sdc -no_timestamp /project/openroad/axi_master/5_1_grt.sdc
