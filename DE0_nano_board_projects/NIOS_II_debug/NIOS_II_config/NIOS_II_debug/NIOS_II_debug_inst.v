	NIOS_II_debug u0 (
		.clk_clk                                              (<connected-to-clk_clk>),                                              //                                           clk.clk
		.pi_adc_channel_data_valid_external_connection_export (<connected-to-pi_adc_channel_data_valid_external_connection_export>), // pi_adc_channel_data_valid_external_connection.export
		.pi_adc_data_external_connection_export               (<connected-to-pi_adc_data_external_connection_export>),               //               pi_adc_data_external_connection.export
		.po_adc_cmd_external_connection_export                (<connected-to-po_adc_cmd_external_connection_export>),                //                po_adc_cmd_external_connection.export
		.uart_mng_nios_external_connection_in_port            (<connected-to-uart_mng_nios_external_connection_in_port>),            //             uart_mng_nios_external_connection.in_port
		.uart_mng_nios_external_connection_out_port           (<connected-to-uart_mng_nios_external_connection_out_port>),           //                                              .out_port
		.uart_nios_external_connection_rxd                    (<connected-to-uart_nios_external_connection_rxd>),                    //                 uart_nios_external_connection.rxd
		.uart_nios_external_connection_txd                    (<connected-to-uart_nios_external_connection_txd>),                    //                                              .txd
		.uart_tx_rx_cmd_external_connection_in_port           (<connected-to-uart_tx_rx_cmd_external_connection_in_port>),           //            uart_tx_rx_cmd_external_connection.in_port
		.uart_tx_rx_cmd_external_connection_out_port          (<connected-to-uart_tx_rx_cmd_external_connection_out_port>),          //                                              .out_port
		.reset_reset_n                                        (<connected-to-reset_reset_n>),                                        //                                         reset.reset_n
		.pio_eeprom_ctrl_external_connection_in_port          (<connected-to-pio_eeprom_ctrl_external_connection_in_port>),          //           pio_eeprom_ctrl_external_connection.in_port
		.pio_eeprom_ctrl_external_connection_out_port         (<connected-to-pio_eeprom_ctrl_external_connection_out_port>)          //                                              .out_port
	);

