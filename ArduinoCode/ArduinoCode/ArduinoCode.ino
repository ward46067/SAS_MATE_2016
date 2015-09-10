#include <Servo.h>

Servo mc1;
Servo mc2;
Servo mc3;
Servo mc4;
Servo sc1;

char buffer[10]; //10 Hexademcimal Inputs, 2 (a signed byte) per motor channel

void setup() {

        mc1.attach(2);
        mc2.attach(3);
        mc3.attach(4);
        mc4.attach(5);
        sc1.attach(6);
        
        mc1.writeMicroseconds(1500);
        mc2.writeMicroseconds(1500);
        mc3.writeMicroseconds(1500);
        mc4.writeMicroseconds(1500);
        sc1.writeMicroseconds(1500);
        Serial.begin(9600);
}

void loop() {
  while(Serial.available() > 10) { //gather 11 bits in hardware buffer
     
        byte message = Serial.read();

        if (message == 'T' || message == 't') { //Throttle message starts with T followed by 8 Hexadecimal inputs
                
                for(int i=0; i < 10; i++) {
                        buffer[i] = Serial.read();
                }       
                Serial.write(buffer);
                //Convert two hexes to a decimal 0~255, rescale to 905 ~ 2100
                //center value is 127
                mc1.writeMicroseconds( 75 * (hex2dec(buffer[0]) * 16 + hex2dec(buffer[1])) / 16 + 905 );
                mc2.writeMicroseconds( 75 * (hex2dec(buffer[2]) * 16 + hex2dec(buffer[3])) / 16 + 905 );
                mc3.writeMicroseconds( 75 * (hex2dec(buffer[4]) * 16 + hex2dec(buffer[5])) / 16 + 905 );
                //mc4.writeMicroseconds( 75 * (hex2dec(buffer[6]) * 16 + hex2dec(buffer[7])) / 16 + 905 );
                mc4.write(( 75 * (hex2dec(buffer[6]) * 16 + hex2dec(buffer[7])) / 16)*2);
                sc1.writeMicroseconds( 100 * (hex2dec(buffer[8]) * 16 + hex2dec(buffer[9])) / 17 + 750 );
        }

  }
} 

byte hex2dec(byte c) {
        if (c >= '0' && c <= '9') {
                return c - '0';
        }       
        else if (c >= 'A' && c <= 'F') {
                return c - 'A' + 10;
        }       
        else if (c >= 'a' && c <= 'f') {
                return c - 32 - 'A' + 10;
        }       
}
