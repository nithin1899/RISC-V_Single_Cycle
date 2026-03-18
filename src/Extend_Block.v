`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2026 14:22:08
// Design Name: 
// Module Name: Extend_Block
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


module Extend_Block(In,Imm_Ext,ImmSrc);
input [31:0]In;
input ImmSrc;
output [31:0]Imm_Ext;

assign Imm_Ext=(ImmSrc==1'b1)?{{20{In[31]}},In[31:25],In[11:7]}:
                        {{20{In[31]}},In[31:20]};

endmodule
