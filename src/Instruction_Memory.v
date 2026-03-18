`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2026 11:41:35
// Design Name: 
// Module Name: Instruction_Memory
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


module Instruction_Memory(A,rst,RD);
input [31:0]A;
input rst;
output [31:0]RD;
reg [31:0]Instr_Mem[1023:0];

assign RD=(~rst)? 32'd0:Instr_Mem[A[31:2]];

initial
begin 
Instr_Mem[0] = 32'b00000000001000001000000110110011;
end

endmodule
