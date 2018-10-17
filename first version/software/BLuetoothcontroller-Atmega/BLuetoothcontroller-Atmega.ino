#include <LiquidCrystal.h>
#include <SoftwareSerial.h>

//SoftwareSerial BTSerial(3, 2); // RX | TX
//char in[80];
// char i;

 int sensor1X = A1;
 int sensor1Y = A2;

int sensor2X = A3;
int sensor2Y = A4;

 int button1 = 5;
 int button2 = 6;
 int button3 = 7;

 int voltage = A5;


const int rs = 13, en = 12, d4 = 11, d5 = 10, d6 = 9, d7 = 8;
LiquidCrystal lcd(rs, en, d4, d5, d6, d7);

void setup() {
  Serial.begin(38400);  // HC-05 default speed in AT command more

  pinMode(sensor1X, INPUT); //Sets the analog ports used to an input
  pinMode(sensor1Y, INPUT);
  pinMode(sensor2X, INPUT); //Sets the analog ports used to an input
  pinMode(sensor2Y, INPUT);
  pinMode(button1, INPUT );
  pinMode(button2, INPUT);
  pinMode(button3, INPUT);
  pinMode(voltage, INPUT);

  

  lcd.begin(16, 2);
  lcd.print("data:");
}

void loop() {
  
 lcd.setCursor(0, 0);
  // print the number of seconds since reset:
  lcd.print("krisé");
  int x1Value =0;
  int x2Value =0;

  int y1Value = 0;
  int y2Value = 0;

  int btn1 = 0;
  int btn2 = 0;
  int btn3 = 0;
  
  
  // put your main code here, to run repeatedly:
  // set the cursor to column 0, line 1
  // (note: line 1 is the second row, since counting begins with 0):
  delay(500);
  print();
  sendBluetooth();
}
int treatValue(int data) {
  Serial.println(data);
  return (data);
 }

 void print()
 {
  lcd.setCursor(7, 0);lcd.print(millis() / 1000);
  lcd.print(" ");
 }
 void sendBluetooth()
 {
   Serial.print("1:");
   Serial.print(mapYoistickData(analogRead(sensor1X)));
   Serial.print("&2:");
   Serial.print(mapYoistickData(analogRead(sensor1Y)));
   Serial.print("&3:");
   Serial.print(mapYoistickData(analogRead(sensor2X)));
   Serial.print("&4:");
   Serial.print(mapYoistickData(analogRead(sensor2Y)));
   Serial.print("&5:");
   Serial.print(digitalRead(button1));
   Serial.print("&6:");
   Serial.print(digitalRead(button2));
   Serial.print("&7:");
   Serial.print(digitalRead(button3));
   Serial.println("&");
 }
 int mapYoistickData(int input)
 {
  return map(input, 0, 1023, -5, 5);
 }
 

