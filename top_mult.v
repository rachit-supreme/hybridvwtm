`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.04.2026 17:52:48
// Design Name: 
// Module Name: top_mult
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


module top_mult(
    input clk,
    input rst,
    input [7:0] a,
    input [7:0] b,
    output reg [15:0] p
);

wire [15:0] mult_p;
reg [7:0] a_r;
reg [7:0] b_r;

hybrid_8x8 uut (
    .a(a_r),
    .b(b_r),
    .p(mult_p)
);

always @(posedge clk) begin
    if (rst) begin
        a_r <= 8'b0;
        b_r <= 8'b0;
        p   <= 16'b0;
    end else begin
        a_r <= a;
        b_r <= b;
        p   <= mult_p;
    end
end

endmodule


