read_db /project/openroad/uart_controller/6_cts_no_dummy.odb

read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

read_sdc /project/constraints/uart_controller.sdc

detailed_placement

report_design_area
report_checks -path_delay max -fields {slew cap input_pin} -digits 3

write_db /project/openroad/uart_controller/6_5_detailed_placement_no_dummy.odb
write_def /project/openroad/uart_controller/6_5_detailed_placement_no_dummy.def
