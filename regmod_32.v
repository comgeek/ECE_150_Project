//this module is a parallel load 32-bit register

module regmod_32(input Clk, LD,
				   input  [31:0] Din,
				   output reg [31:0] Dout);
					
		always @ (posedge Clk)
		begin
			if(LD)
				Dout <= Din;
		end
endmodule