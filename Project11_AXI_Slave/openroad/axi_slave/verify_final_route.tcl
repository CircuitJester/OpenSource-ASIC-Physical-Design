read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.tech.lef
read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.macro.mod.lef
read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

read_db /project/openroad/axi_slave/5_detailed_route_pinaccess.odb
read_sdc /project/openroad/axi_slave/5_detailed_route_pinaccess.sdc

source /OpenROAD-flow-scripts/flow/platforms/nangate45/setRC.tcl

puts "=== PLACEMENT CHECK ==="
check_placement

puts "=== ROUTING CHECK ==="
puts "Design routed: [design_is_routed]"

puts "=== AREA ==="
report_design_area

puts "=== TIMING ==="
report_checks -path_delay max -fields {slew cap input_pin} -digits 3
