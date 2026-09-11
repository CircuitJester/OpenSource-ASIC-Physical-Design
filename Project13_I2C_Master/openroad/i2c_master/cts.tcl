read_db /project/openroad/i2c_master/5_legalized.odb

read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib
read_sdc /project/constraints/i2c_master.sdc

set_wire_rc -signal -layer metal3
set_wire_rc -clock -layer metal4

clock_tree_synthesis \
  -buf_list "BUF_X1 BUF_X2 BUF_X4 BUF_X8 BUF_X16" \
  -root_buf BUF_X4 \
  -wire_unit 20

set_propagated_clock [get_clocks clk]

report_clock_skew
report_checks -path_delay max -fields {slew cap input_pin} -digits 3

write_db /project/openroad/i2c_master/10_cts.odb
write_def /project/openroad/i2c_master/10_cts.def
