`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/22 11:03:44
// Design Name: 
// Module Name: regWriteAddress
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


module regWriteAddress(input RegDst, input [4:0] rtreg, input [4:0] rdreg, output [4:0] regwrite);
    assign regwrite = RegDst ? rdreg : rtreg;
endmodule
