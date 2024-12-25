`timescale 1ns/1ns

module MIPS_SCP (
    input clk,
    input reset,
    output [31:0] PC,        // Program Counter output
    output [31:0] Instr      // Instruction output
);

    // Internal signals
    wire [31:0] pc_next;
    wire [31:0] pc_current;
    wire [31:0] instruction;

    // Instantiate PC register
    flopr_param #(32) pc_register (
        .clk(clk),
        .reset(reset),
        .d(pc_next),
        .q(pc_current)
    );

    // Instantiate Instruction ROM
    rom instruction_memory (
        .addr(pc_current),
        .data(instruction)
    );

    // Assign outputs
    assign PC = pc_current;       // Expose Program Counter
    assign Instr = instruction;  // Expose fetched instruction

    // Simple logic to compute next PC (can be replaced with actual control logic)
    assign pc_next = pc_current + 4;

endmodule