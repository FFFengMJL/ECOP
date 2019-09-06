`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/22 10:33:14
// Design Name: 
// Module Name: ALU_dataA
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


module ALU_dataA(input ALUsrcA, input [31:0] rega, input [4:0] sa, output [31:0] dataA);
    assign dataA = ALUsrcA ? {{27{0}},sa} : rega;//ALUsrcA为1，dataA为位移数零扩展，ALUsrcA为0，dataA为位rega
endmodule
