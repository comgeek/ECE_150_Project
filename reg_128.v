//this module is a parallel load 128-bit register

module reg_128(input  Clk, Reset, LD,
				   input  [127:0] Din,
				   output reg [127:0] Dout);
					
		always @ (posedge Clk)
		begin
			if(Reset)
				Dout <= 128'd0;
			else if(LD)
				Dout <= Din;
		end
endmodule