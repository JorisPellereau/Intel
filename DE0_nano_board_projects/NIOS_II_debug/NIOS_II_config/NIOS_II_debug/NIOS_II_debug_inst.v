	NIOS_II_debug u0 (
		.clk_clk                                    (<connected-to-clk_clk>),                                    //                                 clk.clk
		.reset_reset_n                              (<connected-to-reset_reset_n>),                              //                               reset.reset_n
		.pio_adc_cmd_external_connection_export     (<connected-to-pio_adc_cmd_external_connection_export>),     //     pio_adc_cmd_external_connection.export
		.pio_uart_data_external_connection_export   (<connected-to-pio_uart_data_external_connection_export>),   //   pio_uart_data_external_connection.export
		.pio_adc_data_external_connection_export    (<connected-to-pio_adc_data_external_connection_export>),    //    pio_adc_data_external_connection.export
		.pio_adc_channel_external_connection_export (<connected-to-pio_adc_channel_external_connection_export>)  // pio_adc_channel_external_connection.export
	);

