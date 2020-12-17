EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 9
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:LED_Dual_CAC D?
U 1 1 5FDF6EDC
P 3150 2350
F 0 "D?" H 3150 2775 50  0000 C CNN
F 1 "LED_Dual_CAC" H 3150 2684 50  0000 C CNN
F 2 "" H 3200 2350 50  0001 C CNN
F 3 "~" H 3200 2350 50  0001 C CNN
	1    3150 2350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0156
U 1 1 5FDF76D3
P 2650 2350
F 0 "#PWR0156" H 2650 2200 50  0001 C CNN
F 1 "+5V" V 2665 2478 50  0000 L CNN
F 2 "" H 2650 2350 50  0001 C CNN
F 3 "" H 2650 2350 50  0001 C CNN
	1    2650 2350
	0    -1   -1   0   
$EndComp
$Comp
L TLC59482DBQ:TLC59482DBQ IC?
U 1 1 5FDF9F1D
P 5250 3200
F 0 "IC?" H 5850 3465 50  0000 C CNN
F 1 "TLC59482DBQ" H 5850 3374 50  0000 C CNN
F 2 "SOP64P600X175-24N" H 6300 3300 50  0001 L CNN
F 3 "http://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=tlc59482&fileType=pdf" H 6300 3200 50  0001 L CNN
F 4 "LED Display Drivers 16-Channel, 16-Bit PWM LED Driver with 6-Bit Global Brightness 24-SSOP -40 to 85" H 6300 3100 50  0001 L CNN "Description"
F 5 "1.75" H 6300 3000 50  0001 L CNN "Height"
F 6 "Texas Instruments" H 6300 2900 50  0001 L CNN "Manufacturer_Name"
F 7 "TLC59482DBQ" H 6300 2800 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "TLC59482DBQ" H 6300 2700 50  0001 L CNN "Arrow Part Number"
F 9 "https://www.arrow.com/en/products/tlc59482dbq/texas-instruments" H 6300 2600 50  0001 L CNN "Arrow Price/Stock"
F 10 "595-TLC59482DBQ" H 6300 2500 50  0001 L CNN "Mouser Part Number"
F 11 "https://www.mouser.com/Search/Refine.aspx?Keyword=595-TLC59482DBQ" H 6300 2400 50  0001 L CNN "Mouser Price/Stock"
	1    5250 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0157
U 1 1 5FDFDAF0
P 4850 3200
F 0 "#PWR0157" H 4850 2950 50  0001 C CNN
F 1 "GND" V 4855 3072 50  0000 R CNN
F 2 "" H 4850 3200 50  0001 C CNN
F 3 "" H 4850 3200 50  0001 C CNN
	1    4850 3200
	0    1    1    0   
$EndComp
Text HLabel 5250 3300 0    50   Input ~ 0
led_sin
Wire Wire Line
	4850 3200 5250 3200
Text HLabel 5250 3400 0    50   Input ~ 0
led_clk
Text HLabel 5250 3500 0    50   Input ~ 0
led_lat
Text HLabel 6450 3500 2    50   Input ~ 0
led_gsclk
$Comp
L power:+3V3 #PWR0158
U 1 1 5FDFE8DD
P 6450 2900
F 0 "#PWR0158" H 6450 2750 50  0001 C CNN
F 1 "+3V3" H 6465 3073 50  0000 C CNN
F 2 "" H 6450 2900 50  0001 C CNN
F 3 "" H 6450 2900 50  0001 C CNN
	1    6450 2900
	1    0    0    -1  
$EndComp
NoConn ~ 6450 3400
$Comp
L Device:R R?
U 1 1 5FDFFA3D
P 6750 3300
F 0 "R?" V 6543 3300 50  0000 C CNN
F 1 "2k" V 6634 3300 50  0000 C CNN
F 2 "" V 6680 3300 50  0001 C CNN
F 3 "~" H 6750 3300 50  0001 C CNN
	1    6750 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	6450 3200 6450 2900
$Comp
L power:GND #PWR0159
U 1 1 5FE04150
P 7050 3300
F 0 "#PWR0159" H 7050 3050 50  0001 C CNN
F 1 "GND" V 7055 3172 50  0000 R CNN
F 2 "" H 7050 3300 50  0001 C CNN
F 3 "" H 7050 3300 50  0001 C CNN
	1    7050 3300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2650 2350 2850 2350
$Comp
L Device:LED_Dual_CAC D?
U 1 1 5FE11CB2
P 3150 3250
F 0 "D?" H 3150 3675 50  0000 C CNN
F 1 "LED_Dual_CAC" H 3150 3584 50  0000 C CNN
F 2 "" H 3200 3250 50  0001 C CNN
F 3 "~" H 3200 3250 50  0001 C CNN
	1    3150 3250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0160
U 1 1 5FE11CB8
P 2650 3250
F 0 "#PWR0160" H 2650 3100 50  0001 C CNN
F 1 "+5V" V 2665 3378 50  0000 L CNN
F 2 "" H 2650 3250 50  0001 C CNN
F 3 "" H 2650 3250 50  0001 C CNN
	1    2650 3250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2650 3250 2850 3250
$Comp
L Device:LED_Dual_CAC D?
U 1 1 5FE125CF
P 3150 4150
F 0 "D?" H 3150 4575 50  0000 C CNN
F 1 "LED_Dual_CAC" H 3150 4484 50  0000 C CNN
F 2 "" H 3200 4150 50  0001 C CNN
F 3 "~" H 3200 4150 50  0001 C CNN
	1    3150 4150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0161
U 1 1 5FE125D5
P 2650 4150
F 0 "#PWR0161" H 2650 4000 50  0001 C CNN
F 1 "+5V" V 2665 4278 50  0000 L CNN
F 2 "" H 2650 4150 50  0001 C CNN
F 3 "" H 2650 4150 50  0001 C CNN
	1    2650 4150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2650 4150 2850 4150
$Comp
L Device:LED_Dual_CAC D?
U 1 1 5FE12F3F
P 3150 5100
F 0 "D?" H 3150 5525 50  0000 C CNN
F 1 "LED_Dual_CAC" H 3150 5434 50  0000 C CNN
F 2 "" H 3200 5100 50  0001 C CNN
F 3 "~" H 3200 5100 50  0001 C CNN
	1    3150 5100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0162
U 1 1 5FE12F45
P 2650 5100
F 0 "#PWR0162" H 2650 4950 50  0001 C CNN
F 1 "+5V" V 2665 5228 50  0000 L CNN
F 2 "" H 2650 5100 50  0001 C CNN
F 3 "" H 2650 5100 50  0001 C CNN
	1    2650 5100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2650 5100 2850 5100
$Comp
L Device:LED_Dual_CAC D?
U 1 1 5FE2E978
P 8750 5100
F 0 "D?" H 8750 5525 50  0000 C CNN
F 1 "LED_Dual_CAC" H 8750 5434 50  0000 C CNN
F 2 "" H 8800 5100 50  0001 C CNN
F 3 "~" H 8800 5100 50  0001 C CNN
	1    8750 5100
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR0163
U 1 1 5FE2E97E
P 9250 5100
F 0 "#PWR0163" H 9250 4950 50  0001 C CNN
F 1 "+5V" V 9265 5228 50  0000 L CNN
F 2 "" H 9250 5100 50  0001 C CNN
F 3 "" H 9250 5100 50  0001 C CNN
	1    9250 5100
	0    1    1    0   
$EndComp
Wire Wire Line
	9250 5100 9050 5100
$Comp
L Device:LED_Dual_CAC D?
U 1 1 5FE2E985
P 8750 4200
F 0 "D?" H 8750 4625 50  0000 C CNN
F 1 "LED_Dual_CAC" H 8750 4534 50  0000 C CNN
F 2 "" H 8800 4200 50  0001 C CNN
F 3 "~" H 8800 4200 50  0001 C CNN
	1    8750 4200
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR0164
U 1 1 5FE2E98B
P 9250 4200
F 0 "#PWR0164" H 9250 4050 50  0001 C CNN
F 1 "+5V" V 9265 4328 50  0000 L CNN
F 2 "" H 9250 4200 50  0001 C CNN
F 3 "" H 9250 4200 50  0001 C CNN
	1    9250 4200
	0    1    1    0   
$EndComp
Wire Wire Line
	9250 4200 9050 4200
$Comp
L Device:LED_Dual_CAC D?
U 1 1 5FE2E992
P 8750 3300
F 0 "D?" H 8750 3725 50  0000 C CNN
F 1 "LED_Dual_CAC" H 8750 3634 50  0000 C CNN
F 2 "" H 8800 3300 50  0001 C CNN
F 3 "~" H 8800 3300 50  0001 C CNN
	1    8750 3300
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR0165
U 1 1 5FE2E998
P 9250 3300
F 0 "#PWR0165" H 9250 3150 50  0001 C CNN
F 1 "+5V" V 9265 3428 50  0000 L CNN
F 2 "" H 9250 3300 50  0001 C CNN
F 3 "" H 9250 3300 50  0001 C CNN
	1    9250 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	9250 3300 9050 3300
$Comp
L Device:LED_Dual_CAC D?
U 1 1 5FE2E99F
P 8750 2350
F 0 "D?" H 8750 2775 50  0000 C CNN
F 1 "LED_Dual_CAC" H 8750 2684 50  0000 C CNN
F 2 "" H 8800 2350 50  0001 C CNN
F 3 "~" H 8800 2350 50  0001 C CNN
	1    8750 2350
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR0166
U 1 1 5FE2E9A5
P 9250 2350
F 0 "#PWR0166" H 9250 2200 50  0001 C CNN
F 1 "+5V" V 9265 2478 50  0000 L CNN
F 2 "" H 9250 2350 50  0001 C CNN
F 3 "" H 9250 2350 50  0001 C CNN
	1    9250 2350
	0    1    1    0   
$EndComp
Wire Wire Line
	9250 2350 9050 2350
Wire Wire Line
	5250 3600 4250 3600
Wire Wire Line
	4250 3600 4250 2250
Wire Wire Line
	4250 2250 3450 2250
Wire Wire Line
	5250 3700 4100 3700
Wire Wire Line
	4100 3700 4100 2450
Wire Wire Line
	4100 2450 3450 2450
Wire Wire Line
	5250 3800 3950 3800
Wire Wire Line
	3950 3800 3950 3150
Wire Wire Line
	3950 3150 3450 3150
Wire Wire Line
	5250 3900 3800 3900
Wire Wire Line
	3800 3900 3800 3350
Wire Wire Line
	3800 3350 3450 3350
Wire Wire Line
	5250 4000 3450 4000
Wire Wire Line
	3450 4000 3450 4050
Wire Wire Line
	5250 4100 3550 4100
Wire Wire Line
	3550 4100 3550 4250
Wire Wire Line
	3550 4250 3450 4250
Wire Wire Line
	5250 4200 3700 4200
Wire Wire Line
	3700 4200 3700 5000
Wire Wire Line
	3700 5000 3450 5000
Wire Wire Line
	5250 4300 3850 4300
Wire Wire Line
	3850 4300 3850 5200
Wire Wire Line
	3850 5200 3450 5200
Wire Wire Line
	6450 4300 7900 4300
Wire Wire Line
	7900 4300 7900 5200
Wire Wire Line
	7900 5200 8450 5200
Wire Wire Line
	6450 4200 8100 4200
Wire Wire Line
	8100 4200 8100 5000
Wire Wire Line
	8100 5000 8450 5000
Wire Wire Line
	6450 4100 8250 4100
Wire Wire Line
	8250 4100 8250 4300
Wire Wire Line
	8250 4300 8450 4300
Wire Wire Line
	6450 4000 8450 4000
Wire Wire Line
	8450 4000 8450 4100
Wire Wire Line
	6450 3900 8450 3900
Wire Wire Line
	8450 3900 8450 3400
Wire Wire Line
	6450 3800 8300 3800
Wire Wire Line
	8300 3800 8300 3200
Wire Wire Line
	8300 3200 8450 3200
Wire Wire Line
	6450 3700 8150 3700
Wire Wire Line
	8150 3700 8150 2450
Wire Wire Line
	8150 2450 8450 2450
Wire Wire Line
	6450 3600 8000 3600
Wire Wire Line
	8000 3600 8000 2250
Wire Wire Line
	8000 2250 8450 2250
Wire Wire Line
	6450 3300 6600 3300
Wire Wire Line
	6900 3300 7050 3300
$EndSCHEMATC
