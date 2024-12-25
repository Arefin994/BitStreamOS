`timescale 1ns/1ns

module CPU_tb;

    // Inputs
    reg clk;
    reg reset;

    // Outputs
    wire [31:0] PC;
    wire [31:0] Instr;
    wire [31:0] ALUResult;
    wire ZeroFlag;

    // Instantiate the CPU module
    CPU_mod uut (
        .clk(clk),
        .reset(reset),
        .PC(PC),
        .Instr(Instr),
        .ALUResult(ALUResult),
        .ZeroFlag(ZeroFlag)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end

    // Test procedure
    initial begin
        // Dump waveforms
        $dumpfile("CPU_tb.vcd"); // VCD file for waveform
        $dumpvars(0, CPU_tb);

        // Initialize reset
        reset = 1;
        #10;
        reset = 0;

        // Let the CPU run for some cycles
        #1000; // Adjust based on the number of cycles you want to observe

        // Finish simulation
        $finish;
    end

endmodule