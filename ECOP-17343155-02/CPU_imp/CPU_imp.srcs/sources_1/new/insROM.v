`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/22 10:14:46
// Design Name: 
// Module Name: insROM
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


module insROM ( pc, RW, op, rs, rt, rd, sa, immediate, jumpimmediate);
    input [31:0] pc;
    input RW;//在单周期CPU中始终为0
    output reg [5:0] op;
    output reg [4:0] rs, rt, rd, sa;
    output reg [15:0] immediate;
    output reg [25:0] jumpimmediate;
    reg [7:0] rom [99:0];
    reg [31:0] dataOut;
    initial begin //加载数据到指令存储器insROM
        $readmemb ("D:/Sophomore/ECOP-2018/ECOP-17343155-02/CPU_imp/rom.txt", rom);
    end
    always @( RW or pc ) begin
        if (RW==1) begin //将指令读出 大端方式
            dataOut[31:24] = rom[pc];
            dataOut[23:16] = rom[pc+1];
            dataOut[15:8] = rom[pc+2];
            dataOut[7:0] = rom[pc+3];
            op = dataOut [31:26];
            rs = dataOut [25:21];
            rt = dataOut [20:16];
            rd = dataOut [15:11];
            immediate = dataOut [15:0];
            sa = dataOut [10:6];
            jumpimmediate = dataOut [25:0];
        end
    end
endmodule
