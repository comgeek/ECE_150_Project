module addRoundKey(
        input logic [1407:0] total_key_sched,
        input logic [127:0] cur_msg,
        input logic [4:0] round_num,
        output logic [127:0] msg_output
);

logic [127:0] cur_key;

// selecting which part of the schedule we are on based off of the round number
always_comb begin

    if(round_num == 4'd0)
        cur_key = total_key_sched[127:0];
    else if(round_num == 4'd1)
        cur_key = total_key_sched[255:128];
    else if(round_num == 4'd2)
        cur_key = total_key_sched[383:256];
    else if(round_num == 4'd3)
        cur_key = total_key_sched[511:384];
    else if(round_num == 4'd4)
        cur_key = total_key_sched[639:512];
    else if(round_num == 4'd5)
        cur_key = total_key_sched[767:640];
    else if(round_num == 4'd6)
        cur_key = total_key_sched[895:768];
    else if(round_num == 4'd7)
        cur_key = total_key_sched[1023:896];
    else if(round_num == 4'd8)
        cur_key = total_key_sched[1151:1024];
    else if(round_num == 4'd9)
        cur_key = total_key_sched[1279:1152];
    else if(round_num == 4'd10)
        cur_key = total_key_sched[1407:1280];
    else
        cur_key = 128'd0;
	
	 // XOR to calculate current output
    msg_output = cur_msg ^ cur_key;

end

endmodule