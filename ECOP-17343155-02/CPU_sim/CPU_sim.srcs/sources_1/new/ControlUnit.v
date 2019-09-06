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


module ControlUnit(opCode, zero, sign, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, RD, WR, ExtSel, RegDst, PCSrc, ALUOp);
    input [5:0] opCode;
    input zero, sign;
    output reg PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, RD, WR, ExtSel, RegDst;
    output reg [1:0] PCSrc;
    output reg [2:0] ALUOp;
    always@(opCode or zero or sign) begin
        PCWre = (opCode == 6'b111111)? 0 : 1;
        ALUSrcA = (opCode == 6'b011000)? 1 : 0;
        ALUSrcB = (opCode == 6'b000010 || opCode == 6'b010000 || opCode == 6'b010010 || opCode == 6'b011100 ||opCode == 6'b100110 || opCode == 6'b100111)? 1 : 0;
        DBDataSrc = (opCode == 6'b100111)? 1 : 0;
        RegWre = (opCode == 6'b000000 || opCode == 6'b000001 || opCode == 6'b000010 || opCode == 6'b010000 || opCode == 6'b010001 || opCode == 6'b010010 || opCode == 6'b010011 || opCode == 6'b011000 || opCode == 6'b011100 || opCode == 6'b100111)? 1 : 0;
        RD = (opCode == 6'b100111)? 1 : 0;
        WR = (opCode == 6'b100110)? 1 : 0;
        ExtSel = (opCode == 6'b010000 || opCode ==6'b010010)? 0 : 1;
        PCSrc[1] = (opCode == 6'b111000)? 1:0;
        PCSrc[0] = ((opCode == 6'b110000 && zero == 1) || (opCode == 6'b110001 && zero == 0) || (opCode == 6'b110010 && zero == 0 && sign==1))? 1 : 0;
        RegDst = (opCode == 6'b000010 || opCode == 6'b010000 || opCode ==6'b010010 || opCode == 6'b011100 || opCode == 6'b100111) ? 0 : 1;
        ALUOp[2] = (opCode == 6'b010001 || opCode == 6'b011100 || opCode == 6'b010000)? 1 : 0;
        ALUOp[1] = (opCode == 6'b010010 || opCode == 6'b010011 || opCode == 6'b011000 || opCode == 6'b011100)? 1 : 0;
        ALUOp[0] = (opCode == 6'b000001 || opCode == 6'b010010 || opCode == 6'b010011 || opCode == 6'b110000 || opCode == 6'b110001 || opCode == 6'b110010)? 1 : 0;
    end
endmodule
