read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.tech.lef
read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.macro.mod.lef
read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

read_db /project/openroad/axi_slave/5_global_route_official.odb
read_sdc /project/openroad/axi_slave/5_global_route_official.sdc

puts "=== NET HELP ==="
help report_net

puts "=== WRITE_DATA_22 ==="
report_net write_data[22]
