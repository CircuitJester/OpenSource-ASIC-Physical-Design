read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.tech.lef
read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.macro.mod.lef
read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

read_verilog /project/yosys/asic/spi_master_mapped.v
link_design spi_master_top

read_sdc /project/constraints/spi_master.sdc

report_design_area
report_checks -path_delay max -fields {slew cap input_pin} -digits 3

write_db /project/openroad/spi_master/1_synth.odb
write_sdc -no_timestamp /project/openroad/spi_master/1_synth.sdc
