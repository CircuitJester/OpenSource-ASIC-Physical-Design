export DESIGN_NICKNAME = data_cache
export DESIGN_NAME = data_cache
export PLATFORM = nangate45

export VERILOG_FILES = $(DESIGN_HOME)/src/data_cache/data_cache_mapped.v
export SDC_FILE = $(DESIGN_HOME)/src/data_cache/data_cache.sdc

export PLACE_DENSITY = 0.30

export DIE_AREA = 0 0 110 110
export CORE_AREA = 5 5 105 105

export CLOCK_PERIOD = 10.0

export SKIP_CTS_REPAIR_TIMING = 1
export OPT_POST_GRT_WNS = 0
export HOLD_SLACK_MARGIN = -0.05
