/************************************************************************
AES Decryption Core Logic
Dong Kai Wang, Fall 2017
For use with ECE 385 Experiment 9
University of Illinois ECE Department
************************************************************************/

module AES (
	input	 logic CLK,
	input  logic RESET,
	input  logic AES_START,
	output logic AES_DONE,
	input  logic [127:0] AES_KEY,
	input  logic [127:0] AES_MSG_ENC,
	output logic [127:0] AES_MSG_DEC
);

// output variables that hold the message's state after a certain part of the decryption
logic [127:0] cur_msg, output_isr, output_isb, output_ark, output_imc;

// intermediate values needed for invMixCols
logic [31:0] mc_input, mc_middle; // input, middle values for mix columns

// 0 - round, 1 - key, 2 - instruction, 3 - mix columns

logic [3:0] c_add_bool, c_reset; // adder indicator, reset for counter

// counter output (4 5 bit round counts)
logic [4:0] round [3:0];


logic load_key, load_aes_enc; // first shift register - load first msg or curr msg (first RK?)
logic [127:0] cur_instruction; // from MUX selecting between 4 loop actions

logic [1407:0] total_key_sched;

// NEED:  (two 4:1 MUX 32 & 128b), 1:4 decoder, AES_CONTROL
SR_128b key_SR( .Clk(CLK), .Reset(RESET), .Load1(load_key), .Load2(load_aes_enc),
				   .data_1(cur_instruction), .data_2(AES_MSG_ENC), .Data_Out(cur_msg) );

// KEY EXPANSION - takes longer, so need a counter to ensure it finishes
counter k_counter( .CLK(CLK), .RESET(c_reset[1]), .add_bool(c_add_bool[1]), .count_total(5'd24), .count_out(round[1]) );
KeyExpansion key_exp_INV( .clk(CLK), .Cipherkey(AES_KEY), .KeySchedule(total_key_sched) );

// invShiftRows
InvShiftRows shift_rows_INV( .data_in(cur_msg), .data_out(output_isr) );

// InvSubBytes
InvSub_16 sub_16_INV ( .clk(CLK), .in(cur_msg), .out(output_isb) );

// ADD ROUND KEY, the counter is for the 10 rounds
counter r_counter( .*, .RESET(c_reset[0]), .add_bool(c_add_bool[0]), .count_total(4'd10), .count_out(round[0]) );
addRoundKey add_round_key_INV( .*, .round_num(round[0]), .msg_output(output_ark) );

// this counter indicates which part of invMixCols is occurring
counter mc_counter( .*, .RESET(c_reset[3]), .add_bool(c_add_bool[3]), .count_total(4'd4), .count_out(round[3]) ); // mix column counter

// MIX COLUMNS
MUX_41 #(32) word_selector ( .in0(cur_msg[31:0]), .in1(cur_msg[63:32]),
							 .in2(cur_msg[95:64]), .in3(cur_msg[127:96]),
							 .select(round[3]), .mux_output(mc_input) ); // 32 b MUX

InvMixColumns mix_col_INV( .in(mc_input), .out(mc_middle) );
selector imc_sel( .*, .out_bits(mc_middle), .select(round[3]), .data_out(output_imc) );


// counting which instruction - 0 is shift, 1 is sub, 2 is round key, 3 is mix col
counter ic_counter( .*, .RESET(c_reset[2]), .add_bool(c_add_bool[2]), .count_total(4'd4), .count_out(round[2]) ); // instruction counter

// selecting proper current state of message
MUX_41 #(128) instr_selector ( .in0(output_imc), .in1(output_ark),
							 .in2(output_isb), .in3(output_isr),
							 .select(round[2]), .mux_output(cur_instruction) ); // 128 b MUX

// creating hardware state machine
control_unit state_machine( .*, .round_reset(c_reset), .round_bool(c_add_bool),
									 .Load_R0(load_aes_enc), .Load_Key(load_key) );

// making sure decrypted message is output
assign AES_MSG_DEC = cur_msg;

endmodule