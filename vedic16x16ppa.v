`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:15/07/2024 06:06:07 PM
// Design Name: 
// Module Name: vedic16x16ppa
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

module vedic16x16ppa(ai,bi,sout,ccout
    );
input [15:0]ai;
input [15:0]bi;
output [31:0]sout;
wire cc0,cc1,cc2,cc3;
output ccout;
wire [15:0]b0;	
wire [15:0]b1;	
wire [15:0]b2;
wire [15:0]b3;	
wire ccin;
wire [31:0]sout;
wire [15:0]temp5;
wire [15:0]temp6;
wire [15:0]b4;
wire [15:0]b5;
wire [15:0]b6;
assign ccin=1'b0;
// using 4 8x8 multipliers
vedic8x8ppa zz1(ai[7:0],bi[7:0],b0[15:0]);
vedic8x8ppa zz2(ai[15:8],bi[7:0],b1[15:0]);
vedic8x8ppa zz3(ai[7:0],bi[15:8],b2[15:0]);
vedic8x8ppa zz4(ai[15:8],bi[15:8],b3[15:0]);

input3_adder pa1( b1[15:0],b2[15:0],ccin, b4[15:0],cc1);
assign temp5 ={8'b0,b0[15:8]};
input3_adder pa2( b4[15:0], temp5,ccin,b5[15:0], cc2);
or(cc0,cc1,cc2);
assign temp6 ={7'b0,cc0,b5[15:8]};
input3_adder pa3( b3[15:0], temp6,ccin,b6[15:0], cc3);

// fnal output assignment 
assign sout[7:0]=b0[7:0];
assign sout[15:8]=b5[7:0];
assign sout[31:16]=b6[15:0];
assign ccout=cc3;

endmodule
