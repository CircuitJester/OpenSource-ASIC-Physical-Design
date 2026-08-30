# Project 04 — Utility IP

## Overview

Project 04 focuses on designing and implementing reusable utility RTL IP blocks commonly required inside larger digital systems.

The project contains three practical hardware blocks:

- FIFO
- PWM Generator
- Timer

Each block was developed at the RTL level, verified through simulation, synthesized using Yosys, and taken through an open-source ASIC physical-design flow using OpenROAD.

This project marks the transition from standalone RTL development toward complete RTL-to-GDSII implementation.

---

## IP Blocks

### 1. FIFO

The FIFO provides temporary storage and controlled data transfer between producer and consumer logic.

Key concepts:

- Write and read control
- Data storage
- Read/write pointers
- Full detection
- Empty detection
- Synchronous clocked operation
- Sequential control logic

The FIFO was taken through synthesis, floorplanning, placement, clock-tree synthesis, routing, filler insertion, parasitic extraction, and final GDS generation.

---

### 2. PWM Generator

The PWM Generator produces a pulse-width-modulated output controlled by a configurable duty-cycle value.

Key concepts:

- Counter-based timing
- Duty-cycle control
- Synchronous operation
- Digital waveform generation
- Parameterized timing behavior

The design was synthesized and physically implemented using the Nangate45 technology platform.

---

### 3. Timer

The Timer implements programmable timing functionality using a synchronous counter.

Key concepts:

- Programmable period
- Counter-based timing
- Enable control
- Reset handling
- Timeout generation
- Synchronous digital design

The Timer was also taken through the complete RTL-to-GDSII flow.

---

## Design Flow

The project follows the complete open-source ASIC implementation flow:

    Verilog RTL
        |
        v
    RTL Simulation
        |
        v
    Yosys Synthesis
        |
        v
    Gate-Level Netlist
        |
        v
    OpenROAD
        |
        +--> Floorplanning
        |
        +--> Power Distribution Network
        |
        +--> Placement
        |
        +--> Clock Tree Synthesis
        |
        +--> Global Routing
        |
        +--> Detailed Routing
        |
        +--> Filler Cell Insertion
        |
        +--> Parasitic Extraction
        |
        v
    Final Database
        |
        +--> DEF
        +--> ODB
        +--> SPEF
        +--> Netlist
        +--> GDSII

---

## Tools Used

| Tool | Purpose |
|------|---------|
| Verilog | RTL design |
| Icarus Verilog | RTL simulation |
| GTKWave | Waveform analysis |
| Yosys | RTL synthesis |
| OpenROAD | ASIC physical implementation |
| OpenROAD-flow-scripts | Automated physical-design flow |
| KLayout | GDS/physical-layout processing |
| Nangate45 | Target standard-cell technology |
| Docker | Reproducible EDA environment |
| Git | Version control |

---

## RTL Development

The utility IP blocks were written as synchronous Verilog RTL.

The designs emphasize:

- Clear module interfaces
- Clocked sequential logic
- Deterministic reset behavior
- Reusable control logic
- Synthesizable constructs
- Practical hardware-oriented implementation

The RTL was first verified independently before being passed to the synthesis and physical-design stages.

---

## Yosys Synthesis

Yosys was used to convert each RTL design into a technology-mapped gate-level representation.

The synthesis flow included:

1. RTL parsing
2. Hierarchy analysis
3. Process conversion
4. Logic optimization
5. Register inference
6. Technology mapping
7. Gate-level netlist generation
8. Schematic generation

The synthesized netlists were then used as the starting point for the OpenROAD physical-design flow.

---

## OpenROAD Physical Implementation

The designs were implemented using the Nangate45 standard-cell platform.

The physical-design flow included the following stages.

### Floorplanning

OpenROAD generated the die and core regions based on the configured utilization and aspect ratio.

Standard-cell rows and routing tracks were created during this stage.

### Power Distribution Network

A power grid was generated for the design using the configured PDN strategy.

The final reports confirmed that the VDD and VSS shapes were connected.

### Placement

Standard cells were placed inside the core region.

Detailed placement and legalization were performed to ensure that cells occupied legal placement sites.

### Clock Tree Synthesis

The clock network was synthesized using TritonCTS.

Clock buffers were inserted to distribute the clock to sequential elements.

The CTS stage also performed clock-net repair and detailed placement legalization.

### Routing

The design was routed after CTS.

The routing flow included:

- Global routing
- Detailed routing
- Routed database generation
- Routing guide generation

### Filler Cells

Filler cells were inserted after routing to maintain standard-cell row continuity and satisfy physical implementation requirements.

### Parasitic Extraction

The final physical layout was processed for parasitic extraction.

The resulting SPEF files contain extracted resistance and capacitance information for the routed design.

### Finalization

The final OpenROAD flow generated:

- Final ODB
- Final DEF
- Final SDC
- Final Verilog netlist
- Final SPEF
- Final GDSII

The GDSII files were generated through the KLayout-based stream-out process.

---

## Physical Design Results

### FIFO

The FIFO successfully completed the physical implementation flow.

Final implementation artifacts included:

- `6_final.odb`
- `6_final.def`
- `6_final.sdc`
- `6_final.spef`
- `6_final.v`
- `6_final.gds`

The final GDSII file was confirmed as a valid GDSII Stream file.

The final implementation included clock buffers, timing-repair buffers, sequential cells, combinational cells, tap cells, and filler cells.

---

### PWM Generator

The PWM Generator successfully completed the OpenROAD physical-design flow.

Final implementation artifacts included:

- `6_final.odb`
- `6_final.def`
- `6_final.sdc`
- `6_final.spef`
- `6_final.v`
- `6_final.gds`

The final physical implementation reported:

- Design area: approximately 121 µm²
- Core utilization: approximately 23%
- 3 clock buffers
- 10 timing-repair buffers
- 8 sequential cells
- 31 multi-input combinational cells
- 136 filler cells
- 32 tap cells

The final GDSII output was confirmed as a valid GDSII Stream file.

---

### Timer

The Timer successfully completed the complete physical implementation flow.

Final implementation artifacts included:

- `6_final.odb`
- `6_final.def`
- `6_final.sdc`
- `6_final.spef`
- `6_final.v`
- `6_final.gds`

The final physical implementation reported:

- Design area: approximately 140 µm²
- Core utilization: approximately 21%
- 4 clock buffers
- 11 timing-repair buffers
- 9 sequential cells
- 41 multi-input combinational cells
- 164 filler cells
- 36 tap cells

The final GDSII output was confirmed as a valid GDSII Stream file.

---

## Power Integrity Checks

The final OpenROAD reports included power-integrity analysis for the VDD and VSS networks.

For the implemented designs:

- VDD connectivity was confirmed.
- VSS connectivity was confirmed.
- IR-drop analysis was performed.
- Worst-case voltage and IR-drop values were reported.
- The reported voltage drops were very small relative to the supply voltage.

These checks provide an additional validation step beyond simply generating a routed layout.

---

## Final ASIC Artifacts

The most important outputs generated by the project are:

| Artifact | Purpose |
|----------|---------|
| `.odb` | OpenROAD physical-design database |
| `.def` | Physical design exchange format |
| `.sdc` | Timing constraints |
| `.spef` | Extracted parasitic information |
| `.v` | Final gate-level Verilog |
| `.gds` | Final physical layout |

The GDSII output is the most important physical-design deliverable because it represents the final layout database that can be used by downstream semiconductor manufacturing flows.

---

## Key Learning Outcomes

This project provided practical experience with:

- Reusable RTL IP development
- FIFO architecture
- Counter-based PWM generation
- Programmable timer design
- RTL synthesis
- Standard-cell technology mapping
- ASIC floorplanning
- PDN generation
- Standard-cell placement
- Clock Tree Synthesis
- Global and detailed routing
- Filler-cell insertion
- Parasitic extraction
- IR-drop analysis
- DEF/ODB/SPEF generation
- GDSII stream generation
- Docker-based EDA workflows

---

## Important Engineering Lessons

### RTL correctness comes first

Physical implementation cannot compensate for incorrect RTL.

The design must first behave correctly in simulation before entering the ASIC flow.

### Tool checkpoints matter

OpenROAD produces intermediate databases at each major stage.

Examples include:

- `3_place.odb`
- `4_1_cts.odb`
- `5_1_grt.odb`
- `5_2_route.odb`
- `5_3_fillcell.odb`
- `6_final.odb`

These checkpoints make it possible to debug the physical-design flow without restarting the entire process.

### CTS modifies the physical design

Clock Tree Synthesis introduces additional clock buffers and clock-routing structures.

Therefore, the post-CTS design is not identical to the placed design.

### Routing is dependent on previous stages

Global routing, detailed routing, filler insertion, and final extraction depend on valid databases generated by the previous stages.

Maintaining correct checkpoint paths is therefore critical when running individual OpenROAD stages.

### Final GDS generation is not the end of verification

A valid GDSII file confirms that the layout was successfully streamed out, but physical-design validation also requires checking:

- Placement legality
- Routing
- Timing
- Parasitics
- Power integrity
- Design-rule compliance
- Connectivity

---

## Project Significance

Project 04 is a major milestone in the ASIC portfolio.

Earlier projects concentrated primarily on RTL design and synthesis.

This project extends that workflow into physical implementation:

    RTL
      ↓
    Synthesis
      ↓
    Floorplan
      ↓
    Placement
      ↓
    CTS
      ↓
    Routing
      ↓
    Parasitic Extraction
      ↓
    GDSII

This establishes practical familiarity with the digital ASIC implementation flow and creates a foundation for larger designs in future projects.

---

## Portfolio Position

Project 04 represents the transition from:

    RTL Design

to:

    RTL + ASIC Physical Design

The workflow developed here will be reused for increasingly complex designs involving larger RTL blocks, more advanced timing constraints, reusable IP integration, and eventually complete SoC-oriented designs.

---

## Conclusion

Project 04 demonstrates the implementation of practical utility IP blocks from Verilog RTL through synthesis and physical ASIC implementation.

The FIFO, PWM Generator, and Timer designs were successfully processed through the OpenROAD flow and produced final physical-design artifacts including ODB, DEF, SPEF, gate-level Verilog, and GDSII.

The project therefore provides hands-on experience with both sides of the digital ASIC workflow:

**RTL design → synthesis → physical implementation → final GDSII**

This forms the foundation for moving toward more advanced ASIC, SoC, and open-source silicon projects.