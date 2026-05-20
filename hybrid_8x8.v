`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.04.2026 17:51:01
// Design Name: 
// Module Name: hybrid_8x8
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


module hybrid_8x8(
    input [7:0] a, b,
    output [15:0] p,
    output overflow
);

wire [3:0] AL = a[3:0];
wire [3:0] AH = a[7:4];
wire [3:0] BL = b[3:0];
wire [3:0] BH = b[7:4];

wire [7:0] P0, P1, P2, P3;

hybridvwtmul m0(AL, BL, P0);
hybridvwtmul m1(AH, BL, P1);
hybridvwtmul m2(AL, BH, P2);
hybridvwtmul m3(AH, BH, P3);

wire s1,s2,s3,s4,s5,s6,s7,s8,s10,s11,s12,s13,s14,s15,s16;
wire s9,s17,s18,s19;
wire c1,c2,c3,c4,c5,c6,c7,c8,c10,c11,c12,c13,c14,c15,c16;
wire c9,c17,c18,final_carry;

assign p[3:0]= P0[3:0];
assign p[4]=s1;
assign p[5]=s9;
assign p[6]=s10;
assign p[7]=s11;
assign p[8]=s12;
assign p[9]=s13;
assign p[10]=s14;
assign p[11]=s15;
assign p[12]=s16;
assign p[13]=s17;
assign p[14]=s18;
assign p[15]=s19;
assign overflow=final_carry;

full_adder f1(P0[4],P1[0],P2[0],s1,c1);
full_adder f2(P0[5],P1[1],P2[1],s2,c2);
full_adder f3(P0[6],P1[2],P2[2],s3,c3);
full_adder f4(P0[7],P1[3],P2[3],s4,c4);
full_adder f5(P3[0],P1[4],P2[4],s5,c5);
full_adder f6(P3[1],P1[5],P2[5],s6,c6);
full_adder f7(P3[2],P1[6],P2[6],s7,c7);
full_adder f8(P3[3],P1[7],P2[7],s8,c8);
half_adder h1(c1,s2,s9,c9);
full_adder f9(c9,c2,s3,s10,c10);
full_adder f10(c10,c3,s4,s11,c11);
full_adder f11(c11,c4,s5,s12,c12);
full_adder f12(c12,c5,s6,s13,c13);
full_adder f13(c13,c6,s7,s14,c14);
full_adder f14(c14,c7,s8,s15,c15);
full_adder f15(c15,c8,P3[4],s16,c16);
half_adder h2(P3[5],c16,s17,c17);
half_adder h3(P3[6],c17,s18,c18);
half_adder h4(P3[7],c18,s19,final_carry);

endmodule

module hybridvwtmul(input [3:0] a,b,output [7:0] p);
wire s7,s8,s9,s10,s11,s12,carry;
wire s1,s2,s3,s4,s5,s6;
wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11;
assign p[0]=a[0]&b[0];
assign p[1]=s7;
assign p[2]=s8;
assign p[3]=s9;
assign p[4]=s10;
assign p[5]=s11;
assign p[6]= s12;
assign p[7]=carry;
half_adder h1(a[1]&b[2],a[0]&b[3],s1,c1);
half_adder h2(a[2]&b[2],a[1]&b[3],s2,c2);
half_adder h3(a[1]&b[1],a[0]&b[2],s3,c3);
full_adder f1(s1,a[3]&b[0],a[2]&b[1],s4,c4);
full_adder f2(s2,a[3]&b[1],c1,s5,c5);
full_adder f3(c2,a[3]&b[2],a[2]&b[3],s6,c6);
half_adder h4(a[1]&b[0],a[0]&b[1],s7,c7);
full_adder f4(s3,a[2]&b[0],c7,s8,c8);
full_adder f5(s4,c3,c8,s9,c9);
full_adder f6(s5,c4,c9,s10,c10);
full_adder f7(s6,c5,c10,s11,c11);
full_adder f8(c6,a[3]&b[3],c11,s12,carry);
endmodule

module half_adder(
input a,b,
output s,c
);

assign s = a^b;
assign c = a&b;

endmodule

module full_adder(
input a,b,c,
output s,cout
);

assign s = a^b^c;
assign cout = a&b|b&c|c&a;

endmodule

