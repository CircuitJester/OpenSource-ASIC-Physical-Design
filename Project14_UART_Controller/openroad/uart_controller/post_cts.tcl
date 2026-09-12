read_db /project/openroad/uart_controller/6_cts.odb

read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

read_sdc /project/constraints/uart_controller.sdc

set_wire_rc -signal -layer metal3
set_wire_rc -clock -layer metal4

set_propagated_clock [all_clocks]

estimate_parasitics -placement

repair_design

report_design_area
report_checks -path_delay max -fields {slew cap input_pin} -digits 3

write_db /project/openroad/uart_controller/7_post_cts.odb
write_def /project/openroad/uart_controller/7_post_cts.def
