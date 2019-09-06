`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/22 20:37:02
// Design Name: 
// Module Name: CPU_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CPU_top(
    input clk, Reset,
    output zero, sign, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, RD, WR, ExtSel, RegDst,
    output [1:0] PCSrc,
    output [2:0] ALUOp,
    output [4:0] rs, rd, rt, sa, regwrite,
    output [5:0] Opcode,
    output [31:0] Pc, nextPC, Regdata1, Regdata2, WRegdata, Result, ExtOut, Jpc, Ramout, dataA, dataB );
    wire [15:0] immediate;
    wire [25:0] jimme;
    wire InsMemRW;
    assign InsMemRW=1;
    PC pc(clk, Reset, PCWre, nextPC, Pc);
    insROM ins(Pc, InsMemRW, Opcode, rs, rt, rd, sa, immediate, jimme);
    ControlUnit control(Opcode, zero, sign, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, RD, WR, ExtSel, RegDst, PCSrc, ALUOp);
    extend ext(immediate, ExtSel, ExtOut);
    Jext jext(Pc, jimme, Jpc);
    regWriteAddress regadd(RegDst, rt, rd, regwrite);
    regWriteData regdata(DBDataSrc, Result, Ramout, WRegdata);
    regFile regf(clk,Reset,RegWre, rs, rt, regwrite, WRegdata, Regdata1, Regdata2);
    ALU_dataA aluA(ALUSrcA, Regdata1, sa, dataA);
    ALU_dataB aluB(ALUSrcB, Regdata2, ExtOut, dataB);
    ALU alu(ALUOp, dataA, dataB, zero, sign, Result);
    dataRAM ram(clk, Result, Regdata2, RD, WR, Ramout);
    nextPC nextpc(Pc, PCSrc, ExtOut, Jpc, nextPC);
endmodule
