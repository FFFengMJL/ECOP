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
    wire zero, sign, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, RD, WR, ExtSel, RegDst;
    wire [1:0] PCSrc;
    wire [2:0] ALUOp;
    wire [4:0] rs, rd, rt, sa, regwrite;
    wire [5:0] Opcode;
    wire [31:0] Pc, nextPC, Regdata1, Regdata2, WRegdata, Result, ExtOut, Jpc, Ramout, dataA, dataB; 
    initial begin
        Reset = 0;
        clk = 0;
        #150;
        Reset = 1;
    end
    always #100 clk = ~clk;
    CPU_top sim(clk, Reset, zero, sign, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, RD, WR, ExtSel, RegDst, PCSrc, ALUOp, rs, rd, rt, sa, regwrite, Opcode, Pc, nextPC, Regdata1, Regdata2, WRegdata, Result, ExtOut, Jpc, Ramout, dataA, dataB);
endmodule
