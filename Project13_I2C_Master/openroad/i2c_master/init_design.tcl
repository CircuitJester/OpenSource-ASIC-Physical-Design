read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.tech.lef
read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.macro.mod.lef

read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

read_verilog /project/yosys/asic/i2c_master_mapped.v
link_design i2c_master_top

read_sdc /project/constraints/i2c_master.sdc

report_design_area
report_checks -path_delay max -fields {slew cap input_pin} -digits 3

write_db /project/openroad/i2c_master/1_synth.odb
write_sdc -no_timestamp /project/openroad/i2c_master/1_synth.sdc
