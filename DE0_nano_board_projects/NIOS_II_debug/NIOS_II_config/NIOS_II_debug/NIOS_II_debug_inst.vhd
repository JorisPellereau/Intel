	component NIOS_II_debug is
		port (
			clk_clk                                              : in  std_logic                     := 'X';             -- clk
			pi_adc_channel_data_valid_external_connection_export : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			pi_adc_data_external_connection_export               : in  std_logic_vector(11 downto 0) := (others => 'X'); -- export
			po_adc_cmd_external_connection_export                : out std_logic_vector(3 downto 0);                     -- export
			reset_reset_n                                        : in  std_logic                     := 'X';             -- reset_n
			uart_mng_nios_external_connection_in_port            : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- in_port
			uart_mng_nios_external_connection_out_port           : out std_logic_vector(7 downto 0);                     -- out_port
			uart_nios_external_connection_rxd                    : in  std_logic                     := 'X';             -- rxd
			uart_nios_external_connection_txd                    : out std_logic;                                        -- txd
			uart_tx_rx_cmd_external_connection_in_port           : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- in_port
			uart_tx_rx_cmd_external_connection_out_port          : out std_logic_vector(2 downto 0)                      -- out_port
		);
	end component NIOS_II_debug;

	u0 : component NIOS_II_debug
		port map (
			clk_clk                                              => CONNECTED_TO_clk_clk,                                              --                                           clk.clk
			pi_adc_channel_data_valid_external_connection_export => CONNECTED_TO_pi_adc_channel_data_valid_external_connection_export, -- pi_adc_channel_data_valid_external_connection.export
			pi_adc_data_external_connection_export               => CONNECTED_TO_pi_adc_data_external_connection_export,               --               pi_adc_data_external_connection.export
			po_adc_cmd_external_connection_export                => CONNECTED_TO_po_adc_cmd_external_connection_export,                --                po_adc_cmd_external_connection.export
			reset_reset_n                                        => CONNECTED_TO_reset_reset_n,                                        --                                         reset.reset_n
			uart_mng_nios_external_connection_in_port            => CONNECTED_TO_uart_mng_nios_external_connection_in_port,            --             uart_mng_nios_external_connection.in_port
			uart_mng_nios_external_connection_out_port           => CONNECTED_TO_uart_mng_nios_external_connection_out_port,           --                                              .out_port
			uart_nios_external_connection_rxd                    => CONNECTED_TO_uart_nios_external_connection_rxd,                    --                 uart_nios_external_connection.rxd
			uart_nios_external_connection_txd                    => CONNECTED_TO_uart_nios_external_connection_txd,                    --                                              .txd
			uart_tx_rx_cmd_external_connection_in_port           => CONNECTED_TO_uart_tx_rx_cmd_external_connection_in_port,           --            uart_tx_rx_cmd_external_connection.in_port
			uart_tx_rx_cmd_external_connection_out_port          => CONNECTED_TO_uart_tx_rx_cmd_external_connection_out_port           --                                              .out_port
		);

