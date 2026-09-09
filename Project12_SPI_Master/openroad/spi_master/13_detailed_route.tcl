read_db /project/openroad/spi_master/12_global_route.odb

read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

read_sdc /project/constraints/spi_master.sdc

detailed_route

report_design_area
report_checks -path_delay max -fields {slew cap input_pin} -digits 3

write_db /project/openroad/spi_master/13_detailed_route.odb
write_def /project/openroad/spi_master/13_detailed_route.def
