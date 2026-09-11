read_db /project/openroad/i2c_master/3_placement.odb

read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib
read_sdc /project/constraints/i2c_master.sdc

detailed_placement

check_placement -verbose

report_design_area
report_checks -path_delay max -fields {slew cap input_pin} -digits 3

write_db /project/openroad/i2c_master/5_legalized.odb
write_def /project/openroad/i2c_master/5_legalized.def
