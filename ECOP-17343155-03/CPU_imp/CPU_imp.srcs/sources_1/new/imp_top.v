`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/22 15:56:04
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


module imptop(
    input clk,
    input step,   
    input Reset,
    input [1:0] Sel,
    output [6:0] atog,
    output [3:0] enlight
    );
    wire clk190hz,key_out,zero, sign, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, RD, WR, ExtSel, IRWre, WrRegDSrc;
    wire [1:0] PCSrc, RegDst;
    wire [2:0] ALUOp, con, nextcon;
    wire [4:0] rs, rd, rt, sa, regwrite;
    wire [5:0] Opcode;
    wire [15:0] data;
    wire [31:0] DB, Pc, nextPC, ins, Regdata1, Regdata2, WRegdata, Result, ExtOut, Jpc, Ramout, dataA, dataB, reg0, reg1, reg2, reg3, reg4, reg5, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg31;
    
    CLK_DIV div(clk, clk190hz);
    debouncing key(clk190hz, step, key_out);
    show out(Sel, Pc, nextPC, rs, Regdata1, rt, Regdata2, Result, WRegdata, data);
    Hex7seg hex(data, clk190hz, atog, enlight);
    CPU_top cputop(key_out, Reset, zero, sign, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, RD, WR, ExtSel, IRWre, WrRegDSrc,PCSrc, RegDst, ALUOp,con, nextcon, rs, rd, rt, sa, regwrite, Opcode, DB,Pc, nextPC, ins, Regdata1, Regdata2, WRegdata, Result, ExtOut, Jpc, Ramout, dataA, dataB, reg0, reg1, reg2, reg3, reg4, reg5, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg31);
endmodule
