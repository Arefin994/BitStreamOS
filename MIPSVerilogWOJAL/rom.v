`timescale 1ns/1ns

module rom (
    input [31:0] addr,
    output reg [31:0] data
);

    reg [31:0] memory [0:255]; // 256 x 32-bit ROM

    initial begin
        // Example instructions (replace with actual values)
        memory[0] = 32'h00000001; // Instruction 1
        memory[1] = 32'h00000002; // Instruction 2
        memory[2] = 32'h00000003; // Instruction 3
        memory[3] = 32'h00000004; // Instruction 4
    end

    always @(*) begin
        data = memory[addr[7:2]]; // Use upper bits for addressing
    end
endmodule