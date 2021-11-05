module Homework4(CLOCK_50,ref_reset_reset,SW,LEDR,LEDG,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7,DRAM_ADDR,DRAM_BA,DRAM_CAS_N,DRAM_CKE,DRAM_CS_N,DRAM_DQ,DRAM_DQM,DRAM_RAS_N,DRAM_WE_N,DRAM_CLK,KEY);

input CLOCK_50;
input [0:0] ref_reset_reset;
input  [3:0] KEY;
input [17:0] SW;
output [7:0] LEDG;
output [17:0] LEDR;

output reg [6:0] HEX0;
output reg [6:0] HEX1;
output reg [6:0] HEX2;
output reg [6:0] HEX3;
output reg [6:0] HEX4;
output reg [6:0] HEX5;
output reg [6:0] HEX6;
output reg [6:0] HEX7;

wire [3:0] KEYS;


reg [6:0] HEX0_inv;
reg [6:0] HEX1_inv;
reg [6:0] HEX2_inv;
reg [6:0] HEX3_inv;
reg [6:0] HEX4_inv;
reg [6:0] HEX5_inv;
reg [6:0] HEX6_inv;
reg [6:0] HEX7_inv;

output	[12:0]	DRAM_ADDR;
output	[1:0]	DRAM_BA;
output	DRAM_CAS_N;
output	DRAM_CKE;
output	DRAM_CS_N;
inout	[31:0]	DRAM_DQ;
output	[3:0]	DRAM_DQM;
output	DRAM_RAS_N;
output	DRAM_WE_N;
output	DRAM_CLK;

	
    unsaved NiosII (
        .reset_reset_n                       (ref_reset_reset),                       //                          reset.reset_n
        .ledr_export                         (LEDR),                         //                           ledr.export
        .ledg_export                         (LEDG),                         //                           ledg.export
        .hex_0_external_connection_export    (HEX0_inv),    //      hex_0_external_connection.export
        .hex_1_external_connection_export    (HEX1_inv),    //      hex_1_external_connection.export
        .hex_2_external_connection_export    (HEX2_inv),    //      hex_2_external_connection.export
        .hex_3_external_connection_export    (HEX3_inv),    //      hex_3_external_connection.export
        .hex_4_external_connection_export    (HEX4_inv),    //      hex_4_external_connection.export
        .hex_5_external_connection_export    (HEX5_inv),    //      hex_5_external_connection.export
        .hex_6_external_connection_export    (HEX6_inv),    //      hex_6_external_connection.export
        .hex_7_external_connection_export    (HEX7_inv),    //      hex_7_external_connection.export
        .switches_external_connection_export (SW), //   switches_external_connection.export
        .sdram_addr                          (DRAM_ADDR),                          //                          sdram.addr
        .sdram_ba                            (DRAM_BA),                            //                               .ba
        .sdram_cas_n                         (DRAM_CAS_N),                         //                               .cas_n
        .sdram_cke                           (DRAM_CKE),                           //                               .cke
        .sdram_cs_n                          (DRAM_CS_N),                          //                               .cs_n
        .sdram_dq                            (DRAM_DQ),                            //                               .dq
        .sdram_dqm                           (DRAM_DQM),                           //                               .dqm
        .sdram_ras_n                         (DRAM_RAS_N),                         //                               .ras_n
        .sdram_we_n                          (DRAM_WE_N),                          //                               .we_n
        .key_external_connection_export      (KEYS),      //        key_external_connection.export
		  .nios_sys_sdram_pll_0_sdram_clk_clk  (DRAM_CLK),  // nios_sys_sdram_pll_0_sdram_clk.clk
        .clk_clk                             (CLOCK_50),     
	
    );

	

always@(*)
begin
 HEX0 <= ~HEX0_inv;
 HEX1 <= ~HEX1_inv;
 HEX2 <= ~HEX2_inv;
 HEX3 <= ~HEX3_inv;
 HEX4 <= ~HEX4_inv;
 HEX5 <= ~HEX5_inv;
 HEX6 <= ~HEX6_inv;
 HEX7 <= ~HEX7_inv;

	end
	
assign KEYS = (~KEY) &32'hF;
endmodule

