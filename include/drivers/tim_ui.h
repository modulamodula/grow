// Copyright 2020 Christian Maniewski.

#ifndef DRIVERS_TIM_UI_H
#define DRIVERS_TIM_UI_H

#include <stm32l4xx_hal.h>

class UITimerClass {
 private:
  bool tick_;

 public:
  UITimerClass();
  void Init();
  void SetTick();
  bool Tick();
};

extern UITimerClass UITimer;

#endif  // DRIVERS_TIM_UI_H
