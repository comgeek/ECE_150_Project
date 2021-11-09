`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2021 10:43:55 AM
// Design Name: 
// Module Name: ring_osc
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module LUT1 (
    input        clk,
    input  [5:0] lut_in,
    output reg   lut_out5,
    output reg   lut_out6           
                  
);                  

(* S="TRUE" *) reg [5:0]  lut_in_r;
wire       lut_out5_d, lut_out6_d;

always @(posedge clk) begin
    lut_in_r <= lut_in;
    lut_out5 <= lut_out5_d;
    lut_out6 <= lut_out6_d;
end    

(* LOCK_PINS="ALL", BEL="A6LUT" *) 
LUT6_2 #(
    .INIT (64'h0000_0000_0000_0001)
) LUT_U0 (
    .I0 (lut_in_r[0]), 
    .I1 (lut_in_r[1]), 
    .I2 (lut_in_r[2]), 
    .I3 (lut_in_r[3]), 
    .I4 (lut_in_r[4]), 
    .I5 (1'b1       ),
    .O5 (lut_out5_d ),
    .O6 (lut_out6_d )          
);

endmodule // luts_vlog


module ring_osc
#(parameter INV_COUNT = 7)
(
    input enable_IBUF,
    output osc_out
);
    
wire en_out;
and enable_and (en_out, enable_IBUF, osc_out);
genvar i;
generate
for(i = 0; i < INV_COUNT; i = i+1) begin : invs
wire w;
if(i == 0)

    LUT1 lut1(.INIT(2'b01)) osc_inv (.O(w), .I0(en_out));
	lut_input  lut_a(a, aw);
   lut_output lut_q(~aw, q);
	 
	 
	 
	 
	 
	 
else
    LUT1 lut2(.INIT(2'b01)) osc_inv (.O(w), .I0(invs[i-1].w));
end
endgenerate

assign osc_out = invs[INV_COUNT-1].w;
endmodule

