`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/23 11:01:28
// Design Name: 
// Module Name: imp_top
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


module imp_top(
    input clk,
    input step,
    input Reset,
    input [1:0] Sel,
    output [6:0] atog,
    output [3:0] enlight);
    wire clk190hz,key_out,zero, sign, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, RD, WR, ExtSel, RegDst;
    wire [1:0] PCSrc;
    wire [2:0] ALUOp;
    wire [4:0] rs, rd, rt, sa, regwrite;
    wire [5:0] Opcode;
    wire [15:0] data;
    wire [31:0] Pc, nextPC, Regdata1, Regdata2, WRegdata, Result, ExtOut, Jpc, Ramout, dataA, dataB;
    CLK_div div(clk, clk190hz);
    debouncing key(clk190hz, step, key_out);
    show out(Sel, Pc, nextPC, rs, Regdata1, rt, Regdata2, Result, WRegdata, data);
    Hex7seg hex(data, clk190hz, atog, enlight);
    CPU_top cputop(key_out, Reset, zero, sign, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, RD, WR, ExtSel, RegDst, PCSrc, ALUOp, rs, rd, rt, sa, regwrite, Opcode, Pc, nextPC, Regdata1, Regdata2, WRegdata, Result, ExtOut, Jpc, Ramout, dataA, dataB);
endmodule
