# Verilog-Vending-Machine
The Verilog-based vending machine accepts Rs. 5 and Rs. 10 inputs, tracking the total amount and transitioning through states from Rs. 0 to Rs. 25. It dispenses an item at Rs. 25 and provides change if needed. The testbench simulates clock signals and input sequences, validating functionality and ensuring correct state transitions and operations.

## Description
This project implements a finite state machine (FSM) based ideal vending machine using Verilog HDL. We assume that the machine accepts Rs. 5 and Rs. 10 coins only, and there is only one product which costs Rs. 25 availabe to dispense in the machine. It keeps track of the total amount, and dispenses an item when Rs. 25 is reached. Change is provided based on the excess amount inserted. The system transitions through various states representing different total amounts, making it a classic example of an FSM where each state corresponds to a specific accumulated amount.

Key Features:
- **Finite State Machine Design:** The vending machine operates as an FSM with well-defined states and transitions based on the inserted coin values.
- **State Transitions:** The machine transitions through states (s0 to s4) as coins are inserted, reaching the dispensing state (s5) at Rs. 25.
- **Change Calculation:** Provides appropriate change when the total amount exceeds Rs. 25.
- **Reset Functionality:** Includes a reset input to reinitialize the machine to its initial state.
- **Testbench:** Comprehensive testbench to validate functionality with various input sequences and clock signals.

## State Diagram
The state diagram represents the transitions between different states based on the total amount inserted:
- `s0`: Rs. 0
- `s1`: Rs. 5
- `s2`: Rs. 10
- `s3`: Rs. 15
- `s4`: Rs. 20


![WhatsApp Image 2024-08-02 at 04 36 58](https://github.com/user-attachments/assets/b35ed543-dcbc-446d-8d43-925f31235397)

We don't need an additional state for Rs. 25 because once the sum reaches 25, the transaction is complete. Each state transition is triggered by the insertion of Rs. 0, Rs. 5, or Rs. 10, and the machine outputs the corresponding dispense signal and change when Rs. 25 is reached.


Note: The inputs mentioned in the state diagram are in decimal.
## File Structure
- `vendingMachine.v`: Contains the main Verilog code for the vending machine.
- `vendingMachine_tb.v`: Testbench for simulating the vending machine operations.
## Modules
### vendingMachine
The main module that tracks the amount inserted and changes states accordingly. It handles inputs (Rs. 5 and Rs. 10), outputs the dispense signal, and calculates change. The FSM is implemented using a combination of sequential and combinational logic, with state registers and next-state logic.

### vendingMachine_tb
The testbench module simulates the clock signal, resets the machine, and provides a sequence of inputs to test various scenarios, ensuring the vending machine operates correctly. It generates a waveform file (`waveform.vcd`) for detailed analysis of the machine's behavior.
## Usage
To get a local copy of the project, you can clone the repository using the below mentioned command:

      git clone https://github.com/riaagarwal21/Verilog-Vending-Machine
