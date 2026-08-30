create_clock -name clk -period 10 [get_ports clk]

set_input_delay 1.0 -clock clk [get_ports rst]
set_input_delay 1.0 -clock clk [get_ports wr_en]
set_input_delay 1.0 -clock clk [get_ports rd_en]
set_input_delay 1.0 -clock clk [get_ports data_in]

set_output_delay 1.0 -clock clk [get_ports data_out]
set_output_delay 1.0 -clock clk [get_ports full]
set_output_delay 1.0 -clock clk [get_ports empty]

set_false_path -from [get_ports rst]
