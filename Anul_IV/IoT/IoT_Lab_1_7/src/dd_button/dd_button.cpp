#include "dd_button.h"
#include "Arduino.h"

void dd_button_setup()
{
    pinMode(DD_BUTTON_PIN, INPUT_PULLUP);
}

int dd_button_read()
{
    return digitalRead(DD_BUTTON_PIN);
}

int dd_button_is_pressed()
{
	int res = 0;
    if(digitalRead(DD_BUTTON_PIN)==LOW)
    res = 1;
    else
	res = 0; 
	
    return res;
}
