# Design of Area-Efficient 16x16 Vedic Multiplier using Parallel Prefix Adder

A high-performance, area-efficient **16x16-bit hardware multiplier** architecture implemented in synthesizable Verilog HDL. This design incorporates the ancient Indian mathematical principles of the **Urdhva Tiryagbhyam sutra** alongside a high-speed **Ladner-Fischer Parallel Prefix Adder (PPA)** to dramatically compress critical path propagation delay, dynamic power consumption, and silicon area footprint.


## 📊 Synthesis & Performance Verification Metrics

The complete architecture was modeled using Verilog HDL and verified utilizing **Xilinx 14.7** and **Cadence Design Tools**. Gate-level netlist mapping confirms significant efficiency gains over conventional architectures:

### 1. Chip Area & Power Breakdown (Cadence Genus)
Compared to a standard 16-bit Vedic multiplication block, this optimized parallel-prefix approach delivers massive hardware reduction:

| Parameter | Baseline Vedic Multiplier | This Architecture (Vedic + LF-PPA) | Total Reduction |
| :--- | :---: | :---: | :---: |
| **Silicon Net Area** | $4,646.037\ \mu\text{m}^2$ | **$1,108.974\ \mu\text{m}^2$** | **76.13% Area Savings** |
| **Total Power Consumption** | $0.300\text{ mW}$ | **$0.096\text{ mW}$ ($96.13\ \mu\text{W}$)** | **67.95% Power Savings** |
| **Total Gate Cell Count** | *Baseline Core* | **803 Cells** | **Highly Optimized Netlist** |

*   **Synthesis Power Profile Distribution (Cadence)**:
    *   *Leakage Power:* $10.38\ \mu\text{W}$ ($10.80\%$)
    *   *Internal Circuit Power:* $42.56\ \mu\text{W}$ ($44.27\%$)
    *   *Dynamic Switching Power:* $43.19\ \mu\text{W}$ ($44.93\%$)

### 2. FPGA Resource Allocation (Xilinx Spartan-6)
Physical implementation summary for the internal 16-bit Ladner-Fischer adder tree:
*   **Path Delay:** $13.822\text{ ns}$
*   **Number of Slices:** 23
*   **Number of 4-input LUTs:** 43
*   **Number of Bonded IOBs:** 50 ($35\%$ package utilization)

---

## ⚡ Architectural Blueprint & Design Mechanics

### 1. Urdhva Tiryagbhyam Multiplication Core
The math processing logic performs vertical and crosswise multiplication, enabling simultaneous partial-product generation. 
*   The 16x16-bit block splits into an optimized structure composed of four parallel 8x8-bit sub-modules.
*   Each block evaluates internal bits concurrently, shifting structural carry generation away from sequential limits to lower calculation complexity.



# Design of Area-Efficient 16x16 Vedic Multiplier using Parallel Prefix Adder
A high-performance, area-efficient **16x16-bit hardware multiplier** architecture implemented in synthesizable Verilog HDL. This design incorporates the ancient Indian mathematical principles of the **Urdhva Tiryagbhyam sutra** alongside a high-speed **Ladner-Fischer Parallel Prefix Adder (PPA)** to dramatically compress critical path propagation delay, dynamic power consumption, and silicon area footprint.

 📊 Synthesis & Performance Verification Metrics
 
The complete architecture was modeled using Verilog HDL and verified utilizing **Xilinx 14.7** and **Cadence Design Tools**. Gate-level netlist mapping confirms significant efficiency gains over conventional architectures:
### 1. Chip Area & Power Breakdown (Cadence Genus)Compared to a standard 16-bit Vedic multiplication block, this optimized parallel-prefix approach delivers massive hardware reduction:

| Parameter | Baseline Vedic Multiplier | This Architecture (Vedic + LF-PPA) | Total Reduction |
| :--- | :---: | :---: | :---: |
| **Silicon Net Area** | $4,646.037\ \mu\text{m}^2$ | **$1,108.974\ \mu\text{m}^2$** | **76.13% Area Savings** |
| **Total Power Consumption** | $0.300\text{ mW}$ | **$0.096\text{ mW}$ ($96.13\ \mu\text{W}$)** | **67.95% Power Savings** |
| **Total Gate Cell Count** | *Baseline Core* | **803 Cells** | **Highly Optimized Netlist** |
*   **Synthesis Power Profile Distribution (Cadence)**:
    *   *Leakage Power:* $10.38\ \mu\text{W}$ ($10.80\%$)
    *   *Internal Circuit Power:* $42.56\ \mu\text{W}$ ($44.27\%$)
    *   *Dynamic Switching Power:* $43.19\ \mu\text{W}$ ($44.93\%$)
### 2. FPGA Resource Allocation (Xilinx Spartan-6)Physical implementation summary for the internal 16-bit Ladner-Fischer adder tree:*   **Path Delay:** $13.822\text{ ns}$*   **Number of Slices:** 23*   **Number of 4-input LUTs:** 43*   **Number of Bonded IOBs:** 50 ($35\%$ package utilization)
---## ⚡ Architectural Blueprint & Design Mechanics### 1. Urdhva Tiryagbhyam Multiplication CoreThe math processing logic performs vertical and crosswise multiplication, enabling simultaneous partial-product generation. *   The 16x16-bit block splits into an optimized structure composed of four parallel 8x8-bit sub-modules.*   Each block evaluates internal bits concurrently, shifting structural carry generation away from sequential limits to lower calculation complexity.


Step 1: Vertical Step 2: Crosswise Step 3: Vertical
a1 a0 a1 a0 a1 a0
| | \ / | |
b1 b0 b1 b0 b1 b0


### 2. Ladner-Fischer Tree Network
To prevent standard Ripple Carry bottlenecking, a three-stage tree-structured parallel prefix adder updates intermediate values concurrently:

*   **Pre-Processing Stage:** Instantly samples input lines to evaluate isolated group conditions:
     𝑃𝑠[𝑖] = 𝐴[𝑖] + 𝐵[𝑖]                     (1)  
     𝐺𝑠[𝑖] = 𝐴[𝑖] · 𝐵[𝑖]                     (2) 
*   **Carry Generation Stage:** Resolves concurrent carry pathways through multi-level lookahead tree execution:
    𝐺𝑠[𝑖: 𝑗] = 𝐺𝑠[𝑖: 𝑘] + (𝑃𝑠[𝑖: 𝑗] . 𝐺𝑠[𝑖: 𝑗])  (3)
    𝑃𝑠[𝑖: 𝑗] = 𝑃𝑠[𝑖: 𝑗] . 𝑃𝑠[𝑖: 𝑘]              (4)  
*   **Post-Processing Stage:** Combines computed parallel prefix bits via localized gates to extract finalized product metrics:
    𝑆𝑢𝑚 = 𝐴 𝑋𝑂𝑅 𝐵 𝑋𝑂𝑅 𝐶[𝑖 − 1]              (5)  
    𝐶 [𝑖 − 1] = 𝐺𝑠 [𝑖1]                       (6)  


---

## 📂 Repository Deliverables

The code, schematics, and simulation configurations inside this repository match standard corporate tape-out files:

```text
├── rtl/               # Clean, synthesizable Verilog source modules
│   ├── vedic_16x16ppa.v       # Top-level multiplier entity
│   ├── parallel_prefix_add16.v # 16-bit Ladner-Fischer adder core
│   └── multipliers_8x8_4x4.v  # Hierarchical multiplier building blocks
├── syn/               # Production synthesis data generated via Cadence Genus
│   ├── area_report.txt        # Cell area and netlist mapping data
│   ├── power_report.txt       # Dynamic switching, dynamic internal, and static leakage breakdowns
│   └── gate_count_report.txt  # Gate instance enumeration (803 total cells)
└── docs/              # Visual design validations and references
    ├── rtl_schematic.png      # Xilinx synthesis technology schematics
    ├── simulation_waves.png   # Functional verification testbench wave logs
    └── synthesis_schematic.png# Cadence 3D cell placement layouts
```

---

## 📜 Citation & Publication Details
This architectural design is published and detailed in the following paper:
*   **Trisha Maddanna**, et al., *"Design of Area Efficient Vedic Multiplier using Parallel Prefix Adder,"* **Tuijin Jishu / Journal of Propulsion Technology**, Vol. 45, No. 4, 2024.




