`timescale 1ns/1ns

module DataMemory(input clk,
                  input we,
                  input [31:0] a,
                  input [31:0] wd,
                  output [31:0] rd);

    // Data memory (array of 32-bit words)
    reg [31:0] RAM[0:63];

    // Read data
    assign rd = RAM[a[7:2]];  // Read address (aligned to word)

    // Write data
    always @(posedge clk) begin
        if (we)
            RAM[a[7:2]] <= wd;  // Write data to memory
    end

endmodule