
# 1101 Non-Overlapping Sequence Detector (Mealy FSM)

A Verilog implementation of a Finite State Machine (FSM) designed to detect the serial bit sequence **1101**. This project demonstrates the design of a **Mealy Machine**, where the output reacts instantly to input changes, providing a faster response than a standard Moore Machine.

## 📌 Project Overview
The goal of this project was to design, code, and verify a sequence detector that identifies the pattern `1101` in a stream of serial data. The design is **non-overlapping**, meaning the machine resets to the initial state after a successful detection.

### Key Technical Highlights:
* **Architecture:** Mealy Machine (Combinational Output).
* **Detection Pattern:** 1101.
* **Overlap:** Non-overlapping.
* **Output Timing:** Zero-latency; the output `y` triggers immediately upon receiving the final '1' in the sequence.
* **Reset:** Synchronous/Asynchronous active-low reset.

---

## 🏗️ State Machine Logic
The FSM consists of four primary states:
1. **State A (00):** Idle / Looking for the first '1'.
2. **State B (01):** Found '1'.
3. **State C (10):** Found '11'.
4. **State D (11):** Found '110'.



In this implementation, when the FSM is in **State D** and receives a **'1'**, the transition to **State A** occurs and the output `y` goes HIGH immediately.

---

## 💻 Code Structure
The design uses a two-block coding style to ensure clean synthesis and clear separation of logic:
* **Sequential Block:** Handles state transitions on the rising edge of the clock (`posedge clk`).
* **Combinational Block:** Handles the Mealy output logic (`always @*`) to ensure immediate response to input `x`.

### Files in this Repository:
* `FSM_1101_detector.v`: The RTL design file.
* `FSM_1101_detector_tb.v`: Testbench file providing the stimulus for simulation.

---

## 📉 Simulation and Verification
The design was verified using Vivado. The waveforms confirm:
* Proper state transitions: $0 \to 1 \to 2 \to 3$.
* The output `y` correctly pulses HIGH for one clock cycle upon detection.
* Mealy behavior: `y` is high while the state is still `3` (D), as soon as `x` becomes `1`.



---

## 🛠️ Tools Used
* **HDL:** Verilog
* **Simulator:** Vivado Logic Simulator (Xilinx)
* **Design Methodology:** RTL, Finite State Machines (FSM)

---

## 🚀 How to Use
1. Clone this repository.
2. Add `FSM_1101_detector.v` and `FSM_1101_detector_tb.v` to your simulation project.
3. Run the simulation and observe the timing of signal `y` relative to input `x` and state `state_out`.
