
module vedic8x8ppa_tb;
reg [7:0] a,b;
wire [15:0] result;
wire ccout;
vedic8x8ppa V0(a, b, result,ccout);

initial begin

    #10 a= 8'b01000000; b= 8'b00110000;
    #20 a= 8'b00110000; b= 8'b00100011;
    #20 a= 8'b00100000; b= 8'b00100101;
    #20 a= 8'b00010011; b= 8'b01110011;
    //#50 $finish; 
end

//always #5 clk = ~clk  ; 

endmodule
