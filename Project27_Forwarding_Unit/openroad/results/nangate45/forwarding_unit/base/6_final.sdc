###############################################################################
# Created by write_sdc
###############################################################################
current_design forwarding_unit
###############################################################################
# Timing Constraints
###############################################################################
set_input_delay 1.0000 -add_delay [get_ports {ex_mem_rd[0]}]
set_input_delay 1.0000 -add_delay [get_ports {ex_mem_rd[1]}]
set_input_delay 1.0000 -add_delay [get_ports {ex_mem_rd[2]}]
set_input_delay 1.0000 -add_delay [get_ports {ex_mem_rd[3]}]
set_input_delay 1.0000 -add_delay [get_ports {ex_mem_rd[4]}]
set_input_delay 1.0000 -add_delay [get_ports {ex_mem_reg_write}]
set_input_delay 1.0000 -add_delay [get_ports {id_ex_rs1[0]}]
set_input_delay 1.0000 -add_delay [get_ports {id_ex_rs1[1]}]
set_input_delay 1.0000 -add_delay [get_ports {id_ex_rs1[2]}]
set_input_delay 1.0000 -add_delay [get_ports {id_ex_rs1[3]}]
set_input_delay 1.0000 -add_delay [get_ports {id_ex_rs1[4]}]
set_input_delay 1.0000 -add_delay [get_ports {id_ex_rs2[0]}]
set_input_delay 1.0000 -add_delay [get_ports {id_ex_rs2[1]}]
set_input_delay 1.0000 -add_delay [get_ports {id_ex_rs2[2]}]
set_input_delay 1.0000 -add_delay [get_ports {id_ex_rs2[3]}]
set_input_delay 1.0000 -add_delay [get_ports {id_ex_rs2[4]}]
set_input_delay 1.0000 -add_delay [get_ports {mem_wb_rd[0]}]
set_input_delay 1.0000 -add_delay [get_ports {mem_wb_rd[1]}]
set_input_delay 1.0000 -add_delay [get_ports {mem_wb_rd[2]}]
set_input_delay 1.0000 -add_delay [get_ports {mem_wb_rd[3]}]
set_input_delay 1.0000 -add_delay [get_ports {mem_wb_rd[4]}]
set_input_delay 1.0000 -add_delay [get_ports {mem_wb_reg_write}]
set_output_delay 1.0000 -add_delay [get_ports {forward_a[0]}]
set_output_delay 1.0000 -add_delay [get_ports {forward_a[1]}]
set_output_delay 1.0000 -add_delay [get_ports {forward_b[0]}]
set_output_delay 1.0000 -add_delay [get_ports {forward_b[1]}]
###############################################################################
# Environment
###############################################################################
###############################################################################
# Design Rules
###############################################################################
