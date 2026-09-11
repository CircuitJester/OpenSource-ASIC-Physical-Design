read_db /project/openroad/i2c_master/12_global_route.odb

read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib
read_sdc /project/constraints/i2c_master.sdc

set_routing_layers -signal metal2-metal7
set_routing_layers -clock metal4-metal7

set_propagated_clock [get_clocks clk]

detailed_route

check_placement -verbose

report_design_area
report_checks -path_delay max -fields {slew cap input_pin} -digits 3

write_db /project/openroad/i2c_master/13_detailed_route.odb
write_def /project/openroad/i2c_master/13_detailed_route.def
