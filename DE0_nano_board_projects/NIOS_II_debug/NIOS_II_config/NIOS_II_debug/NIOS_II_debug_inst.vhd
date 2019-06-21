	component NIOS_II_debug is
		port (
			clk_clk                                              : in  std_logic                     := 'X';             -- clk
			pi_adc_channel_data_valid_external_connection_export : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			pi_adc_data_external_connection_export               : in  std_logic_vector(11 downto 0) := (others => 'X'); -- export
			po_adc_cmd_external_connection_export                : out std_logic_vector(3 downto 0);                     -- export
			reset_reset_n                                        : in  std_logic                     := 'X'              -- reset_n
		);
	end component NIOS_II_debug;

	u0 : component NIOS_II_debug
		port map (
			clk_clk                                              => CONNECTED_TO_clk_clk,                                              --                                           clk.clk
			pi_adc_channel_data_valid_external_connection_export => CONNECTED_TO_pi_adc_channel_data_valid_external_connection_export, -- pi_adc_channel_data_valid_external_connection.export
			pi_adc_data_external_connection_export               => CONNECTED_TO_pi_adc_data_external_connection_export,               --               pi_adc_data_external_connection.export
			po_adc_cmd_external_connection_export                => CONNECTED_TO_po_adc_cmd_external_connection_export,                --                po_adc_cmd_external_connection.export
			reset_reset_n                                        => CONNECTED_TO_reset_reset_n                                         --                                         reset.reset_n
		);

