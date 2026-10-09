# Project 36: Non-Blocking Cache — ASIC Physical Design

## Overview
This project implements a non-blocking cache with a single-entry Miss Status Holding Register (MSHR). It allows cache hits to be serviced while a cache miss is outstanding and prevents another miss from being accepted while the MSHR is occupied.

## Design Features
- Direct-mapped cache with four lines
- Read and write hit handling
- Miss tracking using a single-entry MSHR
- Memory refill handling
- Debug outputs for pending misses
- Independent cache-hit processing during an outstanding miss

## Verification
The RTL testbench completed with:
- PASS count: 27
- FAIL count: 0
- Memory read transactions: 3

These results are from the project's simulation testbench, not from physical hardware.

## Synthesis
- RTL top module: `non_blocking_cache`
- Synthesis tool: Yosys
- Standard-cell library: Nangate45
- Mapped netlist: `src/data_cache/non_blocking_cache_mapped.v`
- Mapped cells: 1,767
- D flip-flops: 345

## Physical Design
- Flow: OpenROAD Flow Scripts
- Platform: Nangate45
- Clock period constraint: 10 ns
- Reported design area: 3,393 µm²
- Reported utilization: 43%
- Detailed routing: completed with zero reported routing violations
- Antenna checks: zero net violations and zero pin violations

The flow generated the final ODB and SDC files. The subsequent final-report stage terminated with an `illegal instruction` error in the execution environment. Therefore, a clean exit of the complete flow and a successful signoff run are not claimed.

## Results
The `final_results/` directory contains:
- `5_route.odb`
- `5_route.sdc`
- `6_final.odb`
- `6_final.sdc`

## Directory Structure
- `src/data_cache/` — mapped netlist and timing constraints
- `constraints/` — timing constraints
- `openroad/data_cache/` — OpenROAD configuration
- `final_results/` — routed and final design databases and SDC files

## Notes
This is an educational open-source ASIC physical-design project using the Nangate45 platform. The results do not represent fabrication or silicon measurements.
