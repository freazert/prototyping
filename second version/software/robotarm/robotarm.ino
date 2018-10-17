/*************************************************** 
  This is an example for our Adafruit 16-channel PWM & Servo driver
  Servo test - this will drive 16 servos, one after the other

  Pick one up today in the adafruit shop!
  ------> http://www.adafruit.com/products/815

  These displays use I2C to communicate, 2 pins are required to  
  interface. For Arduino UNOs, thats SCL -> Analog 5, SDA -> Analog 4

  Adafruit invests time and resources providing this open source code, 
  please support Adafruit and open-source hardware by purchasing 
  products from Adafruit!

  Written by Limor Fried/Ladyada for Adafruit Industries.  
  BSD license, all text above must be included in any redistribution
 ****************************************************/

#include <Wire.h>
#include <Adafruit_PWMServoDriver.h>
#include <SoftwareSerial.h>

// called this way, it uses the default address 0x40
Adafruit_PWMServoDriver pwm = Adafruit_PWMServoDriver();
// you can also call it with a different address you want
//Adafruit_PWMServoDriver pwm = Adafruit_PWMServoDriver(0x41);

// Depending on your servo make, the pulse width min and max may vary, you 
// want these to be as small/large as possible without hitting the hard stop
// for max range. You'll have to tweak them as necessary to match the servos you
// have!
#define SERVOMIN  130 // this is the 'minimum' pulse length count (out of 4096) //recalibrated
#define SERVOMAX  460 // this is the 'maximum' pulse length count (out of 4096) //recalibrated

 // Calculate based on max input size expected for one command
#define INPUT_SIZE 30
SoftwareSerial BTSerial( 2,3); // RX | TX
// our servo # counter

int servos[] = {SERVOMIN, SERVOMIN, SERVOMIN, SERVOMIN, SERVOMIN, SERVOMIN, SERVOMIN, SERVOMIN, SERVOMIN, SERVOMIN, SERVOMIN};

uint16_t joystick1_X =516;
uint16_t joystick2_X =516;


uint16_t joystick1_Y =516;
uint16_t joystick2_Y =516;

void setup() {
  Serial.begin(9600);
  Serial.println("16 channel Servo test!");

  BTSerial.begin(38400);


  pwm.begin();
  
  pwm.setPWMFreq(50);  // Analog servos run at ~60 Hz updates

  yield();

}

void loop() {



//...

// Get next command from Serial (add 1 for final 0)

char input[INPUT_SIZE + 1];
byte size = BTSerial.readBytes(input, INPUT_SIZE);
// Add the final 0 to end the C string
input[size] = 0;

Serial.println(input);

  if(input !="")
  {     
    // Read each command pair 
    char* command = strtok(input, "&");

    while (command != 0)
    {
    // Split the command in two values
    char* separator = strchr(command, ':');
    if (separator != 0)
    {
        // Actually split the string in 2: replace ':' with 0
        *separator = 0;
        int servoId = atoi(command);
        ++separator;
        int position = atoi(separator);
        setpulslen(servoId ,position);
        
        // Do something with servoId and position
        
    
    }
    // Find the next command in input string
    command = strtok(0, "&");
}
  }
  

}
void setpulslen(uint8_t servoId, int position)
{
  servos[servoId] += position;
  
  if(servos[servoId] >= SERVOMAX)
  {
    servos[servoId] = SERVOMAX;
  }
  else if(servos[servoId] <= SERVOMIN)
  {
    servos[servoId] = SERVOMIN;
  }
  pwm.setPWM(servoId, 0, servos[servoId]);

}

