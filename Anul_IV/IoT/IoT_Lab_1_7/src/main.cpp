#include <Arduino.h>

#include "app_lab_0/app_lab_0.h"
#include "app_lab_1_1/app_lab_1_1.h"


#define APP_LAB_0 0
#define APP_LAB_1_1 11

// #define APP_NAME APP_APP_LAB_1
#define APP_NAME APP_LAB_1_1


void setup()
{
// put your setup code here, to run once:
#if APP_NAME == APP_LAB_0
  app_lab_0_setup();
#endif
#if APP_NAME == APP_LAB_1_1
  app_lab_1_1_setup();
#endif


}


void loop()
{
// put your main code here, to run repeatedly:F
#if APP_NAME == APP_LAB_1
  app_lab_0_loop();
#endif
#if APP_NAME == APP_LAB_2
  app_lab_1_1_loop();
#endif


}
