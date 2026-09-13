read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib
read_db /project/openroad/sdram_controller/6_global_route.odb
read_sdc /project/openroad/sdram_controller/results/nangate45/sdram_controller/base/4_cts.sdc

source /OpenROAD-flow-scripts/flow/platforms/nangate45/setRC.tcl

detailed_route

write_db /project/openroad/sdram_controller/7_detailed_route.odb
write_def /project/openroad/sdram_controller/7_detailed_route.def
