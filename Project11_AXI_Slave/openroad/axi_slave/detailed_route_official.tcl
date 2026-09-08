read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.tech.lef
read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.macro.mod.lef
read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

read_db /project/openroad/axi_slave/5_global_route_official.odb
read_sdc /project/openroad/axi_slave/5_global_route_official.sdc

source /OpenROAD-flow-scripts/flow/platforms/nangate45/setRC.tcl
source /OpenROAD-flow-scripts/flow/platforms/nangate45/make_tracks.tcl

detailed_route -no_pin_access

check_placement

report_design_area
report_checks -path_delay max -fields {slew cap input_pin} -digits 3

write_def /project/openroad/axi_slave/6_detailed_route.def
write_db /project/openroad/axi_slave/6_detailed_route.odb
write_sdc -no_timestamp /project/openroad/axi_slave/6_detailed_route.sdc
