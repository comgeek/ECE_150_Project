#include <stdio.h>
#include "system.h"
#include <unistd.h>
#include "altera_avalon_pio_regs.h"
#include "sys/alt_irq.h"

void delay(int number_of_seconds)
{
    // Converting time into milli_seconds
    int milli_seconds = 1000 * number_of_seconds;

    // Storing start time
    clock_t start_time = clock();

    // looping till required time is not achieved
    while (clock() < start_time + milli_seconds)
        ;
}

int main()
{
	while(1)
	{
  printf("Hello from Nios first!\n");
  delay(5);
	}
  return 0;
}
