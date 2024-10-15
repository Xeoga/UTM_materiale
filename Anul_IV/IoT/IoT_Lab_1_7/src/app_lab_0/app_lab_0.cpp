#include "app_lab_0.h"
#include "dd_led/dd_led.h"
#include "dd_button/dd_button.h"

#include "Arduino.h"


void app_lab_0_setup(){

    dd_led_setup();
    dd_button_setup();


}

void app_lab_0_loop(){


    while(!dd_button_is_pressed());
    
    if(dd_led_is_on()){
        dd_led_turn_off();
    }else{
        dd_led_turn_on();
    }

    while(dd_button_is_pressed());
    delay(100);
    
}