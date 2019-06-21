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
#include "system.h"
#include <altera_avalon_pio_regs.h>
#include <time.h>
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

int main()
{
  printf("Start of the program !!!!\n");


  while(1) {

	  read_adc_test(ch7_on, ch7_off);

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
