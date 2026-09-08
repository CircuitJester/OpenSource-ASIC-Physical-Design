read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.tech.lef
read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.macro.mod.lef
read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

read_db /project/openroad/axi_slave/2_floorplan.odb
read_sdc /project/openroad/axi_slave/2_floorplan.sdc

global_placement -density 0.30
repair_design
detailed_placement

check_placement

report_design_area
report_checks -path_delay max -fields {slew cap input_pin} -digits 3

write_db /project/openroad/axi_slave/3_placement.odb
write_sdc -no_timestamp /project/openroad/axi_slave/3_placement.sdc
