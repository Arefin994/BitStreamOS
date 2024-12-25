`timescale 1ns/1ns

module MIPS_SCP_tb();

    // Inputs to MUT (MIPS_SCP)
    reg clk;
    reg reset;

    // Outputs from MUT
    wire [31:0] PC;
    wire [31:0] Instr;

    // Instantiate the MIPS_SCP module
    MIPS_SCP mips_inst (
        .clk(clk),
        .reset(reset),
        .PC(PC),
        .Instr(Instr)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Generate a clock with 10ns period
    end

    // Test stimulus
    initial begin
        reset = 1; // Apply reset
        #10;       // Hold reset for 10ns
        reset = 0; // De-assert reset

        // Simulation end after 200ns
        #200;
        $stop;
    end

endmodule