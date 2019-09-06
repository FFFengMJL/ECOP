`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/22 20:51:41
// Design Name: 
// Module Name: CPU_sim
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


module CPU_sim();
    reg clk, Reset;
    wire zero, sign, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, RD, WR, ExtSel, IRWre,WrRegDSrc;
    wire [1:0] PCSrc, RegDst;
    wire [2:0] ALUOp,con, nextcon;
    wire [4:0] rs, rd, rt, sa, regwrite;
    wire [5:0] Opcode;
    wire [31:0] DB, Pc, nextPC, ins, Regdata1, Regdata2, WRegdata, Result, ExtOut, Jpc, Ramout, dataA, dataB, reg0, reg1, reg2, reg3, reg4, reg5, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg31;
    initial begin
        Reset = 0;
        clk = 0;
        #150;
        Reset = 1;
    end
    always #100 clk = ~clk;
    CPU_top sim(clk, Reset, zero, sign, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, RD, WR, ExtSel, IRWre, WrRegDSrc,PCSrc, RegDst, ALUOp,con, nextcon, rs, rd, rt, sa, regwrite, Opcode, DB,Pc, nextPC, ins, Regdata1, Regdata2, WRegdata, Result, ExtOut, Jpc, Ramout, dataA, dataB, reg0, reg1, reg2, reg3, reg4, reg5, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg31);
endmodule
