
module NIOS_II_debug (
	clk_clk,
	pi_adc_channel_data_valid_external_connection_export,
	pi_adc_data_external_connection_export,
	po_adc_cmd_external_connection_export,
	reset_reset_n);	

	input		clk_clk;
	input	[3:0]	pi_adc_channel_data_valid_external_connection_export;
	input	[11:0]	pi_adc_data_external_connection_export;
	output	[3:0]	po_adc_cmd_external_connection_export;
	input		reset_reset_n;
endmodule
