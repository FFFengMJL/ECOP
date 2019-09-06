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
    output zero, sign, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, RD, WR, ExtSel, IRWre,WrRegDSrc,
    output [1:0] PCSrc, RegDst,
    output [2:0] ALUOp,con, nextcon,
    output [4:0] rs, rd, rt, sa, regwrite,
    output [5:0] Opcode,
    output [31:0] DB, Pc, nextPC, ins, Regdata1, Regdata2, WRegdata, Result, ExtOut, Jpc, Ramout, dataA, dataB, reg0, reg1, reg2, reg3, reg4, reg5, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg31
    );
    wire [15:0] immediate;
    wire [25:0] jimme;
    wire [31:0] aluA, aluB, Ramadd;
    assign InsMemRW=1;
    PC pc(clk, Reset, PCWre, nextPC, Pc);
    insROM rom(Pc, InsMemRW, ins);
    Dtrigger dtri(clk, Reset, nextcon, con);
    IR ireg(clk, ins, IRWre , Opcode, rs, rt, rd, sa, immediate, jimme);
    DR dreg(clk, Regdata1, Regdata2, Result, Ramout, aluA, aluB, Ramadd, DB , DBDataSrc);
    nextCondition nextCon(con, Opcode, nextcon);
    ControlUnit control(Pc,con, Opcode, zero, sign, PCWre, IRWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, RD, WR, ExtSel, PCSrc, RegDst, ALUOp, WrRegDSrc);
    extend ext(immediate, ExtSel, ExtOut);
    Jext jext(Pc, jimme, Jpc);
    regWriteAddress regadd(RegDst, rt, rd, regwrite);
    regWriteData regdata(WrRegDSrc, Pc, DB, WRegdata);
    regFile regf(clk,Reset,RegWre, rs, rt, regwrite, WRegdata, Regdata1, Regdata2, reg0, reg1, reg2, reg3, reg4, reg5, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg31);
    ALU_dataA aluDataA(ALUSrcA, Regdata1, sa, dataA);
    ALU_dataB aluDataB(ALUSrcB, Regdata2, ExtOut, dataB);
    ALU alu(ALUOp, dataA, dataB, zero, sign, Result);
    dataRAM ram(Ramadd, aluB, RD, WR, Ramout);
    nextPC nextpc(Pc, PCSrc, ExtOut, Regdata1, Jpc, nextPC);
endmodule
