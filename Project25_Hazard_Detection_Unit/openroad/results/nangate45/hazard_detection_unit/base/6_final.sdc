###############################################################################
# Created by write_sdc
###############################################################################
current_design hazard_detection_unit
###############################################################################
# Timing Constraints
###############################################################################
set_input_delay 1.0000 -add_delay [get_ports {id_ex_mem_read}]
set_input_delay 1.0000 -add_delay [get_ports {id_ex_rd[0]}]
set_input_delay 1.0000 -add_delay [get_ports {id_ex_rd[1]}]
set_input_delay 1.0000 -add_delay [get_ports {id_ex_rd[2]}]
set_input_delay 1.0000 -add_delay [get_ports {id_ex_rd[3]}]
set_input_delay 1.0000 -add_delay [get_ports {id_ex_rd[4]}]
set_input_delay 1.0000 -add_delay [get_ports {if_id_rs1[0]}]
set_input_delay 1.0000 -add_delay [get_ports {if_id_rs1[1]}]
set_input_delay 1.0000 -add_delay [get_ports {if_id_rs1[2]}]
set_input_delay 1.0000 -add_delay [get_ports {if_id_rs1[3]}]
set_input_delay 1.0000 -add_delay [get_ports {if_id_rs1[4]}]
set_input_delay 1.0000 -add_delay [get_ports {if_id_rs2[0]}]
set_input_delay 1.0000 -add_delay [get_ports {if_id_rs2[1]}]
set_input_delay 1.0000 -add_delay [get_ports {if_id_rs2[2]}]
set_input_delay 1.0000 -add_delay [get_ports {if_id_rs2[3]}]
set_input_delay 1.0000 -add_delay [get_ports {if_id_rs2[4]}]
set_output_delay 1.0000 -add_delay [get_ports {id_ex_flush}]
set_output_delay 1.0000 -add_delay [get_ports {if_id_write}]
set_output_delay 1.0000 -add_delay [get_ports {pc_write}]
###############################################################################
# Environment
###############################################################################
###############################################################################
# Design Rules
###############################################################################
