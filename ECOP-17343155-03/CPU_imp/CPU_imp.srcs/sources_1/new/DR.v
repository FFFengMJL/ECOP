`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/22 15:19:19
// Design Name: 
// Module Name: DR
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


module DR(clk,  reg1, reg2, result, ramdata,aluA, aluB, ramadd, wdata,DBDataSrc);
    input clk, DBDataSrc;
    input[31:0] reg1, reg2, result, ramdata;
    output reg [31:0] aluA, aluB, ramadd, wdata;
    always@(posedge clk) begin    
            aluA = reg1;
            aluB = reg2;
            ramadd = result;
            wdata = DBDataSrc ? ramdata : result;
        end
endmodule
