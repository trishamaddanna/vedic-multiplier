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

module parallelprefis_add4(input wire [3:0] a, b_res, input wire cin, output wire [3:0] S, wire [3:0] p, g);
	
	
	pro_gen pg_0 (a[0], b_res[0], p[0], g[0]);
	pro_gen pg_1 (a[1], b_res[1], p[1], g[1]);
	pro_gen pg_2 (a[2], b_res[2], p[2], g[2]);
	pro_gen pg_3 (a[3], b_res[3], p[3], g[3]);
		wire [1:0] lvl1_P, lvl1_G;
	 carry  box_lvl1_0 (p[0], g[0], 1'b0, cin, lvl1_P[0], lvl1_G[0]);
	 carry  box_lvl1_1 (p[2], g[2], p[1], g[1], lvl1_P[1], lvl1_G[1]);
	 	wire [1:0] lvl2_P, lvl2_G;
	 carry  box_lvl2_0 (p[1], g[1], lvl1_P[0], lvl1_G[0], lvl2_P[0], lvl2_G[0]);
	 carry  box_lvl2_1 (lvl1_P[1], lvl1_G[1], lvl1_P[0], lvl1_G[0], lvl2_P[1], lvl2_G[1]);
	 wire [1:0] lvl3_P, lvl3_G;
	 carry  box_lvl3_0 (p[3], g[3], lvl2_P[1], lvl2_G[1], lvl3_P[0], lvl3_G[0]);
	 sum circle_0 (a[0], b_res[0], cin, S[0]);
	sum circle_1 (a[1], b_res[1], lvl1_G[0], S[1]);
	sum circle_2 (a[2], b_res[2], lvl2_G[0], S[2]);
	sum circle_3 (a[3], b_res[3], lvl2_G[1], S[3]);
	endmodule 

module input4b_adder( A, B, c_in,Z,cout);
input [3:0] A,B;
input c_in;
output [3:0] Z;
output cout;
//wire [3:0] a1,s1;
wire [3:0] s2;
parallelprefis_add4 ADD1(A, B, c_in, Z,s2,cout);
//parallelprefis_add4 ADD2(s1, , a1, Z,s4,cout);
//assign  a1[0]=1'b0; 
endmodule
