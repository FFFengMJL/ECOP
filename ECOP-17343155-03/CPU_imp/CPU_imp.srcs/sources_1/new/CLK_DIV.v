`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/22 15:51:10
// Design Name: 
// Module Name: CLK_DIV
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


module CLK_DIV(
    input clk,
    output clk_190hz
    );
    
    reg [17:0] q;
    always @ (posedge clk)    
    begin
            q<=q+1;
    end
    assign clk_190hz = q[17];
endmodule
