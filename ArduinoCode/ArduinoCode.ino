#include <Servo.h>

Servo m1;
Servo m2;
Servo m3;
Servo m4;

Servo s1;
Servo s2;
Servo s3;
Servo s4;

char buffer[16]; //10 Hexademcimal Inputs, 2 (a signed byte) per motor channel

void setup() {

        m1.attach(1);
        m2.attach(2);
        m3.attach(3);
        m4.attach(4);

        s1.attach(5);
        s2.attach(6);
        s3.attach(7);
        s4.attach(8);
        
        m1.writeMicroseconds(1500);
        m2.writeMicroseconds(1500);
        m3.writeMicroseconds(1500);
        m4.writeMicroseconds(1500);
        s1.writeMicroseconds(1500);
        s2.writeMicroseconds(1500);
        s3.writeMicroseconds(1500);
        s4.writeMicroseconds(1500);
        Serial.begin(9600);
}

void loop() {
  while(Serial.available() > 16) { //gather 11 bits in hardware buffer
     
        byte message = Serial.read();

        if (message == 'T' || message == 't') { //Throttle message starts with T followed by 8 Hexadecimal inputs
                
                for(int i=0; i < 16; i++) {
                        buffer[i] = Serial.read();
                }       
                Serial.write(buffer);
                //Convert two hexes to a decimal 0~255, rescale to 905 ~ 2100
                //center value is 127
                m1.writeMicroseconds( 75 * (hex2dec(buffer[0]) * 16 + hex2dec(buffer[1])) / 16 + 905 );
                m2.writeMicroseconds( 75 * (hex2dec(buffer[2]) * 16 + hex2dec(buffer[3])) / 16 + 905 );
                m3.writeMicroseconds( 75 * (hex2dec(buffer[4]) * 16 + hex2dec(buffer[5])) / 16 + 905 );
                m4.writeMicroseconds( 75 * (hex2dec(buffer[6]) * 16 + hex2dec(buffer[7])) / 16 + 905 );
                s1.writeMicroseconds( 100 * (hex2dec(buffer[8]) * 16 + hex2dec(buffer[9])) / 17 + 750 );
                s2.writeMicroseconds( 100 * (hex2dec(buffer[10]) * 16 + hex2dec(buffer[11])) / 17 + 750 );
                s3.writeMicroseconds( 100 * (hex2dec(buffer[12]) * 16 + hex2dec(buffer[13])) / 17 + 750 );
                s4.writeMicroseconds( 100 * (hex2dec(buffer[14]) * 16 + hex2dec(buffer[15])) / 17 + 750 );
        }

  }
} 
 //when called above, it will convert the character read from processing to a number 
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
