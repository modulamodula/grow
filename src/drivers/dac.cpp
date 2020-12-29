// Copyright 2020 Christian Maniewski <code@chmanie.com>

#include <drivers/dac.h>
#include <math.h>
#include <stm32l4xx_hal.h>

SPI_HandleTypeDef hspi2;

DACClass::DACClass() = default;

void DACClass::Init() {
  hspi2.Instance = SPI2;
  hspi2.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_256;
  hspi2.Init.Direction = SPI_DIRECTION_2LINES;
  hspi2.Init.CLKPhase = SPI_PHASE_1EDGE;
  hspi2.Init.CLKPolarity = SPI_POLARITY_LOW;
  hspi2.Init.CRCCalculation = SPI_CRCCALCULATION_DISABLE;
  hspi2.Init.DataSize = SPI_DATASIZE_8BIT;
  hspi2.Init.FirstBit = SPI_FIRSTBIT_MSB;
  hspi2.Init.NSS = SPI_NSS_SOFT;
  hspi2.Init.TIMode = SPI_TIMODE_DISABLE;
  hspi2.Init.Mode = SPI_MODE_MASTER;

  HAL_SPI_Init(&hspi2);

  HAL_GPIO_WritePin(GPIOB, PIN_SPI2_CS, GPIO_PIN_SET);

  // Enable the internal voltage reference
  command_[0] = 0b00111000;
  command_[1] = 0;
  command_[2] = 1;
  HAL_GPIO_WritePin(GPIOB, PIN_SPI2_CS, GPIO_PIN_RESET);
  HAL_SPI_Transmit_IT(&hspi2, command_, 3);
}

// @TODO make this take an actual voltage e.g. 8000 for 8V
void DACClass::SetVoltage(uint8_t channel, uint16_t voltage) {
  // We only have two channels
  if (channel > 1) {
    channel = 1;
  }
  /* @TODO do we need a `ready` flag? */
  /* Write to buffer with data and load DAC (selected by DB17 and DB18) */
  // @TODO it is very unclear to me why it has to be binary. See logic analyzer
  /**
   * Channel select
   * a 0b00010000
   * b 0b00010010
   * c 0b00010100
   * d 0b00010110
   */
  command_[0] = 0b00011000 | channel;
  // Upper 8 bits
  command_[1] = voltage >> 8;
  // Lower 8 bits
  command_[2] = voltage & 0xff;
  // @TODO interrupt handlers!

  HAL_GPIO_WritePin(GPIOB, PIN_SPI2_CS, GPIO_PIN_RESET);
  HAL_SPI_Transmit_IT(&hspi2, command_, 3);
}

DACClass _DAC;
