
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.04.2026 17:53:51
// Design Name: 
// Module Name: top_mult_tb
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

`timescale 1ns / 1ps

module top_mult_tb;

  reg clk;
  reg rst;
  reg [7:0] a;
  reg [7:0] b;
  wire [15:0] p;

  integer i;
  integer j;

  top_mult dut (
    .clk(clk),
    .rst(rst),
    .a(a),
    .b(b),
    .p(p)
  );

  // Clock generation
  initial begin
    clk = 1'b0;
  end

  always #5 clk = ~clk;

  // Test procedure
  initial begin
    $dumpfile("top_mult_tb.vcd");
    $dumpvars(0, top_mult_tb);

    rst = 1'b1;
    a = 8'b0;
    b = 8'b0;

    // Reset for 2 cycles
    repeat (2) @(posedge clk);
    rst = 1'b0;

    // Test all combinations
    for (i = 0; i < 256; i = i + 1) begin
      for (j = 0; j < 256; j = j + 1) begin

        @(negedge clk);
        a = i[7:0];
        b = j[7:0];

        // Wait for pipeline latency (1 cycle)
        repeat (2) @(posedge clk);
        #1;

        if (p !== (i * j)) begin
          $display("Mismatch: a=%0d b=%0d p=%0d expected=%0d",
                    i, j, p, i*j);
          $finish;
        end
      end
    end

    $display("PASS: all test vectors matched");
    $finish;
  end
endmodule

