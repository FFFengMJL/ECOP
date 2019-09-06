`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/22 11:06:35
// Design Name: 
// Module Name: PC
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


module PC(clk, Reset, PCWre, nextAddress, Address);
    input clk, Reset, PCWre;
    input [31:0] nextAddress;
    output reg [31:0] Address;
    always @(posedge clk)begin
        if (Reset == 0)
            Address <= 0;
        else if(PCWre==1)
            Address <= nextAddress;
    end
endmodule
