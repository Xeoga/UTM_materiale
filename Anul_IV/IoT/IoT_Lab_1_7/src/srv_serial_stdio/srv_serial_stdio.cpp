
#include "srv_serial_stdio.h"

// Include device driver
#include "Arduino.h"

// define a stream for the serial driver
FILE* srv_serial_stdio_stream;


void srv_serial_setup()
{
    // Initialize the serial driver
    Serial.begin(9600);

    // create a stream that uses the serial driver
    srv_serial_stdio_stream = fdevopen(srv_serial_put_char, srv_serial_get_char);

    // link the standard input, output, and error streams to the serial driver
    stdin = stdout = stderr = srv_serial_stdio_stream;
}


// Define the function to get a character from the serial driver
int srv_serial_get_char(FILE* stream)
{
    // Declare a variable to store the character
    char c;
    // Wait until a character is available 
    while (Serial.available() == 0); 
    // Read the character from the serial monitor
    c = Serial.read();
    // echo the character back to the serial monitor
    Serial.write(c);
    // Return the character
    return c;
}

// Define the function to put a character to the serial driver
int srv_serial_put_char(char c, FILE* stream)
{
    //Send the character to the serial monitor
    Serial.write(c);
    return 0;
}
