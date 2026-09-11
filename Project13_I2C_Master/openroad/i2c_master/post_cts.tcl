read_db /project/openroad/i2c_master/10_cts.odb

read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib
read_sdc /project/constraints/i2c_master.sdc

set_wire_rc -signal -layer metal3
set_wire_rc -clock -layer metal4

repair_design

detailed_placement
check_placement -verbose

set_propagated_clock [get_clocks clk]

report_design_area
report_checks -path_delay max -fields {slew cap input_pin} -digits 3

write_db /project/openroad/i2c_master/11_post_cts.odb
write_def /project/openroad/i2c_master/11_post_cts.def
