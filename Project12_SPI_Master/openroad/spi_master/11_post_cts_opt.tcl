read_db /project/openroad/spi_master/10_cts.odb

read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

read_sdc /project/constraints/spi_master.sdc

set_wire_rc -signal -layer metal3
set_wire_rc -clock -layer metal4

repair_design

detailed_placement

check_placement -verbose

report_clock_skew
report_checks -path_delay max -fields {slew cap input_pin} -digits 3

write_db /project/openroad/spi_master/11_post_cts.odb
write_def /project/openroad/spi_master/11_post_cts.def
