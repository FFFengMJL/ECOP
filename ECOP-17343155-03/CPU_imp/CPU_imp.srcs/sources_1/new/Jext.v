`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/22 11:19:28
// Design Name: 
// Module Name: Jext
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


module Jext(pc, jimme, jpc);
    input [31:0] pc;
    input [25:0] jimme;
    output [31:0] jpc;
    assign jpc[27:2] = jimme[25:0];
    assign jpc[1:0] = 2'b00;
    assign jpc[31:28] = pc[31:28];
endmodule
