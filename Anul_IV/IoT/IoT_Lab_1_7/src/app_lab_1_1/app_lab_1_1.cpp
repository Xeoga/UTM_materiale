#include "app_lab_1_1.h"

#include "../srv_serial_stdio/srv_serial_stdio.h"
#include <Arduino.h>

void app_lab_1_1_setup()
{
    srv_serial_setup();
    printf("Hello, World!\n");
    Serial.begin(9600);
}

void app_lab_1_1_loop()
{
    // read a value from the serial monitor
    printf("Enter some text: ");
    // Serial.println("Hallo World!!!!, from loop");
    char command[100];
    char parameter[100];

    scanf("%s %s", command, parameter);


    printf("You entered: %s %s\n", command, parameter);

    // delay for 0.1 second   
    delay(100);
}