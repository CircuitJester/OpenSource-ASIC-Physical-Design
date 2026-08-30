create_clock -name clk -period 10 [get_ports clk]

set_input_delay 1.0 -clock clk [get_ports enable]
set_input_delay 1.0 -clock clk [get_ports period]

set_output_delay 1.0 -clock clk [get_ports timeout]

set_false_path -from [get_ports rst]
