read_db /project/openroad/uart_controller/5_legalization.odb

read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

read_sdc /project/constraints/uart_controller.sdc

set_wire_rc -signal -layer metal3
set_wire_rc -clock -layer metal4

clock_tree_synthesis \
  -buf_list {CLKBUF_X3 CLKBUF_X2 CLKBUF_X1} \
  -dont_use_dummy_load

set_propagated_clock [all_clocks]

report_clock_skew
report_checks -path_delay max -fields {slew cap input_pin} -digits 3

write_db /project/openroad/uart_controller/6_cts_no_dummy.odb
write_def /project/openroad/uart_controller/6_cts_no_dummy.def
