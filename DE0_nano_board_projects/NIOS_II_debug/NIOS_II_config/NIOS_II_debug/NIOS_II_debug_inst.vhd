	component NIOS_II_debug is
		port (
			clk_clk                                    : in  std_logic                     := 'X';             -- clk
			reset_reset_n                              : in  std_logic                     := 'X';             -- reset_n
			pio_adc_cmd_external_connection_export     : out std_logic_vector(3 downto 0);                     -- export
			pio_uart_data_external_connection_export   : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			pio_adc_data_external_connection_export    : in  std_logic_vector(11 downto 0) := (others => 'X'); -- export
			pio_adc_channel_external_connection_export : in  std_logic_vector(2 downto 0)  := (others => 'X')  -- export
		);
	end component NIOS_II_debug;

	u0 : component NIOS_II_debug
		port map (
			clk_clk                                    => CONNECTED_TO_clk_clk,                                    --                                 clk.clk
			reset_reset_n                              => CONNECTED_TO_reset_reset_n,                              --                               reset.reset_n
			pio_adc_cmd_external_connection_export     => CONNECTED_TO_pio_adc_cmd_external_connection_export,     --     pio_adc_cmd_external_connection.export
			pio_uart_data_external_connection_export   => CONNECTED_TO_pio_uart_data_external_connection_export,   --   pio_uart_data_external_connection.export
			pio_adc_data_external_connection_export    => CONNECTED_TO_pio_adc_data_external_connection_export,    --    pio_adc_data_external_connection.export
			pio_adc_channel_external_connection_export => CONNECTED_TO_pio_adc_channel_external_connection_export  -- pio_adc_channel_external_connection.export
		);

