`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/14 10:12:13
// Design Name: 
// Module Name: Dtrigger
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


module Dtrigger(clk, reset, conin, conout);
    input clk,reset;
    input[2:0] conin;
    output reg [2:0] conout;
    always@(posedge clk)
        if(reset == 0)
            conout = 3'b000;
        else
            conout = conin;
endmodule
