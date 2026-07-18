module vedic4x4ppa_tb;
reg [3:0] a,b;
wire [7:0] result;
wire ccout;

vedic4x4ppa V0(a, b, result,ccout);

initial begin

    #10 a= 4'b0100; b= 4'b0011;
    #20 a= 4'b0011; b= 4'b0010;
    #20 a= 4'b0010; b= 4'b0010;
    #20 a= 4'b0001; b= 4'b0111;
    //#50 $finish; 
end

//always #5 clk = ~clk  ; 

endmodule

