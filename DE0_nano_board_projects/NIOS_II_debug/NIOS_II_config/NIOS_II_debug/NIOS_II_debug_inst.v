	NIOS_II_debug u0 (
		.clk_clk                                              (<connected-to-clk_clk>),                                              //                                           clk.clk
		.pi_adc_channel_data_valid_external_connection_export (<connected-to-pi_adc_channel_data_valid_external_connection_export>), // pi_adc_channel_data_valid_external_connection.export
		.pi_adc_data_external_connection_export               (<connected-to-pi_adc_data_external_connection_export>),               //               pi_adc_data_external_connection.export
		.po_adc_cmd_external_connection_export                (<connected-to-po_adc_cmd_external_connection_export>),                //                po_adc_cmd_external_connection.export
		.reset_reset_n                                        (<connected-to-reset_reset_n>)                                         //                                         reset.reset_n
	);

