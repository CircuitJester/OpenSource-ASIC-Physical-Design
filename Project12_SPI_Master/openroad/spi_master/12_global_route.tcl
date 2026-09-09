read_db /project/openroad/spi_master/11_post_cts.odb

read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

read_sdc /project/constraints/spi_master.sdc

set_routing_layers -signal metal2-metal7
set_routing_layers -clock metal4-metal7

global_route

report_design_area
report_checks -path_delay max -fields {slew cap input_pin} -digits 3

write_db /project/openroad/spi_master/12_global_route.odb
write_def /project/openroad/spi_master/12_global_route.def
