module counter (
        input logic CLK,
        input logic RESET,
        input logic add_bool,
		  input logic [4:0] count_total,
        output logic [4:0] count_out
);

// temp variable to hold count
logic [4:0] count_holder;

// assigning next count value
always_ff @ (posedge CLK) begin

    if(RESET && add_bool == 0)
        count_out <= 5'd0;
    else if(add_bool)
        count_out <= count_holder;

end

// determining next count value
always_comb begin
	 
	 // we use different values for different counters
	 // 10 for round counter, 24 for key counter, and 4 for instruction and mixCol counter
    if(count_out == count_total)
		  count_holder = 5'd0;
    else
	     count_holder = count_out + 5'd1;

end

endmodule