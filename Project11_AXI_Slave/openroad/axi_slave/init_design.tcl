read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.tech.lef
read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.macro.mod.lef
read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

read_verilog /project/yosys/asic/axi_slave_mapped.v
link_design axi_slave_top

read_sdc /project/constraints/axi_slave.sdc

report_design_area
report_checks -path_delay max -fields {slew cap input_pin} -digits 3

write_db /project/openroad/axi_slave/1_synth.odb
write_sdc /project/openroad/axi_slave/1_synth.sdc
