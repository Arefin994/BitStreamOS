# 🌟 BitStreamOS 🌟

## 📜 Overview
BitStreamOS is a custom-designed project combining the implementation of a MIPS CPU and an operating system. Developed as part of the CSE332 course, this project includes:
- A custom instruction set.
- An assembler that converts assembly code into binary machine code.
- A CPU simulation using Verilog.
- Test benches for verification.
- Waveform visualization for debugging and analysis.

## 🚀 Features
- **Custom MIPS Instruction Set**: Designed to execute assembly instructions efficiently.
- **Assembler**: Converts `.asm` files into binary `.mem` files for execution.
- **CPU Implementation**: Built using Verilog for accurate hardware simulation.
- **Test Benches**: Simulated and verified with comprehensive test cases.
- **Waveform Analysis**: Debugging through detailed waveform visualization.
- **Operating System**: A basic OS to demonstrate functionality on the custom CPU.

## 🛠️ Technologies Used
- **Programming Language**: Verilog
- **Tools**: ModelSim, Quartus, and other hardware simulation tools.
- **Assembler**: Written in Python for converting assembly to binary.

## 🗂️ Folder Structure
```
|-- MIPSAssembler
   |-- [Assembler code and related files]
|-- MIPSVerilogWOJAL
   |-- [Verilog files for the CPU design]
|-- Verilog
   |-- [Instruction Memory, ALU, Control Unit, etc.]
|-- work
   |-- [Simulation and waveform files]
```

## 📝 How to Use
### Prerequisites
- Install ModelSim or any Verilog simulation tool.
- Mingw & C++ installed for running the assembler.

### Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/Arefin994/BitStreamOS
   ```
2. Navigate to the project directory:
   ```bash
   cd BitStreamOS
   ```

### Running the Assembler
1. Place your `.asm` file in the `MIPSAssembler` folder.
2. Run the assembler to generate the binary:
   ```bash
   python assembler.py input.asm output.mem
   ```

### Simulating the CPU
1. Open the Verilog files in ModelSim or a similar tool.
2. Compile all Verilog modules:
   ```
   vlog *.v
   ```
3. Simulate the CPU:
   ```
   vsim -do simulate.do
   ```
4. View the waveform:
   ```
   view wave
   ```
5. Analyze the results for debugging.

### Testing
Run the test benches included in the `MIPSVerilogWOJAL` folder to verify functionality.

## 📊 Results
- **Assembler**: Converts assembly instructions into binary correctly.
- **CPU Simulation**: Executes instructions accurately as per the design.
- **Waveform Analysis**: Verified through simulation.
- **Operating System**: Demonstrated simple task execution on the custom CPU.


## 📌 Future Enhancements ( DIY - I Quit )
- Add more complex instruction sets.
- Expand OS capabilities.
- Optimize CPU performance.


## 🌐 Connect
For queries or collaboration, reach out at:
- **Email**: [arefinamin994@gmail.com]
- **LinkedIn**: [https://www.linkedin.com/in/arefinamin994/]

---
Thank you for exploring BitStreamOS! 🚀
