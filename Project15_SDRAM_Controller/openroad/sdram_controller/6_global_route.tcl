read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib
read_db /project/openroad/sdram_controller/results/nangate45/sdram_controller/base/4_1_cts.odb
read_sdc /project/openroad/sdram_controller/results/nangate45/sdram_controller/base/4_cts.sdc

source /OpenROAD-flow-scripts/flow/platforms/nangate45/setRC.tcl

estimate_parasitics -placement

set_routing_layers -signal metal1-metal7

global_route -guide_file /project/openroad/sdram_controller/6_global_route.guide

write_db /project/openroad/sdram_controller/6_global_route.odb
write_def /project/openroad/sdram_controller/6_global_route.def
