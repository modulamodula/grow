// Copyright 2020 Christian Maniewski.
//
// Simple metronome, running a tick interval for a given BPM

#include "drivers/tim_metronome.h"
#include <math.h>
#include <stm32l4xx_hal.h>

// @TODO this could be defined somewhere else (config file?)
#define TIMER_CLOCK_FREQUENCY 40000000U
#define DEFAULT_BPM 120

TIM_HandleTypeDef htim2;

MetronomeTimerClass::MetronomeTimerClass() = default;

void MetronomeTimerClass::Init() {
  __HAL_RCC_TIM2_CLK_ENABLE();
  htim2.Instance = TIM2;
  htim2.Init.Prescaler = 0;
  // Start with the default bpm value
  // In this configuration it can be max 1.8μs per day off
  htim2.Init.Period = round(60U * TIMER_CLOCK_FREQUENCY / DEFAULT_BPM) - 1;
  htim2.Init.CounterMode = TIM_COUNTERMODE_UP;

  HAL_NVIC_SetPriority(TIM2_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(TIM2_IRQn);

  HAL_TIM_Base_Init(&htim2);
  HAL_TIM_Base_Start_IT(&htim2);
}

void MetronomeTimerClass::SetBPM(uint16_t bpm) {
  bpm_ = bpm < 20 ? 20 : bpm;
  uint32_t period = round(60U * TIMER_CLOCK_FREQUENCY / bpm_) - 1;
  TIM2->ARR = period;
}

void MetronomeTimerClass::SetTick() { tick_ = true; }

bool MetronomeTimerClass::Tick() {
  if (tick_) {
    tick_ = false;
    return true;
  }
  return false;
}

MetronomeTimerClass MetronomeTimer;
