read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.tech.lef
read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.macro.mod.lef
read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

read_db /project/openroad/axi_slave/4_cts.odb
read_sdc /project/openroad/axi_slave/4_cts.sdc

source /OpenROAD-flow-scripts/flow/platforms/nangate45/setRC.tcl
source /OpenROAD-flow-scripts/flow/platforms/nangate45/make_tracks.tcl
set_global_routing_layer_adjustment metal2-metal3 0.5
set_global_routing_layer_adjustment metal4-metal10 0.25

set_routing_layers -clock metal4-metal10
set_routing_layers -signal metal2-metal10

global_route \
  -guide_file /project/openroad/axi_slave/5_global_route_official.guide

estimate_parasitics -global_routing

report_design_area
report_checks -path_delay max -fields {slew cap input_pin} -digits 3

write_db /project/openroad/axi_slave/5_global_route_official.odb
write_sdc -no_timestamp /project/openroad/axi_slave/5_global_route_official.sdc
