`timescale 1ns/1ps
module InstructionMemory (
    input [31:0] address,
    output [31:0] instruction
);
    reg [31:0] memory [0:255];

    initial begin
        $readmemb("instructions.mem", memory);
    end

    assign instruction = memory[address >> 2];
	
	// Dump instruction memory contents at the end of the simulation
    integer j;
    initial begin
        #1000; // Wait for the simulation to finish
        $display("Final Instruction Memory Contents:");
        for (j = 0; j < 256; j = j + 1) begin
            $display("Memory[%0d] = %h", j, memory[j]);
        end
    end
	
endmodule