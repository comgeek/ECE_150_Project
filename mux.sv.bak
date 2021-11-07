// Inputs: ([width - 1:0] in0, in1, in2, in3), [1:0] select
// Outputs: [width - 1:0] mux_output
// Description: A simple 4:1 MUX with either 128 or 32 bits for each input, and a 2 select bits.
//					 The select bits indicate which bits of input will be output.
//                   Both a 32 bit and 128 bit 4:1 MUX is needed, so the we avoid repetition
//                   by utilizing the parameter size function.
// Purpose: A 32 bit 4:1 MUX is needed in AES.sv to select proper word of the 128 bits
//            out of 4 possible words. A 128 bit 4:1 MUX is needed in AES.sv to determine the state of the message (where it is in sequence of shift, sub, round key, mix col).
module MUX_41 #(parameter width = 32)
(
			input logic [width - 1:0] in0,
			input logic [width - 1:0] in1,
            input logic [width - 1:0] in2,
            input logic [width - 1:0] in3,
			input logic [1:0] select,
			output logic [width - 1:0] mux_output
);

always_comb

	begin

		// determing which data bit should be selected
		if(select == 2'b00)
			mux_output = in3;
		else if(select == 2'b01)
			mux_output = in2;
        else if(select == 2'b10)
    		mux_output = in1;
        else
        	mux_output = in0;

	end

endmodule


module selector
(
            input CLK,
			input [31:0] out_bits,
			input logic [1:0] select,
			output logic [127:0] data_out
);

logic [31:0] selected_bits; // selecting 32 bits

// this is needed for invMixCol - we only look at one word a time
// this selects either the first, second, third, orfourth words
always_ff @ (posedge CLK) begin

        if(select == 2'd3)
            data_out[31:0] <= out_bits;
        else if(select == 2'd2)
            data_out[63:32] <= out_bits;
        else if(select == 2'd1)
            data_out[95:64] <= out_bits;
        else
            data_out[127:96] <= out_bits;

end

endmodule