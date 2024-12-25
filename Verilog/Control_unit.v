`timescale 1ns/1ps
module ControlUnit (
    input [5:0] opcode,
    output reg regDst,
    output reg aluSrc,
    output reg memToReg,
    output reg regWrite,
    output reg memRead,
    output reg memWrite,
    output reg branch,
    output reg jump,
    output reg link,
    output reg [1:0] aluOp
);
    always @(*) begin
        case (opcode)
            6'b000000: begin // R-Type
                regDst = 1;
                aluSrc = 0;
                memToReg = 0;
                regWrite = 1;
                memRead = 0;
                memWrite = 0;
                branch = 0;
                jump = 0;
                link = 0;
                aluOp = 2'b10;
            end
            6'b100011: begin // LW
                regDst = 0;
                aluSrc = 1;
                memToReg = 1;
                regWrite = 1;
                memRead = 1;
                memWrite = 0;
                branch = 0;
                jump = 0;
                link = 0;
                aluOp = 2'b00;
            end
            6'b101011: begin // SW
                regDst = 0; // Don't care
                aluSrc = 1;
                memToReg = 0; // Don't care
                regWrite = 0;
                memRead = 0;
                memWrite = 1;
                branch = 0;
                jump = 0;
                link = 0;
                aluOp = 2'b00;
            end
            6'b000100: begin // BEQ
                regDst = 0; // Don't care
                aluSrc = 0;
                memToReg = 0; // Don't care
                regWrite = 0;
                memRead = 0;
                memWrite = 0;
                branch = 1;
                jump = 0;
                link = 0;
                aluOp = 2'b01;
            end
            6'b000011: begin // JAL
                regDst = 0; // Don't care
                aluSrc = 0; // Don't care
                memToReg = 0; // Don't care
                regWrite = 1; // Write return address to $ra
                memRead = 0;
                memWrite = 0;
                branch = 0;
                jump = 1; // Perform jump
                link = 1; // Save return address
                aluOp = 2'b00; // Don't care
            end
            6'b001000: begin // JR
                regDst = 0; // Don't care
                aluSrc = 0; // Don't care
                memToReg = 0; // Don't care
                regWrite = 0;
                memRead = 0;
                memWrite = 0;
                branch = 0;
                jump = 1; // Perform jump
                link = 0; // No return address saving
                aluOp = 2'b10; // R-Type (but depends on function code)
            end
            default: begin
                regDst = 0;
                aluSrc = 0;
                memToReg = 0;
                regWrite = 0;
                memRead = 0;
                memWrite = 0;
                branch = 0;
                jump = 0;
                link = 0;
                aluOp = 2'b00;
            end
        endcase
    end
endmodule