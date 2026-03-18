`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2026 20:12:49
// Design Name: 
// Module Name: RISCV_SINGLE_CYCLE_TB
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


module RISCV_SINGLE_CYCLE_TB;

reg clk=1'b1, rst;

// DUT instantiation
Single_cycle_interfaced Single_cycle_interfaced(
    .clk(clk),
    .rst(rst)
);

initial begin 
$dumpfile("Single_cycle.vcd");
$dumpvars(0);
end

always begin
clk=~clk;
#50;
end

initial begin
    rst<=1'b0;
    #150;
    rst<=1;
    #500;
    $finish;
end

endmodule
