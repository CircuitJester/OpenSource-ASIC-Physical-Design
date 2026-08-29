create_clock -name clk -period 10 [get_ports clk]

set_input_delay 1.0 -clock clk [get_ports start]
set_input_delay 1.0 -clock clk [get_ports data_in]

set_output_delay 1.0 -clock clk [get_ports tx]
set_output_delay 1.0 -clock clk [get_ports busy]

set_false_path -from [get_ports rst]
