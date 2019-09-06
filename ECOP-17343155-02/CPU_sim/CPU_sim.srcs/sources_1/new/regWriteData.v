`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/22 11:05:15
// Design Name: 
// Module Name: regWriteData
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


module regWriteData(input DBDataSrc, input [31:0] dataALU, input [31:0] dataRAM, output [31:0] datawrite);
    assign datawrite = DBDataSrc ? dataRAM : dataALU;
endmodule
