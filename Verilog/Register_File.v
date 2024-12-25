`timescale 1ns/1ps
module RegisterFile (
    input clk,
    input regWrite,
    input [4:0] readReg1,
    input [4:0] readReg2,
    input [4:0] writeReg,
    input [31:0] writeData,
    output [31:0] readData1,
    output [31:0] readData2
);
    reg [31:0] registers [31:0];

    assign readData1 = registers[readReg1];
    assign readData2 = registers[readReg2];

    always @(posedge clk) begin
        if (regWrite)
            registers[writeReg] <= writeData;
    end
	
	/*
	// Monitor and dump register contents to a file after simulation
    initial begin
        $dumpfile("register_dump.vcd");
        $dumpvars(0, RegisterFile);
    end
	*/
	
	// Dump register contents at the end of the simulation
    integer i;
    initial begin
        #1000; // Wait for the simulation to finish
        $display("Final Register File Contents:");
        for (i = 0; i < 32; i = i + 1) begin
            $display("Register[%0d] = %h", i, registers[i]);
        end
    end
	
endmodule