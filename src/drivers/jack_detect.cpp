// Copyright 2020 Christian Maniewski.
//
// Detect whether a jack is plugged in
// Sends a pattern into all of the jacks' switch pin,
// then measures whether the pattern is visible in he output
// Losely based on the "normalization probe" used in MI modules
// e.g. https://github.com/pichenettes/eurorack/blob/a8089ae4cc308b38c3bbc0033e133edd2e7eca79/plaits/ui.cc#L368

#include "drivers/jack_detect.h"
#include <stm32l4xx_hal.h>

#define PORT_JACK_DETECT GPIOB
#define PIN_JACK_DETECT GPIO_PIN_11

JackDetectClass::JackDetectClass() {
  for (uint8_t i = 0; i < INPUT_JACK_LAST; i++) {
    jackStates_[i].errors = 0;
    jackStates_[i].pluggedIn = false;
  }
}

void JackDetectClass::Init() {
  GPIO_InitTypeDef gpio = {0};

  __HAL_RCC_GPIOB_CLK_ENABLE();

  gpio.Pin = PIN_JACK_DETECT;
  gpio.Mode = GPIO_MODE_OUTPUT_PP;
  gpio.Pull = GPIO_NOPULL;
  gpio.Speed = GPIO_SPEED_FREQ_HIGH;
  HAL_GPIO_Init(PORT_JACK_DETECT, &gpio);
}

void JackDetectClass::Next(const bool values[INPUT_JACK_LAST]) {
  if (isCalibrating_) {
    return;
  }
  for (uint8_t i = 0; i < INPUT_JACK_LAST; i++) {
    if (values[i] != detectState_) {
      jackStates_[i].errors++;
    }
    if (detectBit_ < 31) {
      detectBit_++;
    } else {
      // check how many errors we had
      jackStates_[i].pluggedIn = jackStates_[i].errors > 3;
      detectBit_ = 0;
      jackStates_[i].errors = 0;
    }
  }
  // Get next detection bit from pattern
  detectState_ = (bool)((pattern_ & (1 << detectBit_)) >> detectBit_);
  // @TODO do we really want to write the GPIO in the callback?
  HAL_GPIO_WritePin(PORT_JACK_DETECT, PIN_JACK_DETECT,
                    detectState_ ? GPIO_PIN_SET : GPIO_PIN_RESET);
};

bool JackDetectClass::IsPluggedIn(InputJack jack) {
  return jackStates_[jack].pluggedIn;
};

void JackDetectClass::ToggleCalibration() {
  isCalibrating_ = !isCalibrating_;
  if (isCalibrating_) {
    // Pull down the pin to ground to be able to measure 0V offset
    HAL_GPIO_WritePin(PORT_JACK_DETECT, PIN_JACK_DETECT, GPIO_PIN_RESET);
  }
}

JackDetectClass JackDetect;
