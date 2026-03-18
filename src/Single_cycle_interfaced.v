`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2026 12:58:00
// Design Name: 
// Module Name: Single_cycle_interfaced
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
`include "PC.v"
`include "Instruction_Memory.v"
`include "Register_File.v"
`include "Extend_Block.v"
`include "ALU2.v"
`include "Data_Memory.v"
`include "Control_unit.v"
`include "PC_ALU.v"
`include "mux.v"


module Single_cycle_interfaced(clk,rst);

input clk,rst;
wire [31:0]PC_Instr,PC_Next_Inter;
wire [31:0]RD_Reg,RD1_Inter,mux1_result,mux2_result;
wire [31:0]Extended,Result_Inter,ReadData_Inter,WriteData_Inter;
wire [2:0]ALUControl_Inter;
wire RegWrite_Inter,MemWriteEnable_Inter;
wire [1:0]ImmSrc_Inter;
wire ALUSrc_Inter,ResultSrc_Inter;


PC PC(.PC_Next(PC_Next_Inter),
      .clk(clk),
      .rst(rst),
      .PC(PC_Instr));
      
Instruction_Memory Instruction_Memory(.A(PC_Instr),
                                      .rst(rst),
                                      .RD(RD_Reg));      
      
Register_File Register_File(.clk(clk),
                            .rst(rst),
                            .A1(RD_Reg[19:15]),
                            .A2(RD_Reg[24:20]),
                            .A3(RD_Reg[11:7]),
                            .WE3(RegWrite_Inter),
                            .WD3(mux2_result),
                            .RD1(RD1_Inter),
                            .RD2(WriteData_Inter));
                       
Extend_Block Extend_Block(.In(RD_Reg),
                          .Imm_Ext(Extended),
                          .ImmSrc(ImmSrc_Inter[0]));                                  

ALU2 ALU2(.A(RD1_Inter),
          .B(mux1_result),
          .ALUControl(ALUControl_Inter),
          .Result(Result_Inter),
          .Negative(),
          .Zero(),
          .Carry(),
          .Overflow());
          
Control_unit Control_unit(.Op(RD_Reg[6:0]),
                          .RegWrite(RegWrite_Inter),
                          .ImmSrc(ImmSrc_Inter),
                          .ALUSrc(ALUSrc_Inter),
                          .MemWrite(MemWriteEnable_Inter),
                          .ResultSrc(ResultSrc_Inter),
                          .Branch(),
                          .funct3(RD_Reg[14:12]),
                          .funct7(RD_Reg[31:25]),
                          .ALUControl(ALUControl_Inter)); 
                          
Data_Memory Data_Memory(.clk(clk),
                        .WE(MemWriteEnable_Inter),
                        .A(Result_Inter),
                        .WD(WriteData_Inter),
                        .RD(ReadData_Inter));  
                        
PC_ALU PC_ALU(.a(PC_Instr),
              .b(32'd4),
              .c(PC_Next_Inter));
              
mux mux1(.a(WriteData_Inter),
         .b(Extended),
         .s(ALUSrc_Inter),
         .result(mux1_result)); 
         
mux mux2(.a(Result_Inter),
         .b(ReadData_Inter),
         .s(ResultSrc_Inter),
         .result(mux2_result));                      
                                                                     

endmodule
