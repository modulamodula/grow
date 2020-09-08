// Copyright 2020 <Christian Maniewski>

#include <stm32f3xx_hal.h>
#include <string.h>
#include "./drivers/led.h"
#include "./drivers/uart_debug.h"
#include "./metronome.h"

// @TODO these have to be in main. Find out why
TIM_HandleTypeDef htim2;
DMA_HandleTypeDef hdma_tim2_up;

// Default clock config, generated with STM32CubeMX
void SystemClock_Config() {
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};

  /** Initializes the CPU, AHB and APB busses clocks
   */
  RCC_OscInitStruct.OscillatorType =
      RCC_OSCILLATORTYPE_HSI | RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_BYPASS;
  RCC_OscInitStruct.HSEPredivValue = RCC_HSE_PREDIV_DIV1;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL6;
  HAL_RCC_OscConfig(&RCC_OscInitStruct);
  /** Initializes the CPU, AHB and APB busses clocks
   */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_SYSCLK |
                                RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_1);
  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_USB | RCC_PERIPHCLK_I2C1;
  PeriphClkInit.I2c1ClockSelection = RCC_I2C1CLKSOURCE_HSI;
  PeriphClkInit.USBClockSelection = RCC_USBCLKSOURCE_PLL;
  HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit);
}

int main() {
  HAL_Init();
  SystemClock_Config();
  HUART1_Init();

  Metronome.Init();
  LED.Init();

  char msg[20] = "Hello world";

  // @TODO this is not acutally correct. We are in LOW the same time as we are
  // in high, resulting in about half the time per cycle
  // We probably need some sort of PWM or something to sort this out
  Metronome.SetBPM(30);

  while (1) {
    if (Metronome.Tick()) {
      /* HAL_UART_Transmit(&huart1, reinterpret_cast<uint8_t*>(msg), strlen(msg), */
                        /* HAL_MAX_DELAY); */
      char str[5];
      sprintf(str, "%d", GPIOE->ODR);
      HAL_UART_Transmit(&huart1, reinterpret_cast<uint8_t*>(str), strlen(str),
                        HAL_MAX_DELAY);
    }
  }
}

extern "C" {
void SysTick_Handler(void) { HAL_IncTick(); }
}
