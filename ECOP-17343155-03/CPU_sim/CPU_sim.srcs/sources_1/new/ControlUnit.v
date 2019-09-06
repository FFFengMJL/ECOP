`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/22 11:29:03
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(pc,condition, opCode, zero, sign, PCWre, IRWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, RD, WR, ExtSel, PCSrc, RegDst, ALUOp, WrRegDSrc);  
     input [31:0] pc;
     input [5:0] opCode; 
     input [2:0] condition; 
     input zero, sign;  
     output reg PCWre, IRWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, RD, WR, ExtSel, WrRegDSrc;
     output reg [1:0] PCSrc, RegDst;  
     output reg [2:0] ALUOp;  
     
     always@(condition or opCode or  zero or  sign or pc) begin
        IRWre = (condition == 3'b000) ? 1 : 0; 
//        PCWre = (condition == 3'b000) ? (opCode != 6'b111111 ? 1 :0 ) : 0;
        PCWre = (condition==3'b111 || condition==3'b101 ||condition==3'b100 ||(condition==3'b011&&opCode==6'b110000)||(condition==3'b001&&(opCode == 6'b111000 || opCode == 6'b111001 || opCode == 6'b111010)))?1:0;
        RD = opCode == 6'b110001 ? 1 : 0;
        WR = (condition == 3'b011) ? (opCode == 6'b110000 ? 1 : 0) : 0;
        RegWre = (condition == 3'b111||condition == 3'b100||(condition==001 && opCode == 6'b111010)) ? 1 : 0;
        ALUSrcA = (opCode == 6'b011000) ? 1 : 0;
        ALUSrcB = (opCode == 6'b000010 || opCode == 6'b010001 || opCode == 6'b010010 || opCode == 6'b010011 || opCode == 6'b100110 || opCode == 6'b110000 || opCode == 6'b110001) ? 1 : 0;  
        DBDataSrc = (opCode == 6'b110001) ? 1 : 0; 
        WrRegDSrc = (opCode == 6'b111010 && condition==001 ) ? 0 : 1;     
        ExtSel = (opCode == 6'b010000 || opCode == 6'b010001 || opCode == 6'b010010 || opCode == 6'b010011 || opCode == 6'b011000) ? 0 : 1;  
        PCSrc[1] = (opCode == 6'b111000 || opCode == 6'b111001 || opCode == 6'b111010) ? 1 : 0;
        PCSrc[0] = ((opCode == 6'b110100 && zero == 1) || (opCode == 6'b110101 && zero == 0) || (opCode == 6'b110110 && sign==1) || opCode == 6'b111000 || opCode == 6'b111010) ? 1 : 0;  
        RegDst[1] = (opCode == 6'b000010 || opCode == 6'b010001 || opCode == 6'b010010 || opCode == 6'b010011 ||opCode == 6'b100110 || opCode ==6'b110001|| opCode ==6'b111010) ? 0 : 1;  
        RegDst[0] = (opCode == 6'b000010 || opCode == 6'b010001 || opCode == 6'b010010 || opCode == 6'b010011 ||opCode == 6'b100110 || opCode ==6'b110001) ? 1 : 0;
        ALUOp[2] = (opCode == 6'b010000 || opCode == 6'b010001 || opCode == 6'b010011 || opCode == 6'b100111 || opCode == 6'b100110) ? 1 : 0;  
        ALUOp[1] = (opCode == 6'b010010 || opCode == 6'b010011 || opCode == 6'b011000|| opCode == 6'b100110|| opCode == 6'b100111) ? 1 : 0;  
        ALUOp[0] = (opCode == 6'b000000 || opCode == 6'b000010 || opCode == 6'b010000 || opCode == 6'b010001 || opCode == 6'b011000 || opCode == 6'b100110|| opCode == 6'b110000 || opCode == 6'b110001|| opCode == 6'b100111) ? 0 : 1;   
     end  
endmodule