`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/22 15:30:57
// Design Name: 
// Module Name: IR
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


module IR(clk, ins, IRWre, op, rs, rt, rd, sa, immediate, jumpimmediate);
    input clk,IRWre;
    input[31:0] ins;
    output reg [5:0] op;
    output reg [4:0] rs, rt, rd, sa;
    output reg [15:0] immediate;
    output reg [25:0] jumpimmediate;
    always@(posedge clk) begin
        if(IRWre) begin            //IR
            op = ins [31:26];
            rs = ins [25:21];
            rt = ins [20:16];
            rd = ins [15:11];
            immediate = ins [15:0];
            sa = ins [10:6];
            jumpimmediate = ins [25:0];
        end
    end
endmodule
