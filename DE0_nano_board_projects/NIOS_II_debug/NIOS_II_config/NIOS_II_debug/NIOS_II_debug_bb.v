
module NIOS_II_debug (
	clk_clk,
	reset_reset_n,
	pio_adc_cmd_external_connection_export,
	pio_uart_data_external_connection_export,
	pio_adc_data_external_connection_export,
	pio_adc_channel_external_connection_export);	

	input		clk_clk;
	input		reset_reset_n;
	output	[3:0]	pio_adc_cmd_external_connection_export;
	input	[7:0]	pio_uart_data_external_connection_export;
	input	[11:0]	pio_adc_data_external_connection_export;
	input	[2:0]	pio_adc_channel_external_connection_export;
endmodule
