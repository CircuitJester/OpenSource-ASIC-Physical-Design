export DESIGN_NICKNAME = non_blocking_cache
export DESIGN_NAME = non_blocking_cache
export PLATFORM = nangate45

export VERILOG_FILES = $(DESIGN_HOME)/src/data_cache/non_blocking_cache_mapped.v
export SDC_FILE = $(DESIGN_HOME)/src/data_cache/non_blocking_cache.sdc

export PLACE_DENSITY = 0.30

export DIE_AREA = 0 0 100 100
export CORE_AREA = 5 5 95 95

export CLOCK_PERIOD = 10.0

export SKIP_CTS_REPAIR_TIMING = 1
export OPT_POST_GRT_WNS = 0
export HOLD_SLACK_MARGIN = -0.05
