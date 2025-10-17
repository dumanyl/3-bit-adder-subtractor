# 3-Bit Adder/Subtractor – Verilog Arithmetic Circuit

A Verilog-based 3-bit binary adder/subtractor circuit developed for **ELEC 2607 Lab 2**.  
Performs binary addition and subtraction based on a mode control signal, featuring overflow detection.

---

## Overview
The circuit uses three cascaded full adders to perform addition and subtraction operations on 3-bit inputs `X` and `Y`.  
Subtraction is implemented using two’s complement logic — the `Y` input is inverted through XOR gates when the mode signal `M` is high.  
The result includes a carry-out and overflow indicator.

---

## Inputs / Outputs
**Inputs**
- `X[2:0]` – 3-bit input operand  
- `Y[2:0]` – 3-bit input operand  
- `M` – Mode control (0 for addition, 1 for subtraction)

**Outputs**
- `S[2:0]` – Sum or difference  
- `C[3]` – Carry-out  
- `Overflow` – Overflow indicator  

---

## Files
| File | Description |
|------|--------------|
| `src/three_bit_adder_subtractor.v` | Verilog module implementing 3-bit adder/subtractor |
| `src/testbench_three_bit_adder_subtractor.v` | Testbench for simulation |
| `docs/ELEC2607_Lab2_Report.pdf` | Original lab report |

---

## Simulation Procedure
1. Open ModelSim or Vivado.  
2. Add both Verilog files from `/src`.  
3. Run the testbench to verify both addition and subtraction.  
4. Observe overflow and carry-out behavior in waveform view.

---

## Author
**Dumany Lombe**  
Carleton University – Electrical Engineering
