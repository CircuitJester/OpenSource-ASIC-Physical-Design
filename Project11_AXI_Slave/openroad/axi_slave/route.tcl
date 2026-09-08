read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.tech.lef
read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.macro.mod.lef
read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

read_db /project/openroad/axi_slave/4_cts.odb
read_sdc /project/openroad/axi_slave/4_cts.sdc

source /OpenROAD-flow-scripts/flow/platforms/nangate45/setRC.tcl
source /OpenROAD-flow-scripts/flow/platforms/nangate45/make_tracks.tcl

set_routing_layers -signal metal2-metal7

global_route

estimate_parasitics -global_routing

report_checks -path_delay max -fields {slew cap input_pin} -digits 3

write_db /project/openroad/axi_slave/5_global_route.odb
write_sdc -no_timestamp /project/openroad/axi_slave/5_global_route.sdc
