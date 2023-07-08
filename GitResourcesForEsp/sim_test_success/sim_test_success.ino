#include <SoftwareSerial.h>
//
//SoftwareSerial mySerial(14, 12); // RX, TX 

#define rxPin 4
#define txPin 5 //d1
SoftwareSerial mySerial(rxPin,txPin); 
/*rx pin mane 14 nmbr pin a sim module theke data recieve korbe.. sim module er tx pin ei rx pin er sathe connect hobe..
 *same way te, tx pin diye data transfer hobe jeta sim module er rx pin recieve korbe.
==> so 14 = d5 hocche tx pin er sathe
       12= d6  hocche sim module er rx pin er sathe
*/
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  mySerial.begin(9600);
}

void loop() {
  delay(500);
  while (Serial.available()) 
  {
    mySerial.write(Serial.read());
  }
  while(mySerial.available()) 
  {
    Serial.write(mySerial.read());
  }
}
