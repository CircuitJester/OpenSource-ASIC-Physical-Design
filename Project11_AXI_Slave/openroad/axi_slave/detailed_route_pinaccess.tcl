read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.tech.lef
read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.macro.mod.lef
read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

read_db /project/openroad/axi_slave/5_global_route_pinaccess.odb
read_sdc /project/openroad/axi_slave/5_global_route_pinaccess.sdc

source /OpenROAD-flow-scripts/flow/platforms/nangate45/setRC.tcl
source /OpenROAD-flow-scripts/flow/platforms/nangate45/make_tracks.tcl

set_routing_layers -signal metal2-metal10
set_routing_layers -clock metal4-metal10

set_propagated_clock [all_clocks]

detailed_route \
  -no_pin_access \
  -output_drc /project/openroad/axi_slave/5_route_pinaccess.drc \
  -output_maze /project/openroad/axi_slave/5_route_pinaccess.maze

check_placement

report_design_area
report_checks -path_delay max -fields {slew cap input_pin} -digits 3

write_def /project/openroad/axi_slave/5_detailed_route_pinaccess.def
write_db /project/openroad/axi_slave/5_detailed_route_pinaccess.odb
write_sdc -no_timestamp /project/openroad/axi_slave/5_detailed_route_pinaccess.sdc
