`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/22 11:23:25
// Design Name: 
// Module Name: dataRAM
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


module dataRAM(clk, address, writeData, mRD, mWR, Dataout);
    input clk;
    input [31:0] address;
    input [31:0] writeData;
    input mRD;
    input mWR;
    output [31:0] Dataout;
    reg [7:0] ram [0:60];
    // ¶Á
    assign Dataout[7:0] = (mRD==1)?ram[address + 3]:8'bz; // zÎª¸ß×èÌ¬
    assign Dataout[15:8] = (mRD==1)?ram[address + 2]:8'bz;
    assign Dataout[23:16] = (mRD==1)?ram[address + 1]:8'bz;
    assign Dataout[31:24] = (mRD==1)?ram[address ]:8'bz;
    // Ð´
    always@( negedge clk ) begin // ÓÃÊ±ÖÓÏÂ½µÑØ´¥·¢Ð´´æ´¢Æ÷
        if( mWR==1 ) begin
            ram[address] <= writeData[31:24];
            ram[address+1] <= writeData[23:16];
            ram[address+2] <= writeData[15:8];
            ram[address+3] <= writeData[7:0];
        end
    end
endmodule
