
module unsaved (
	clk_clk,
	hex_0_external_connection_export,
	hex_1_external_connection_export,
	hex_2_external_connection_export,
	hex_3_external_connection_export,
	hex_4_external_connection_export,
	hex_5_external_connection_export,
	hex_6_external_connection_export,
	hex_7_external_connection_export,
	key_external_connection_export,
	ledg_export,
	ledr_export,
	nios2_a_avalon_aes_interface_0_export_data_export_data,
	nios_sys_sdram_pll_0_sdram_clk_clk,
	reset_reset_n,
	sdram_addr,
	sdram_ba,
	sdram_cas_n,
	sdram_cke,
	sdram_cs_n,
	sdram_dq,
	sdram_dqm,
	sdram_ras_n,
	sdram_we_n,
	switches_external_connection_export,
	nios2_b_ring_oscillator_0_conduit_export_export_data);	

	input		clk_clk;
	output	[6:0]	hex_0_external_connection_export;
	output	[6:0]	hex_1_external_connection_export;
	output	[6:0]	hex_2_external_connection_export;
	output	[6:0]	hex_3_external_connection_export;
	output	[6:0]	hex_4_external_connection_export;
	output	[6:0]	hex_5_external_connection_export;
	output	[6:0]	hex_6_external_connection_export;
	output	[6:0]	hex_7_external_connection_export;
	input	[3:0]	key_external_connection_export;
	output	[7:0]	ledg_export;
	output	[17:0]	ledr_export;
	output	[31:0]	nios2_a_avalon_aes_interface_0_export_data_export_data;
	output		nios_sys_sdram_pll_0_sdram_clk_clk;
	input		reset_reset_n;
	output	[12:0]	sdram_addr;
	output	[1:0]	sdram_ba;
	output		sdram_cas_n;
	output		sdram_cke;
	output		sdram_cs_n;
	inout	[31:0]	sdram_dq;
	output	[3:0]	sdram_dqm;
	output		sdram_ras_n;
	output		sdram_we_n;
	input	[17:0]	switches_external_connection_export;
	output	[31:0]	nios2_b_ring_oscillator_0_conduit_export_export_data;
endmodule
