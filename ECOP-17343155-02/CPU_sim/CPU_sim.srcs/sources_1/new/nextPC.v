`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/22 11:14:14
// Design Name: 
// Module Name: nextPC
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


module nextPC(pc, PCSrc, imme, jpc, nextpc);
    input [31:0] pc;
    input [1:0] PCSrc;
    input [31:0] imme;
    input [31:0] jpc;
    output reg [31:0] nextpc;
    always@(pc or PCSrc) begin
        case(PCSrc)
            2'b00:nextpc = pc + 4;
            2'b01:nextpc = pc + (imme << 2) +4;
            2'b10:nextpc = jpc;
            default:;
        endcase
    end
endmodule
