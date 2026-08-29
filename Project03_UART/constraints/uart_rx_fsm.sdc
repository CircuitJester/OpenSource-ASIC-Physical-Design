create_clock -name clk -period 10 [get_ports clk]

set_input_delay 1.0 -clock clk [get_ports rx]

set_output_delay 1.0 -clock clk [get_ports data_out]
set_output_delay 1.0 -clock clk [get_ports done]

set_false_path -from [get_ports rst]
