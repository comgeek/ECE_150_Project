	component unsaved is
		port (
			clk_clk                                                : in    std_logic                     := 'X';             -- clk
			hex_0_external_connection_export                       : out   std_logic_vector(6 downto 0);                     -- export
			hex_1_external_connection_export                       : out   std_logic_vector(6 downto 0);                     -- export
			hex_2_external_connection_export                       : out   std_logic_vector(6 downto 0);                     -- export
			hex_3_external_connection_export                       : out   std_logic_vector(6 downto 0);                     -- export
			hex_4_external_connection_export                       : out   std_logic_vector(6 downto 0);                     -- export
			hex_5_external_connection_export                       : out   std_logic_vector(6 downto 0);                     -- export
			hex_6_external_connection_export                       : out   std_logic_vector(6 downto 0);                     -- export
			hex_7_external_connection_export                       : out   std_logic_vector(6 downto 0);                     -- export
			key_external_connection_export                         : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			ledg_export                                            : out   std_logic_vector(7 downto 0);                     -- export
			ledr_export                                            : out   std_logic_vector(17 downto 0);                    -- export
			nios2_a_avalon_aes_interface_0_export_data_export_data : out   std_logic_vector(31 downto 0);                    -- export_data
			nios2_b_ring_oscillator_0_conduit_export_export_data   : out   std_logic_vector(31 downto 0);                    -- export_data
			nios_sys_sdram_pll_0_sdram_clk_clk                     : out   std_logic;                                        -- clk
			reset_reset_n                                          : in    std_logic                     := 'X';             -- reset_n
			sdram_addr                                             : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_ba                                               : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_cas_n                                            : out   std_logic;                                        -- cas_n
			sdram_cke                                              : out   std_logic;                                        -- cke
			sdram_cs_n                                             : out   std_logic;                                        -- cs_n
			sdram_dq                                               : inout std_logic_vector(31 downto 0) := (others => 'X'); -- dq
			sdram_dqm                                              : out   std_logic_vector(3 downto 0);                     -- dqm
			sdram_ras_n                                            : out   std_logic;                                        -- ras_n
			sdram_we_n                                             : out   std_logic;                                        -- we_n
			switches_external_connection_export                    : in    std_logic_vector(17 downto 0) := (others => 'X')  -- export
		);
	end component unsaved;

	u0 : component unsaved
		port map (
			clk_clk                                                => CONNECTED_TO_clk_clk,                                                --                                        clk.clk
			hex_0_external_connection_export                       => CONNECTED_TO_hex_0_external_connection_export,                       --                  hex_0_external_connection.export
			hex_1_external_connection_export                       => CONNECTED_TO_hex_1_external_connection_export,                       --                  hex_1_external_connection.export
			hex_2_external_connection_export                       => CONNECTED_TO_hex_2_external_connection_export,                       --                  hex_2_external_connection.export
			hex_3_external_connection_export                       => CONNECTED_TO_hex_3_external_connection_export,                       --                  hex_3_external_connection.export
			hex_4_external_connection_export                       => CONNECTED_TO_hex_4_external_connection_export,                       --                  hex_4_external_connection.export
			hex_5_external_connection_export                       => CONNECTED_TO_hex_5_external_connection_export,                       --                  hex_5_external_connection.export
			hex_6_external_connection_export                       => CONNECTED_TO_hex_6_external_connection_export,                       --                  hex_6_external_connection.export
			hex_7_external_connection_export                       => CONNECTED_TO_hex_7_external_connection_export,                       --                  hex_7_external_connection.export
			key_external_connection_export                         => CONNECTED_TO_key_external_connection_export,                         --                    key_external_connection.export
			ledg_export                                            => CONNECTED_TO_ledg_export,                                            --                                       ledg.export
			ledr_export                                            => CONNECTED_TO_ledr_export,                                            --                                       ledr.export
			nios2_a_avalon_aes_interface_0_export_data_export_data => CONNECTED_TO_nios2_a_avalon_aes_interface_0_export_data_export_data, -- nios2_a_avalon_aes_interface_0_export_data.export_data
			nios2_b_ring_oscillator_0_conduit_export_export_data   => CONNECTED_TO_nios2_b_ring_oscillator_0_conduit_export_export_data,   --   nios2_b_ring_oscillator_0_conduit_export.export_data
			nios_sys_sdram_pll_0_sdram_clk_clk                     => CONNECTED_TO_nios_sys_sdram_pll_0_sdram_clk_clk,                     --             nios_sys_sdram_pll_0_sdram_clk.clk
			reset_reset_n                                          => CONNECTED_TO_reset_reset_n,                                          --                                      reset.reset_n
			sdram_addr                                             => CONNECTED_TO_sdram_addr,                                             --                                      sdram.addr
			sdram_ba                                               => CONNECTED_TO_sdram_ba,                                               --                                           .ba
			sdram_cas_n                                            => CONNECTED_TO_sdram_cas_n,                                            --                                           .cas_n
			sdram_cke                                              => CONNECTED_TO_sdram_cke,                                              --                                           .cke
			sdram_cs_n                                             => CONNECTED_TO_sdram_cs_n,                                             --                                           .cs_n
			sdram_dq                                               => CONNECTED_TO_sdram_dq,                                               --                                           .dq
			sdram_dqm                                              => CONNECTED_TO_sdram_dqm,                                              --                                           .dqm
			sdram_ras_n                                            => CONNECTED_TO_sdram_ras_n,                                            --                                           .ras_n
			sdram_we_n                                             => CONNECTED_TO_sdram_we_n,                                             --                                           .we_n
			switches_external_connection_export                    => CONNECTED_TO_switches_external_connection_export                     --               switches_external_connection.export
		);

