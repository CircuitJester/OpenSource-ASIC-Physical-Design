read_db /project/openroad/i2c_master/11_post_cts.odb

read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib
read_sdc /project/constraints/i2c_master.sdc

set_routing_layers -signal metal2-metal7
set_routing_layers -clock metal4-metal7

global_route

estimate_parasitics -global_routing

set_propagated_clock [get_clocks clk]

report_design_area
report_checks -path_delay max -fields {slew cap input_pin} -digits 3

write_db /project/openroad/i2c_master/12_global_route.odb
write_def /project/openroad/i2c_master/12_global_route.def
