module vedic16x16ppa_tb;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;

	// Outputs
	wire [31:0] result;
	wire c_out;
	// Instantiate the Unit Under Test (UUT)
	vedic16x16ppa uut (a, b, result,c_out);

	initial begin
		// Initialize Inputs
		a = 16'd12;
		b = 16'd10;
		#100;
		
		a = 16'd12;
		b = 16'd12;
		#100;
		
			
		a = 16'd24;
		b = 16'd2;
		#100;
		
		a = 16'd200;
		b = 16'd21;
		#100;
		
		a = 16'd36;
		b = 16'd48;
		#100;
        
		

	end
      
endmodule
