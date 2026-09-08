read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.tech.lef
read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.macro.mod.lef
read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

read_db /project/openroad/axi_slave/5_global_route_official.odb
read_sdc /project/openroad/axi_slave/5_global_route_official.sdc

source /OpenROAD-flow-scripts/flow/platforms/nangate45/setRC.tcl
source /OpenROAD-flow-scripts/flow/platforms/nangate45/make_tracks.tcl

set_routing_layers -signal metal2-metal10
set_routing_layers -clock metal4-metal10

puts "=== GUIDE COVERAGE ==="

detailed_route \
  -output_guide_coverage /project/openroad/axi_slave/guide_coverage.rpt \
  -droute_end_iter 0 \
  -no_pin_access
