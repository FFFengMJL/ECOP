`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/22 09:59:19
// Design Name: 
// Module Name: ALU
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


module ALU(ALUopcode, rega, regb, zero, sign, result);
    input [2:0] ALUopcode;
    input [31:0] rega;
    input [31:0] regb;
    output reg zero;
    output reg sign;
    output reg [31:0] result;
    always @( ALUopcode or regb or rega) begin
        case (ALUopcode)
            3'b000 : result = rega + regb;
            3'b001 : result = rega - regb;
            3'b010 : result = regb << rega;
            3'b011 : result = rega | regb;
            3'b100 : result = rega & regb;
            3'b101 : result = (rega < regb)?1:0; //无符号比较
            3'b110 : if (rega<regb &&(rega[31] == regb[31] )) //有符号比较
                        result = 1;
                    else if ( rega[31]==1 && regb[31]==0)
                        result = 1;
                    else result = 0;
            3'b111 : result = rega ^ regb;
            default : begin
                result = 32'h00000000;
                $display ("ERROE");
            end
        endcase
        sign = result[31];
        zero = (result==0) ? 1:0;
    end
endmodule
