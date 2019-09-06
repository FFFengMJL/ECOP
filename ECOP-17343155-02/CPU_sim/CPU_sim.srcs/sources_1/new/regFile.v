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


module regFile(CLK, RST, RegWre, ReadReg1, ReadReg2, WriteReg, WriteData, ReadData1, ReadData2);
    input CLK;
    input RST;
    input RegWre;
    input [4:0] ReadReg1,ReadReg2,WriteReg;
    input [31:0] WriteData;
    output [31:0] ReadData1,ReadData2;
    reg [31:0] regFile[0:31];
    integer i;
    assign ReadData1 = (ReadReg1 == 0) ? 0 : regFile[ReadReg1];
    assign ReadData2 = (ReadReg2 == 0) ? 0 : regFile[ReadReg2];
    always @ (negedge CLK ) begin // ±ÿ–Î”√ ±÷”±ﬂ—ÿ¥•∑¢
        if (RST==0) begin
            for(i=1;i<32;i=i+1)
                regFile[i] <= 0;
        end
        else if(RegWre == 1 && WriteReg != 0) // WriteReg != 0£¨$0 ºƒ¥Ê∆˜≤ªƒ‹–ﬁ∏ƒ
            regFile[WriteReg] <= WriteData; // –¥ºƒ¥Ê∆˜
    end
endmodule
