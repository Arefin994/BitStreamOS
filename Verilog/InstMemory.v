`timescale 1ns/1ns

module InstMemory(input [5:0] a, output [31:0] rd);

    // Instruction memory (array of 32-bit words)
    reg [31:0] RAM[0:63];

    initial begin
        $readmemh("instructions.mem", RAM);  // Load instructions from memory file
    end

    assign rd = RAM[a];  // Output instruction at address 'a'

endmodule