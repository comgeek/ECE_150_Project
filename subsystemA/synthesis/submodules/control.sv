module control_unit
(
		input logic CLK,
		input logic RESET,
		input logic AES_START,
		input logic [4:0] round [3:0],
		output logic [3:0] round_reset, round_bool,
		output logic AES_DONE, Load_R0, Load_Key
);


// Declare signals curr_state, next_state of type enum
// r0 is add round key before loop, r1-r9 are within loop, and r10 is after loop
// halted is waiting state, finished after every round is finished
enum logic [3:0] { Halted, key_expansion, finished, mc_inv, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10 }
						curr_state, next_state;

// so we don't have to retype 1'b1 or 1'b0
logic HIGH, LOW;
assign HIGH = 1'b1;
assign LOW = 1'b0;

//updates flip flop, current state is the only one
always_ff @ (posedge CLK) begin
 
	if (RESET)
		curr_state <= Halted;
	else 
		curr_state <= next_state;
		
end

// 0 - round, 1 - key, 2 - instruction, 3 - mix columns
always_comb begin
	
	// setting default output values
	next_state = curr_state;
	round_reset = 4'b1110;
	round_bool = 4'b0000;
	AES_DONE = LOW;
	Load_R0 = LOW;
	Load_Key = LOW;
	
	// order of the rounds: Halted -> key_expansion -> r0 -> r1 -> invMixCol -> r2 -> invMixCol -> r3... r10 -> finished
	// if the if conidition does not hit within each state, this means counter condition isn't satisfied, so machine keeps current state
	unique case(curr_state)
	
		Halted:
				if(AES_START)
					next_state = key_expansion;
					
		key_expansion:
				if(round[1] == 5'd24)
					next_state = r0;

		r0:	
				if(round[2] == 5'd2)
					next_state = r1;
					
		r1, r2, r3, r4, r5, r6, r7, r8, r9:
				if(round[2] == 5'd3)
					next_state = mc_inv;
					
		mc_inv:
				// ensuring invMixCol is done
				if(round[3] == 5'd4) begin
					// determing which state to return to, since invMixCols happens between states r1-r10
					case(round[0])
						
						5'd2:	 next_state = r2;
						5'd3:  next_state = r3;
						5'd4:  next_state = r4;
						5'd5:	 next_state = r5;
						5'd6:  next_state = r6;
						5'd7:  next_state = r7;
						5'd8:  next_state = r8;
						5'd9:  next_state = r9;
						5'd10: next_state = r10;
						default: ;
						
					endcase
					
				end
		r10:
				if(round[2] == 5'd3)
					next_state = finished;
		
		finished:		
				if(AES_START == 1)
					next_state = Halted;
		
		default: 		next_state = Halted;

	endcase
	
	// assigning output values
	case(curr_state)
		
		Halted:	;
		
		// key expansion takes a while, so the counter ensures that it is fully finished
		key_expansion:	
		
				if(round[1] == 5'd24)
					round_bool[1] = LOW;
				else begin
					round_bool[1] = HIGH;
					Load_R0 = HIGH;
				end
		
		// checking if instr round is equal to 2, which is for add round key
		// if it is, load the current key. otherwise, wait until it is time for add round key
		r0:
		
				if(round[2] == 5'd2) begin
					round_reset[2] = HIGH;
					round_bool[2] = LOW;
					Load_Key = HIGH;
					round_bool[0] = HIGH;
				end
				
				else begin
					round_reset[2] = LOW;
					round_bool[2] = HIGH;
					Load_Key = LOW;
					round_reset[0] = HIGH;
					round_bool[0] = LOW;
				end
		
		// must either wait until all 4 operations have occured (first condition)
		// or increment the round and load the current key (second condition)
		r1, r2, r3, r4, r5, r6, r7, r8, r9, r10:
				
				if(round[2] == 5'd3) begin
					round_reset[2] = LOW;
					round_bool[2] = LOW;
					Load_Key = LOW;
					round_bool[0] = HIGH;
				end
				
				else begin
					round_reset[2] = LOW;
					round_bool[2] = HIGH;
					Load_Key = HIGH;
					round_bool[0] = LOW;
				end
		
		// ensure that invMixCol is done. If it is, reset its ocunter. Otherwise, increment and wait
		mc_inv:
		
				if(round[3] == 5'd4) begin
					round_reset[2] = HIGH;
					round_reset[3] = HIGH;
					round_bool[3] = LOW;
					Load_Key = HIGH;
					round_reset[0] = LOW;
				end
				
				else begin
					round_reset[2] = LOW;
					round_reset[3] = LOW;
					round_bool[3] = HIGH;
					Load_Key= LOW;
					round_reset[0] = LOW;
					round_bool[0] = LOW;
				end
		
		// setting done to high to be output to AES
		finished:		AES_DONE = HIGH;
		
	endcase
	
end

endmodule