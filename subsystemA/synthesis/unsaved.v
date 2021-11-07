// unsaved.v

// Generated using ACDS version 20.1 720

`timescale 1 ps / 1 ps
module unsaved (
		input  wire        clk_clk,                             //                            clk.clk
		output wire [6:0]  hex_0_external_connection_export,    //      hex_0_external_connection.export
		output wire [6:0]  hex_1_external_connection_export,    //      hex_1_external_connection.export
		output wire [6:0]  hex_2_external_connection_export,    //      hex_2_external_connection.export
		output wire [6:0]  hex_3_external_connection_export,    //      hex_3_external_connection.export
		output wire [6:0]  hex_4_external_connection_export,    //      hex_4_external_connection.export
		output wire [6:0]  hex_5_external_connection_export,    //      hex_5_external_connection.export
		output wire [6:0]  hex_6_external_connection_export,    //      hex_6_external_connection.export
		output wire [6:0]  hex_7_external_connection_export,    //      hex_7_external_connection.export
		input  wire [3:0]  key_external_connection_export,      //        key_external_connection.export
		output wire [7:0]  ledg_export,                         //                           ledg.export
		output wire [17:0] ledr_export,                         //                           ledr.export
		output wire        nios_sys_sdram_pll_0_sdram_clk_clk,  // nios_sys_sdram_pll_0_sdram_clk.clk
		input  wire        reset_reset_n,                       //                          reset.reset_n
		output wire [12:0] sdram_addr,                          //                          sdram.addr
		output wire [1:0]  sdram_ba,                            //                               .ba
		output wire        sdram_cas_n,                         //                               .cas_n
		output wire        sdram_cke,                           //                               .cke
		output wire        sdram_cs_n,                          //                               .cs_n
		inout  wire [31:0] sdram_dq,                            //                               .dq
		output wire [3:0]  sdram_dqm,                           //                               .dqm
		output wire        sdram_ras_n,                         //                               .ras_n
		output wire        sdram_we_n,                          //                               .we_n
		input  wire [17:0] switches_external_connection_export  //   switches_external_connection.export
	);

	unsaved_Nios2_A nios2_a (
		.HEX_0_external_connection_export               (hex_0_external_connection_export),    //              HEX_0_external_connection.export
		.HEX_1_external_connection_export               (hex_1_external_connection_export),    //              HEX_1_external_connection.export
		.HEX_2_external_connection_export               (hex_2_external_connection_export),    //              HEX_2_external_connection.export
		.HEX_3_external_connection_export               (hex_3_external_connection_export),    //              HEX_3_external_connection.export
		.HEX_4_external_connection_export               (hex_4_external_connection_export),    //              HEX_4_external_connection.export
		.HEX_5_external_connection_export               (hex_5_external_connection_export),    //              HEX_5_external_connection.export
		.HEX_6_external_connection_export               (hex_6_external_connection_export),    //              HEX_6_external_connection.export
		.HEX_7_external_connection_export               (hex_7_external_connection_export),    //              HEX_7_external_connection.export
		.LEDG_external_connection_export                (ledg_export),                         //               LEDG_external_connection.export
		.LEDR_external_connection_export                (ledr_export),                         //               LEDR_external_connection.export
		.avalon_aes_interface_0_export_data_export_data (),                                    //     avalon_aes_interface_0_export_data.export_data
		.clk_0_clk_in_clk                               (clk_clk),                             //                           clk_0_clk_in.clk
		.clk_0_clk_in_reset_reset_n                     (reset_reset_n),                       //                     clk_0_clk_in_reset.reset_n
		.key_external_connection_export                 (key_external_connection_export),      //                key_external_connection.export
		.nios2_gen2_0_custom_instruction_master_readra  (),                                    // nios2_gen2_0_custom_instruction_master.readra
		.sdram_wire_addr                                (sdram_addr),                          //                             sdram_wire.addr
		.sdram_wire_ba                                  (sdram_ba),                            //                                       .ba
		.sdram_wire_cas_n                               (sdram_cas_n),                         //                                       .cas_n
		.sdram_wire_cke                                 (sdram_cke),                           //                                       .cke
		.sdram_wire_cs_n                                (sdram_cs_n),                          //                                       .cs_n
		.sdram_wire_dq                                  (sdram_dq),                            //                                       .dq
		.sdram_wire_dqm                                 (sdram_dqm),                           //                                       .dqm
		.sdram_wire_ras_n                               (sdram_ras_n),                         //                                       .ras_n
		.sdram_wire_we_n                                (sdram_we_n),                          //                                       .we_n
		.switches_external_connection_export            (switches_external_connection_export), //           switches_external_connection.export
		.sys_sdram_pll_0_sdram_clk_clk                  (nios_sys_sdram_pll_0_sdram_clk_clk)   //              sys_sdram_pll_0_sdram_clk.clk
	);

	unsaved_Nios2_B nios2_b (
		.clk_clk                                       (clk_clk),       //                                    clk.clk
		.nios2_gen2_0_custom_instruction_master_readra (),              // nios2_gen2_0_custom_instruction_master.readra
		.reset_reset_n                                 (reset_reset_n)  //                                  reset.reset_n
	);

endmodule
