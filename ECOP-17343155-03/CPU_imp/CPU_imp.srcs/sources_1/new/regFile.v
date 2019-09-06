`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/22 10:43:56
// Design Name: 
// Module Name: regFile
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


module regFile(CLK, RST, RegWre, ReadReg1, ReadReg2, WriteReg, WriteData, ReadData1, ReadData2, reg0, reg1, reg2, reg3, reg4, reg5, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg31);
    input CLK;
    input RST;
    input RegWre;
    input [4:0] ReadReg1,ReadReg2,WriteReg;
    input [31:0] WriteData;
    output [31:0] ReadData1,ReadData2,reg0, reg1, reg2, reg3, reg4, reg5, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg31;
    reg [31:0] regFile[0:31];
    integer i;
    assign ReadData1 = (ReadReg1 == 0) ? 0 : regFile[ReadReg1];
    assign ReadData2 = (ReadReg2 == 0) ? 0 : regFile[ReadReg2];
    assign reg0 = regFile[0];
    assign reg1 = regFile[1];
    assign reg2 = regFile[2];
    assign reg3 = regFile[3];
    assign reg4 = regFile[4];
    assign reg5 = regFile[5];
    assign reg8 = regFile[8];
    assign reg9 = regFile[9];
    assign reg10 = regFile[10];
    assign reg11 = regFile[11];
    assign reg12 = regFile[12]; 
    assign reg13 = regFile[13];
    assign reg14 = regFile[14];
    assign reg31 = regFile[31];
    always @ (negedge CLK ) begin // ±ÿ–Î”√ ±÷”±ﬂ—ÿ¥•∑¢
        if (RST==0) begin
            for(i=0;i<32;i=i+1)
                regFile[i] <= 0;
        end
        if(RegWre == 1 && WriteReg != 0) // WriteReg != 0£¨$0 ºƒ¥Ê∆˜≤ªƒ‹–ﬁ∏ƒ
            regFile[WriteReg] <= WriteData; // –¥ºƒ¥Ê∆˜
    end
endmodule
