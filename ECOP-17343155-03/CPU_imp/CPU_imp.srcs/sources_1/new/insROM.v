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


module insROM ( pc, RW, ins);
    input [31:0] pc;
    input RW;//�ڵ�����CPU��ʼ��Ϊ0
    output reg [31:0] ins;
    reg [7:0] rom [99:0];
    initial begin //�������ݵ�ָ��洢��insROM
        $readmemb ("D:/Sophomore/ECOP-2018/ECOP-17343155-03/CPU_imp/rom.txt", rom);
    end
    always @( RW or pc ) begin
        if (RW==1) begin //��ָ����� ��˷�ʽ
            ins[31:24] = rom[pc];
            ins[23:16] = rom[pc+1];
            ins[15:8] = rom[pc+2];
            ins[7:0] = rom[pc+3];
        end
    end
endmodule
