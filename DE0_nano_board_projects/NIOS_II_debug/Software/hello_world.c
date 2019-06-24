/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

#include <stdio.h>
#include <altera_avalon_pio_regs.h>
#include <altera_avalon_uart_regs.h>
#include <altera_avalon_uart.h>
#include <time.h>
#include <sys/alt_irq.h>
#include <priv/alt_legacy_irq.h>
#include "system.h"
#include "unistd.h"

// -- ADC channels
#define ch0_off 0x0
#define ch0_on 0x8
#define ch1_off 0x1
#define ch1_on 0x9
#define ch2_off 0x2
#define ch2_on 0xA
#define ch3_off 0x3
#define ch3_on 0xB
#define ch4_off 0x4
#define ch4_on 0xC
#define ch5_off 0x5
#define ch5_on 0xD
#define ch6_off 0x6
#define ch6_on 0xE
#define ch7_off 0x7
#define ch7_on 0xF
// -------------

void read_adc_test(char chx_on, char chx_off);
void test_tx_uart(char data);

// ISR for the uart
void nios_rx_uart_isr(void* context, alt_u32 interrupt_number);


int main()
{
	// Var local
	int divider_uart;
     void* ptr;
	 char i;
	 i = 0;
	divider_uart = 0;

	ptr = (void *)&i;




	// INIT NIOS UART
	divider_uart = IORD_ALTERA_AVALON_UART_DIVISOR(UART_NIOS_BASE);
	printf("NIOS UART DIVIDER avant init : %d \n", divider_uart);
	IOWR_ALTERA_AVALON_UART_DIVISOR(UART_MNG_NIOS_BASE, 5208);
	divider_uart = IORD_ALTERA_AVALON_UART_DIVISOR(UART_NIOS_BASE);
	printf("NIOS UART DIVIDER apres init : %d \n", divider_uart);

	//IORD_ALTERA_AVALON_UART_CONTROL(UART_MNG_NIOS_BASE);
	printf("Set IT for read data \n");
	IOWR_ALTERA_AVALON_UART_CONTROL(UART_NIOS_BASE, ALTERA_AVALON_UART_CONTROL_RRDY_MSK);

	printf("UART CONTROL REG : %d \n \n",IORD_ALTERA_AVALON_UART_CONTROL(UART_NIOS_BASE));


	// INIT irq
	//alt_irq_disable_all();
	alt_irq_register(UART_NIOS_IRQ , ptr , nios_rx_uart_isr); // 2 : num IT
	alt_irq_enable(UART_NIOS_IRQ);


    printf("Start of the program !!!!\n");



  while(1) {

	  //read_adc_test(ch7_on, ch7_off);


	  if(i == 255) {
		  i = 0;
	  }
	  else {
		  test_tx_uart(i);
	  }


  }


  return 0;
}

/*
 * Start a single ADC transaction, Display the convertion of the
 * desired channel in the console
 */
void read_adc_test(char chx_on, char chx_off) {
	int  adc_data;
	char adc_channel;

	adc_channel = 0;
	adc_data = 0;
	IOWR_ALTERA_AVALON_PIO_DATA(PO_ADC_CMD_BASE, chx_on);  // Enables = 1, channel 0
	IOWR_ALTERA_AVALON_PIO_DATA(PO_ADC_CMD_BASE, chx_off); // Enables = 0, channel 0

	// If data_valid is set
	if( (IORD_ALTERA_AVALON_PIO_DATA(PI_ADC_CHANNEL_DATA_VALID_BASE) & 0x8) != 0x8) {
	 adc_data    = IORD_ALTERA_AVALON_PIO_DATA(PI_ADC_DATA_BASE);
	 adc_channel = IORD_ALTERA_AVALON_PIO_DATA(PI_ADC_CHANNEL_DATA_VALID_BASE) & 0x7;
	 printf("adc_data : %x - channel : %d \n", adc_data, adc_channel);
	}
	usleep(10000);

}

/*
 *
 *
 */
void test_tx_uart(char tx_data) {


	// Set the data to send

	// Wait for the module done
	if( (IORD_ALTERA_AVALON_PIO_DATA(UART_TX_RX_CMD_BASE) & 0x04) == 0x04) {
		printf("Module TX_uart ready \n");
		// Start a frame
		IOWR_ALTERA_AVALON_PIO_DATA(UART_TX_RX_CMD_BASE, 0x1);
		IOWR_ALTERA_AVALON_PIO_DATA(UART_TX_RX_CMD_BASE, 0x0);
	}
	else {
		IOWR_ALTERA_AVALON_PIO_DATA(UART_TX_RX_CMD_BASE, 0x0);
		printf("Module TX_uart busy \n");
	}

	//while((IORD_ALTERA_AVALON_UART_STATUS(UART_NIOS_BASE) & ALTERA_AVALON_UART_STATUS_RRDY_MSK) != ALTERA_AVALON_UART_STATUS_RRDY_MSK);
	//printf("data_received : %x \n", IORD_ALTERA_AVALON_UART_RXDATA(UART_NIOS_BASE));
	usleep(10000);
	printf("\n\n");

}


void nios_rx_uart_isr(void* context, alt_u32 interrupt_number)
{
	char *i;
    i = (char *)context;
    *i += 1;


	printf("UART CONTROL REG : %d \n \n",IORD_ALTERA_AVALON_UART_CONTROL(UART_NIOS_BASE));
	printf("data_received : %x \n", IORD_ALTERA_AVALON_UART_RXDATA(UART_NIOS_BASE));
	printf("NIOS UART read data available !!! \n\n\n");
	IOWR_ALTERA_AVALON_PIO_DATA(UART_MNG_NIOS_BASE, *i);
}
