`timescale 1ns/1ps
module ALU (
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUOp,
    output reg [31:0] Result,
    output Zero
);
    always @(*) begin
        case (ALUOp)
            4'b0000: Result = A + B; // ADD
            4'b0001: Result = A - B; // SUB
            4'b0010: Result = A & B; // AND
            4'b0011: Result = A | B; // OR
            4'b0100: Result = A ^ B; // XOR
            4'b0101: Result = A;     // JR
            4'b0110: Result = A + 4; // JAL
            default: Result = 0;
        endcase
    end

    assign Zero = (Result == 0) ? 1'b1 : 1'b0;
endmodule
