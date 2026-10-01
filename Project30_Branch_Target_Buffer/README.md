# Project30 — Branch Target Buffer

## Overview

This project implements the physical design of a 4-entry Branch Target Buffer (BTB) using the open-source OpenROAD ASIC flow with the Nangate45 technology library.

The BTB stores branch target information indexed by the lookup program counter. Each entry contains a valid bit, a 28-bit tag, and a 32-bit target address.

## Design

### Inputs
- `clk`
- `rst`
- `lookup_pc[31:0]`
- `update_enable`
- `branch_pc[31:0]`
- `branch_target[31:0]`

### Outputs
- `hit`
- `target_pc[31:0]`

The design uses a synchronous reset and updates the BTB on the rising edge of `clk`.

## RTL / Synthesis

RTL development, simulation, and Yosys synthesis were completed separately in:

`../Verilog_projects/Verilog_Project30`

The mapped netlist used for the physical-design flow is:

`branch_target_buffer_mapped.v`

## Physical Design

Technology:
- Nangate45

Clock:
- `clk`
- Period: 10 ns
- Frequency: 100 MHz

Final floorplan:
- Die: 70 × 70 µm
- Core: 60 × 60 µm
- Placement density target: 0.30

The initial 55 × 55 µm floorplan was insufficient because placement utilization exceeded 100%. The floorplan was increased to 70 × 70 µm with a 60 × 60 µm core, allowing placement and routing to complete successfully.

## Final Physical Results

| Parameter | Result |
|---|---:|
| Design area | ~2370 µm² |
| Utilization | ~67% |
| Total vias | 6709 |
| Detailed-route violations | 0 |
| Antenna net violations | 0 |
| Antenna pin violations | 0 |
| Filler instances | 1056 |

## Timing Results

Timing was analyzed using a 10 ns clock constraint.

| Metric | Result |
|---|---:|
| Clock period | 10.00 ns |
| WNS | 0.00 ns |
| TNS | 0.00 ns |
| Worst reported slack | 7.00 ns |
| Setup violations | 0 |
| Hold violations | 0 |
| Max slew violations | 0 |
| Max fanout violations | 0 |
| Max capacitance violations | 0 |

A reported path was:

`lookup_pc[2] → target_pc[31]`

with 7.00 ns slack.

## Final Artifacts

Stored under:

`openroad/results/nangate45/branch_target_buffer/base/`

Files:

- `6_final.def`
- `6_final.odb`
- `6_final.sdc`
- `6_final.v`

## Limitations

The final OpenROAD reporting stage terminated with an `illegal instruction` error after the final ODB and SDC files had already been written.

Therefore, the physical-design results generated before the crash are retained, but full final reporting/signoff is not claimed.

No final GDS artifact was generated in this run.

## Tools

- Verilog
- Yosys
- OpenROAD
- OpenROAD-flow-scripts
- Nangate45
- Docker
- WSL2 / Ubuntu

## Project Status

**OpenROAD Physical Design: Completed**

Routing:
- Detailed-route violations: 0
- Antenna violations: 0

Timing:
- WNS: 0.00 ns
- TNS: 0.00 ns
- Setup violations: 0
- Hold violations: 0

Final signoff:
- Not claimed
