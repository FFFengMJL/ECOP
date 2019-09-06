`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/14 10:13:49
// Design Name: 
// Module Name: nextCondition
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


module nextCondition(con, opcode, nextcon);
    input[2:0] con;
    input[5:0] opcode;
    output reg [2:0] nextcon;
    always@(con) begin
        case(con)
            3'b000:nextcon = con + 1;
            3'b001:if(opcode == 6'b111000 || opcode == 6'b111010 || opcode == 6'b111001 || opcode == 6'b111111)
                        nextcon = 3'b000;
                    else if(opcode == 6'b110100 || opcode == 6'b110101 || opcode == 6'b110110)
                        nextcon = 3'b101;
                    else if(opcode == 6'b110000 || opcode == 6'b110001)
                        nextcon = 3'b010;
                    else
                        nextcon = 3'b110;
            3'b110:nextcon = 3'b111;
            3'b101:nextcon = 3'b000;           
            3'b010:nextcon = 3'b011;
            3'b011:if(opcode == 6'b110000)
                        nextcon=3'b000;
                    else if(opcode ==6'b110001)
                        nextcon=3'b100;
            3'b111:nextcon = 3'b000;
            3'b100:nextcon = 3'b000;
        endcase
    end
endmodule
