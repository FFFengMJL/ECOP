`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/23 10:59:28
// Design Name: 
// Module Name: debouncing
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


module debouncing(clk,key_in,key_out);
    input clk;
    input key_in;
    output key_out;
    reg dout1,dout2,dout3;
    assign key_out = dout1 | dout2 | dout3;
    always@(posedge clk) begin
        dout1<=key_in;
        dout2<=dout1;
        dout3<=dout2;
    end
endmodule
