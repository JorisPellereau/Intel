
module NIOS_II_debug (
	clk_clk,
	pi_adc_channel_data_valid_external_connection_export,
	pi_adc_data_external_connection_export,
	po_adc_cmd_external_connection_export,
	uart_mng_nios_external_connection_in_port,
	uart_mng_nios_external_connection_out_port,
	uart_nios_external_connection_rxd,
	uart_nios_external_connection_txd,
	uart_tx_rx_cmd_external_connection_in_port,
	uart_tx_rx_cmd_external_connection_out_port,
	reset_reset_n,
	pio_eeprom_ctrl_external_connection_in_port,
	pio_eeprom_ctrl_external_connection_out_port);	

	input		clk_clk;
	input	[3:0]	pi_adc_channel_data_valid_external_connection_export;
	input	[11:0]	pi_adc_data_external_connection_export;
	output	[3:0]	po_adc_cmd_external_connection_export;
	input	[7:0]	uart_mng_nios_external_connection_in_port;
	output	[7:0]	uart_mng_nios_external_connection_out_port;
	input		uart_nios_external_connection_rxd;
	output		uart_nios_external_connection_txd;
	input	[2:0]	uart_tx_rx_cmd_external_connection_in_port;
	output	[2:0]	uart_tx_rx_cmd_external_connection_out_port;
	input		reset_reset_n;
	input	[10:0]	pio_eeprom_ctrl_external_connection_in_port;
	output	[10:0]	pio_eeprom_ctrl_external_connection_out_port;
endmodule
