/*
  !!!!MUST USE PROCESSING 32-BIT!!!!
*/
//import
import procontroll.*; //documentation in library //in documents/processing/libraries
import processing.serial.*;
import java.io.*;
import java.util.Scanner;

//procontroll variables
ControllIO controll;
ControllDevice device;
Serial port;


ControllSlider sliderY;
ControllSlider sliderX;


ControllSlider sliderSens;
ControllSlider sliderRot;

double motor1 = 0;
double motor2 = 0;
double motor3 = 0;
double motor4 = 0;

double motor1x = 0;
double motor2x = 0;
double motor3x = 0;
double motor4x = 0;

double motor1z = 0;
double motor2z = 0;
double motor3z = 0;
double motor4z = 0;

double servo1 = 0;
double servo2 = 0;
double servo3 = 0;
double servo4 = 0;

double x, y, z, rot, sens, elv;

PFont bigfont;


boolean jsError = true;
boolean commsError = true;

//start
void setup(){
  size(1000, 500); //resolution 
  
  //check for arduinos
  controll = ControllIO.getInstance(this);
  if (Serial.list().length < 1) { //none
     println("No Arduinos detected!");
  }
  else if (Serial.list().length > 1) {// mutiple
     println("Multiple serial interfaces detected!"); 
  }
  else {//one
    port = new Serial(this, Serial.list()[0], 9600);
    commsError = false;
  }
  
  //check for devices
  for (int i = 0; i < controll.getNumberOfDevices(); i++) {//loop until it gets preffered device
     if (controll.getDevice(i).getName().equals("Logitech Extreme 3D")) { //find actual controller with matching name
        device = controll.getDevice(i);
        jsError = false;
     }
  }
  try {
    //set proper names to device buttones
    device.setTolerance(0.15f); //deadzone
    
  } catch (Exception e) {
    println("Error while aquiring joystick!"); 
  }
  
  
  
  bigfont = loadFont("font.vlw");
  
 
  
  lastSend = millis();
  
  
}

//create GUI
void draw(){
  //GUI
  
  
  try { //math for motor and servo values //surrouned in a try/catch statement incase of errors
    
    if(y == 0) {
      servo1 = 90;
      servo2 = 90;
      servo3 = 90;
      servo4 = 90;
    }

    if(x == 0) {
      motor1x = 0;
      motor2x = 0;
      motor3x = 0;
      motor4x = 0;
    }

    if(z == 0) {
      motor1z = 0;
      motor2z = 0;
      motor3z = 0;
      motor4z = 0;
    }

    if(x < 0) {
      motor1x = x;
      motor2x = -1 * x;
      motor3x = -1 * x;
      motor4x = x;
      
    }

    if(x > 0) {
      motor1x = x;
      motor2x = -1 * x;
      motor3x = -1 * x;
      motor4x = x;
    }

    if(z > 0) {
      motor1z = -1 * z;
      motor2z = -1 * z;
      motor3z = z;
      motor4z = z;
    }

    if(z < 0) {
      motor1z = -1 * z;
      motor2z = -1 * z;
      motor3z = z;
      motor4z = z;
    }

    motor1 = motor1x + motor1z;
    motor2 = motor2x + motor2z;
    motor3 = motor3x + motor3z;
    motor4 = motor4x + motor4z;

    if(y > 0) {
        
        if(motor1 > 0)
            servo1 = ((motor1 + y)/2) * 90;
        if(motor2 > 0)
            servo2 = ((motor2 + y)/2) * 90;
        if(motor3 > 0)
            servo3 = ((motor3 + y)/2) * 90;
        if(motor4 > 0)
            servo4 = ((motor4 + y)/2) * 90;
        
        if(motor1 < 0)
            servo1 = (((-motor1 + y)/2) * 90) + 90;
        if(motor2 < 0)
            servo2 = (((-motor2 + y)/2) * 90) + 90;
        if(motor3 < 0)
            servo3 = (((-motor3 + y)/2) * 90) + 90;
        if(motor4 < 0)
            servo4 = (((-motor4 + y)/2) * 90) + 90;
        
        if(motor1 == 0){
            servo1 = 90 - (y *90);
            motor1 = y;
        }
        if(motor2 == 0){
            servo2 = 90 - (y *90);
            motor2 = y;
        }
        if(motor3 == 0){
            servo3 = 90 - (y *90);
            motor3 = y;
        }
        if(motor4 == 0){
            servo4 = 90 - (y *90);
            motor4 = y;
        }
    }
    
    if(y < 0) {
        
        if(motor1 > 0)
            servo1 = (((motor1 + y)/2) * 90) + 90;
        if(motor2 > 0)
            servo2 = (((motor2 + y)/2) * 90) + 90;
        if(motor3 > 0)
            servo3 = (((motor3 + y)/2) * 90) + 90;
        if(motor4 > 0)
            servo4 = (((motor4 + y)/2) * 90) + 90;
        
        if(motor1 < 0)
            servo1 = ((-motor1 + y)/2) * 90;
        if(motor2 < 0)
            servo2 = ((-motor2 + y)/2) * 90;
        if(motor3 < 0)
            servo3 = ((-motor3 + y)/2) * 90;
        if(motor4 < 0)
            servo4 = ((-motor4 + y)/2) * 90;
        
        if(motor1 == 0){
            servo1 = (y * 90) + 90;
            motor1 = -y;
        }
        if(motor2 == 0){
            servo2 = (y * 90) + 90;
            motor2 = -y;
        }
        if(motor3 == 0){
            servo3 = (y * 90) + 90;
            motor3 = -y;
        }
        if(motor4 == 0){
            servo4 = (y * 90) + 90;
            motor4 = -y;
        }
      
    }
    
  }
  catch (Exception e) {
    if (!jsError) {
      jsError = true;
      println("Error while polling joystick values!");
    }
  }
  
  
  
  //send motor output
  if ( millis() - lastSend > 100) { //minimum time between msg = 100ms
    lastSend = millis();
    printToArduino(motor1, motor2, motor3, motor4, servo1, servo2, servo3, servo4); 
    
    if (commsError) { //if not connected, attempt reconnect
       if (Serial.list().length == 1) {
        port = new Serial(this, Serial.list()[0], 9600);
        commsError = false;
       }
    }
    
  } 
}

//send to arduino
void printToArduino(int m1, int m2, int m3, int m4, int s1, int s2, int s3, int s4) {
  if (!commsError) {
    
    println('T' + hex(m1,2) + hex(m2,2) + hex(m3,2) + hex(m4,2) + hex(s1,2) + hex(s3,2) + hex(s3,2) + hex(s4,2)); //debug
    port.write('T' + hex(m1,2) + hex(m2,2) + hex(m3,2) + hex(m4,2) + hex(s1,2) + hex(s3,2) + hex(s3,2) + hex(s4,2));
  }
}
