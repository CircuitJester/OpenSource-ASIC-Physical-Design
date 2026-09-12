read_db /project/openroad/uart_controller/7_post_cts_no_dummy.odb

read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

read_sdc /project/constraints/uart_controller.sdc

set_propagated_clock [all_clocks]

set_routing_layers -signal metal2-metal10

global_route

report_design_area
report_checks -path_delay max -fields {slew cap input_pin} -digits 3

write_db /project/openroad/uart_controller/8_global_route_no_dummy.odb
write_def /project/openroad/uart_controller/8_global_route_no_dummy.def
write_guides /project/openroad/uart_controller/8_global_route_no_dummy.guide

exit
