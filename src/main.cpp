// Copyright 2020 <Christian Maniewski>

#include <stm32f3xx_hal.h>
#include <string.h>

#include "./uart_debug.h"

int main(void) {
  HAL_Init();

  HUART1_Init();

  char msg[20] = "Hello world";

  while (1) {
    HAL_UART_Transmit(&huart1, reinterpret_cast<uint8_t*>(msg), strlen(msg),
                      HAL_MAX_DELAY);
    HAL_Delay(1000);
  }
}

extern "C" {
void SysTick_Handler(void) { HAL_IncTick(); }
}
