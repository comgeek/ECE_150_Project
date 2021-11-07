

module Homework4(CLOCK_50,ref_reset_reset,SW,LEDR,LEDG,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7,
DRAM_ADDR,DRAM_BA,DRAM_CAS_N,DRAM_CKE,DRAM_CS_N,DRAM_DQ,DRAM_DQM,DRAM_RAS_N,DRAM_WE_N,DRAM_CLK,KEY,AES_EXPORT_DATA);

input CLOCK_50;
input [0:0] ref_reset_reset;
input  [3:0] KEY;
input [17:0] SW;
output [7:0] LEDG;
output [17:0] LEDR;

output  [6:0] HEX0;
output  [6:0] HEX1;
output  [6:0] HEX2;
output  [6:0] HEX3;
output  [6:0] HEX4;
output  [6:0] HEX5;
output  [6:0] HEX6;
output  [6:0] HEX7;




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


// Exported data to show on Hex displays
output reg [31:0] AES_EXPORT_DATA;
	
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
		  .nios2_a_avalon_aes_interface_0_export_data_export_data (AES_EXPORT_DATA)  // nios2_a_avalon_aes_interface_0_export_data.export_data

	
    );
	 
	// Probably need to instantiate avalon_aes_interface 

// Display the first 4 and the last 4 hex values of the received message
hexdriver hexdrv0 (
	.In(AES_EXPORT_DATA[3:0]),
   .Out(HEX0)
);
hexdriver hexdrv1 (
	.In(AES_EXPORT_DATA[7:4]),
   .Out(HEX1)
);
hexdriver hexdrv2 (
	.In(AES_EXPORT_DATA[11:8]),
   .Out(HEX2)
);
hexdriver hexdrv3 (
	.In(AES_EXPORT_DATA[15:12]),
   .Out(HEX3)
);
hexdriver hexdrv4 (
	.In(AES_EXPORT_DATA[19:16]),
   .Out(HEX4)
);
hexdriver hexdrv5 (
	.In(AES_EXPORT_DATA[23:20]),
   .Out(HEX5)
);
hexdriver hexdrv6 (
	.In(AES_EXPORT_DATA[27:24]),
   .Out(HEX6)
);
hexdriver hexdrv7 (
	.In(AES_EXPORT_DATA[31:28]),
   .Out(HEX7)
);
 
	 
	 
	 
	 
	 
	
assign KEYS = (~KEY) &32'hF;
endmodule

