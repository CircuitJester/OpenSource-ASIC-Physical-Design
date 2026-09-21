# Project 23 — Forwarding Unit

## Overview

This project implements a forwarding unit for a pipelined processor. It compares source-register addresses against destination-register addresses from later pipeline stages and generates forwarding control signals.

The design was synthesized using Yosys with the Nangate45 standard-cell library and taken through the OpenROAD physical-design flow.

## RTL Modules

| Module | Description |
|---|---|
| `forwarding_comparator` | Compares register addresses and generates match information. |
| `forwarding_control_logic` | Determines forwarding selections from the comparison results. |
| `forwarding_datapath` | Implements datapath-related forwarding logic. |
| `forwarding_mux` | Implements forwarding selection logic. |
| `forwarding_unit` | Top-level forwarding control module. |

**Top module:** `forwarding_unit`

The top-level hierarchy uses the comparator and control logic. The datapath and MUX modules are also included as standalone RTL modules.

## Interface

### Inputs

- `rs1[4:0]`
- `rs2[4:0]`
- `ex_mem_rd[4:0]`
- `ex_mem_reg_write`
- `mem_wb_rd[4:0]`
- `mem_wb_reg_write`

### Outputs

- `forward_a[1:0]`
- `forward_b[1:0]`

## Functional Behavior

The unit checks whether either source register matches a destination register in a later pipeline stage when that stage is enabled to write a register.

The resulting control outputs select the appropriate forwarding source for the two operands.

## Verification and Synthesis

The following work was completed:

- Ran functional simulation executables for the comparator, control logic, datapath, MUX, and top-level unit.
- Ran the project's Yosys synthesis scripts.
- Generated Nangate45-mapped netlist output.
- Completed the OpenROAD physical-design flow through final reporting and GDS generation.
- Ran the KLayout FreePDK45 DRC deck against the final GDS.

Simulation executables reached `$finish` without runtime errors. The available simulation output did not establish assertion-based pass status.

## ASIC Flow

### Technology

- Platform: Nangate45
- Standard-cell library: Nangate Open Cell Library, typical corner
- Physical-design tool: OpenROAD-flow-scripts
- Layout inspection and rule-deck execution: KLayout

### Main flow stages

1. Yosys synthesis and technology mapping
2. Floorplanning
3. Placement
4. Clock-tree stage in the flow
5. Global routing
6. Detailed routing
7. Filler insertion and final reporting
8. GDS generation

The forwarding unit is combinational and has no sequential registers. Therefore, clock-related timing and skew metrics are not meaningful indicators of its operating frequency.

## Physical-Design Results

| Metric | Result |
|---|---:|
| Standard-cell area | 89.376 µm² |
| Reported utilization | 5.74% |
| Die area | 2500 µm² |
| Core area | 1556.63 µm² |
| Standard-cell instances | 130 |
| Detailed-route violations at completion | 0 |
| Antenna net violations reported by OpenROAD | 0 |
| Antenna pin violations reported by OpenROAD | 0 |
| Setup TNS | 0 |
| Hold TNS | 0 |
| Final GDS | Generated |
| Final DEF | Generated |
| Final ODB | Generated |

The setup and hold TNS values are reported by the flow, but the design has no sequential timing paths. The reported worst-slack sentinel values and Fmax should not be interpreted as meaningful timing closure or a supported clock frequency.

## DRC Notes

The KLayout FreePDK45 rule deck was executed against the generated GDS. The captured console output showed the checks running, but did not provide a formal DRC-clean summary or a saved violation database. Therefore, this project does not claim formal DRC signoff.

OpenROAD also reported that no antenna diode cell was available in the platform library for its antenna-repair step.

## Important Files

```text
Project23_Forwarding_Unit/
├── constraints/
│   └── forwarding_unit.sdc
├── liberty/
│   └── NangateOpenCellLibrary_typical.lib
├── openroad/
│   ├── forwarding_unit/
│   │   └── config.mk
│   ├── logs/
│   ├── objects/
│   ├── reports/
│   ├── results/
│   └── src/
│       └── forwarding_unit/
│           ├── forwarding_unit.sdc
│           └── forwarding_unit_mapped.v
├── rtl/
│   ├── forwarding_comparator.v
│   ├── forwarding_control_logic.v
│   ├── forwarding_datapath.v
│   ├── forwarding_mux.v
│   └── forwarding_unit.v
└── yosys/
    └── asic/
        ├── forwarding_unit_mapped.v
        ├── map_nangate45.log
        └── map_nangate45.ys