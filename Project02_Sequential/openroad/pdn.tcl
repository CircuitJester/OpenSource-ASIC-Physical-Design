# Project02: 4-bit Binary Counter
# Lightweight PDN for a small standard-cell-only design

add_global_connection -net {VDD} -inst_pattern {.*} -pin_pattern {^VDD$} -power
add_global_connection -net {VDD} -inst_pattern {.*} -pin_pattern {^VDDPE$} -power
add_global_connection -net {VDD} -inst_pattern {.*} -pin_pattern {^VDDCE$} -power

add_global_connection -net {VSS} -inst_pattern {.*} -pin_pattern {^VSS$} -ground
add_global_connection -net {VSS} -inst_pattern {.*} -pin_pattern {^VSSE$} -ground

global_connect

set_voltage_domain -name {CORE} -power {VDD} -ground {VSS}

define_pdn_grid -name {grid} -voltage_domains {CORE}

add_pdn_stripe -grid {grid} -layer {metal1} -width {0.17} -pitch {2.4} -offset {0} -followpins

add_pdn_stripe -grid {grid} -layer {metal4} -width {0.40} -pitch {20.0} -offset {1}

add_pdn_stripe -grid {grid} -layer {metal7} -width {1.00} -pitch {20.0} -offset {1}

add_pdn_connect -grid {grid} -layers {metal1 metal4}
add_pdn_connect -grid {grid} -layers {metal4 metal7}
