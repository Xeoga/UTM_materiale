/**
 * @file dd_led.h
 * @brief Library for controlling an LED using the dd_led module.
 *
 * This library provides functions to setup, turn on, turn off, toggle, check the status, and read the state of an LED connected to pin 13.
 */
#ifndef DD_LED_H
#define DD_LED_H

// Include any necessary libraries here

// Define any constants or macros here
#define DD_LED_PIN 13

// Declare any global variables here

// Declare any function prototypes here
void dd_led_setup();
void dd_led_turn_on();
void dd_led_turn_off();
void dd_led_toggle();
int dd_led_is_on();
int dd_led_read();



#endif // DD_LED_H