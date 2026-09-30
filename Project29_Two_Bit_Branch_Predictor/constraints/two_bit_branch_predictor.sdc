create_clock -name clk -period 10.0 [get_ports clk]

set_input_delay  1.0 -clock clk [get_ports rst]
set_input_delay  1.0 -clock clk [get_ports update_enable]
set_input_delay  1.0 -clock clk [get_ports branch_taken_actual]

set_output_delay 1.0 -clock clk [get_ports predict_taken]
