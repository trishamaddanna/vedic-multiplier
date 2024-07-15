`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15/07/2024 06:03:01 PM
// Design Name: 
// Module Name: input3_adder.v
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

module and2 (input wire i0, i1, output wire o);
	assign o = i0 & i1;
endmodule

module or2 (input wire i0, i1, output wire o);
	assign o = i0 | i1;
endmodule

module xor2 (input wire i0, i1, output wire o);
	assign o = i0 ^ i1;
endmodule

module xor3 (input wire i0, i1, i2, output wire o);
	wire temp;
	xor2 xor2_0 (i0, i1, temp);
	xor2 xor2_1 (i2, temp, o);
endmodule

module pro_gen (input wire a, b, output wire p, g);
	or2 or_1 (a, b, p);
	and2 and_1 (a, b, g);
endmodule

module carry (input wire pi, gi, pj, gj, output wire P, G);
	wire temp;
	and2 and_1 (pi, pj, P);
	and2 and_2 (pi, gj, temp);
	or2 or_0 (gi, temp, G);
endmodule

module sum (input wire a, b, gi, output wire s);
	xor3 xor3_1 (a, b, gi, s);
endmodule

module parallelprefis_add16(input wire [15:0] a, b_res, input wire cin, output wire [15:0] S,output wire [15:0] p, g);
	
	pro_gen pg_0 (a[0], b_res[0], p[0], g[0]);
	pro_gen pg_1 (a[1], b_res[1], p[1], g[1]);
	pro_gen pg_2 (a[2], b_res[2], p[2], g[2]);
	pro_gen pg_3 (a[3], b_res[3], p[3], g[3]);
	pro_gen pg_4 (a[4], b_res[4], p[4], g[4]);
	pro_gen pg_5 (a[5], b_res[5], p[5], g[5]);
	pro_gen pg_6 (a[6], b_res[6], p[6], g[6]);
   pro_gen pg_7 (a[7], b_res[7], p[7], g[7]);
	pro_gen pg_8 (a[8], b_res[8], p[8], g[8]);
	pro_gen pg_9 (a[9], b_res[9], p[9], g[9]);
	pro_gen pg_10 (a[10], b_res[10], p[10], g[10]);
	pro_gen pg_11 (a[11], b_res[11], p[11], g[11]);
	pro_gen pg_12 (a[12], b_res[12], p[12], g[12]);
	pro_gen pg_13 (a[13], b_res[13], p[13], g[13]);
	pro_gen pg_14 (a[14], b_res[14], p[14], g[14]);
	pro_gen pg_15 (a[15], b_res[15], p[15], g[15]);
	wire [7:0] lvl1_P, lvl1_G;
	 carry  box_lvl1_0 (p[0], g[0], 1'b0, cin, lvl1_P[0], lvl1_G[0]);
	 carry  box_lvl1_1 (p[2], g[2], p[1], g[1], lvl1_P[1], lvl1_G[1]);
	 carry  box_lvl1_2 (p[4], g[4], p[3], g[3], lvl1_P[2], lvl1_G[2]);
	 carry  box_lvl1_3 (p[6], g[6], p[5], g[5], lvl1_P[3], lvl1_G[3]);
	 carry  box_lvl1_4 (p[8], g[8], p[7], g[7], lvl1_P[4], lvl1_G[4]);
	 carry  box_lvl1_5 (p[10], g[10], p[9], g[9], lvl1_P[5], lvl1_G[5]);
	 carry  box_lvl1_6 (p[12], g[12], p[11], g[11], lvl1_P[6], lvl1_G[6]);
	 carry  box_lvl1_7 (p[14], g[14], p[13], g[13], lvl1_P[7], lvl1_G[7]);
	wire [7:0] lvl2_P, lvl2_G;
	 carry  box_lvl2_0 (p[1], g[1], lvl1_P[0], lvl1_G[0], lvl2_P[0], lvl2_G[0]);
	 carry  box_lvl2_1 (lvl1_P[1], lvl1_G[1], lvl1_P[0], lvl1_G[0], lvl2_P[1], lvl2_G[1]);
	 carry  box_lvl2_2 (p[5], g[5], lvl1_P[2], lvl1_G[2], lvl2_P[2], lvl2_G[2]);
	 carry  box_lvl2_3 (lvl1_P[3], lvl1_G[3], lvl1_P[2], lvl1_G[2], lvl2_P[3], lvl2_G[3]);
	 carry  box_lvl2_4 (p[9], g[9], lvl1_P[4], lvl1_G[4], lvl2_P[4], lvl2_G[4]);
	 carry  box_lvl2_5 (lvl1_P[5], lvl1_G[5], lvl1_P[4], lvl1_G[4], lvl2_P[5], lvl2_G[5]);
	 carry  box_lvl2_6 (p[13], g[13], lvl1_P[6], lvl1_G[6], lvl2_P[6], lvl2_G[6]);
	 carry  box_lvl2_7 (lvl1_P[7], lvl1_G[7], lvl1_P[6], lvl1_G[6], lvl2_P[7], lvl2_G[7]);
	wire [7:0] lvl3_P, lvl3_G;
	 carry  box_lvl3_0 (p[3], g[3], lvl2_P[1], lvl2_G[1], lvl3_P[0], lvl3_G[0]);
	 carry  box_lvl3_1 (lvl1_P[2], lvl1_G[2], lvl2_P[1], lvl2_G[1], lvl3_P[1], lvl3_G[1]);
	 carry  box_lvl3_2 (lvl2_P[2], lvl2_G[2], lvl2_P[1], lvl2_G[1], lvl3_P[2], lvl3_G[2]);
	 carry  box_lvl3_3 (lvl2_P[3], lvl2_G[3], lvl2_P[1], lvl2_G[1], lvl3_P[3], lvl3_G[3]);
	 carry  box_lvl3_4 (p[11], g[11], lvl2_P[5], lvl2_G[5], lvl3_P[4], lvl3_G[4]);
	 carry  box_lvl3_5 (lvl1_P[6], lvl1_G[6], lvl2_P[5], lvl2_G[5], lvl3_P[5], lvl3_G[5]);
	 carry  box_lvl3_6 (lvl2_P[6], lvl2_G[6], lvl2_P[5], lvl2_G[5], lvl3_P[6], lvl3_G[6]);
	 carry  box_lvl3_7 (lvl2_P[7], lvl2_G[7], lvl2_P[5], lvl2_G[5], lvl3_P[7], lvl3_G[7]);
	wire [7:0] lvl4_P, lvl4_G;
    carry  box_lvl4_0 (p[7], g[7], lvl3_P[3], lvl3_G[3], lvl4_P[0], lvl4_G[0]);
	 carry  box_lvl4_1 (lvl1_P[4], lvl1_G[4], lvl3_P[3], lvl3_G[3], lvl4_P[1], lvl4_G[1]);
	 carry  box_lvl4_2 (lvl2_P[4], lvl2_G[4], lvl3_P[3], lvl3_G[3], lvl4_P[2], lvl4_G[2]);
	 carry  box_lvl4_3 (lvl2_P[5], lvl2_G[5], lvl3_P[3], lvl3_G[3], lvl4_P[3], lvl4_G[3]);
	 carry  box_lvl4_4 (lvl3_P[4], lvl3_G[4], lvl3_P[3], lvl3_G[3], lvl4_P[4], lvl4_G[4]);
	 carry  box_lvl4_5 (lvl3_P[5], lvl3_G[5], lvl3_P[3], lvl3_G[3], lvl4_P[5], lvl4_G[5]);
	 carry  box_lvl4_6 (lvl3_P[6], lvl3_G[6], lvl3_P[3], lvl3_G[3], lvl4_P[6], lvl4_G[6]);
	 carry  box_lvl4_7 (lvl3_P[7], lvl3_G[7], lvl3_P[3], lvl3_G[3], lvl4_P[7], lvl4_G[7]);
	sum circle_0 (a[0], b_res[0], cin, S[0]);
	sum circle_1 (a[1], b_res[1], lvl1_G[0], S[1]);
	sum circle_2 (a[2], b_res[2], lvl2_G[0], S[2]);
	sum circle_3 (a[3], b_res[3], lvl2_G[1], S[3]);
	sum circle_4 (a[4], b_res[4], lvl3_G[0], S[4]);
	sum circle_5 (a[5], b_res[5], lvl3_G[1], S[5]);
	sum circle_6 (a[6], b_res[6], lvl3_G[2], S[6]);
	sum circle_7 (a[7], b_res[7], lvl3_G[3], S[7]);
	sum circle_8 (a[8], b_res[8], lvl4_G[0], S[8]);
	sum circle_9 (a[9], b_res[9], lvl4_G[1], S[9]);
	sum circle_10 (a[10], b_res[10], lvl4_G[2], S[10]);
	sum circle_11 (a[11], b_res[11], lvl4_G[3], S[11]);
	sum circle_12 (a[12], b_res[12], lvl4_G[4], S[12]);
	sum circle_13 (a[13], b_res[13], lvl4_G[5], S[13]);
	sum circle_14 (a[14], b_res[14], lvl4_G[6], S[14]);
	sum circle_15 (a[15], b_res[15], lvl4_G[7], S[15]);
endmodule 

module input3_adder( A, B, c_in, Z,cout);
input [15:0] A,B;
input c_in;
output [15:0] Z;
output cout;
//wire [15:0] a1,s1;
wire [15:0] s2;
parallelprefis_add16 ADD1(A, B, c_in, Z,s2,cout);
//parallelprefis_add16 ADD2(s1, C, a1, Z);
//assign  a1[0]=1'b0; 
endmodule
