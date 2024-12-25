`timescale 1ns/1ns

module CPU_mod(
    input clk,
    input reset,
    output [31:0] PC,
    output [31:0] Instr,
    output [31:0] ALUResult,
    output ZeroFlag
);

    // Internal wires
    wire [31:0] ReadData, datatwo;
    wire MemWrite, MemtoReg, ALUSrc, RegDst, RegWrite, Jump, PCSrc;
    wire [3:0] ALUControl;

    // Instantiate the control unit
    Controlunit control_unit (
        .Opcode(Instr[31:26]),
        .Func(Instr[5:0]),
        .Zero(ZeroFlag),
        .MemtoReg(MemtoReg),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .RegDst(RegDst),
        .RegWrite(RegWrite),
        .Jump(Jump),
        .PCSrc(PCSrc),
        .ALUControl(ALUControl)
    );

    // Instantiate the datapath
    Datapath datapath (
        .clk(clk),
        .reset(reset),
        .RegDst(RegDst),
        .RegWrite(RegWrite),
        .ALUSrc(ALUSrc),
        .Jump(Jump),
        .MemtoReg(MemtoReg),
        .PCSrc(PCSrc),
        .ALUControl(ALUControl),
        .ReadData(ReadData),
        .Instr(Instr),
        .PC(PC),
        .ZeroFlag(ZeroFlag),
        .datatwo(datatwo),
        .ALUResult(ALUResult)
    );

    // Instantiate instruction memory
    InstMemory inst_mem (
        .a(PC[7:2]),    // Address
        .rd(Instr)       // Read Data
    );

    // Instantiate data memory
    DataMemory data_mem (
        .clk(clk),
        .we(MemWrite),
        .a(ALUResult),
        .wd(datatwo),
        .rd(ReadData)
    );

endmodule