export DESIGN_NICKNAME = branch_target_buffer
export DESIGN_NAME = branch_target_buffer
export PLATFORM = nangate45

export VERILOG_FILES = $(DESIGN_HOME)/src/branch_target_buffer/branch_target_buffer_mapped.v
export SDC_FILE = $(DESIGN_HOME)/src/branch_target_buffer/branch_target_buffer.sdc

export PLACE_DENSITY = 0.30

export DIE_AREA = 0 0 70 70
export CORE_AREA = 5 5 65 65

export CLOCK_PERIOD = 10.0

export SKIP_CTS_REPAIR_TIMING = 1
export OPT_POST_GRT_WNS = 0
export HOLD_SLACK_MARGIN = -0.05
