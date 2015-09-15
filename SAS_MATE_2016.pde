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

int motor1 = 0;
int motor2 = 0;
int motor3 = 0;
int motor4 = 0;

int motor1x;
int motor2x;
int motor3x;
int motor4x;

int motor1y;
int motor2y;
int motor3y;
int motor4y;

int motor1z;
int motor2z;
int motor3z;
int motor4z;

int servo1 = 0;
int servo2 = 0;
int servo3 = 0;
int servo4 = 0;

float x, y, rot, sens, elv;

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
    
    if(y = 0) {
      servo1 = 90;
      servo2 = 90;
      servo2 = 90;
      servo4 = 90;
    }
    
    if(x = 0) {
      motor1y = 0;
      motor2y = 0;
      motor3y = 0;
      motor4y = 0;
    }
    
    if(z = 0) {
      motor1z = 0;
      motor2z = 0;
      motor3z = 0;
      motor4z = 0;
    }
    
    if(x > 0) {
      motor1x = -1 * x;
      motor2x = -1 + (2 * x);
      motor3x = x;
      motor4x = 1 - (2 * x);
    }
    
    if(x < 0) {
      x = x-1 + (2 * x);
      motor1x = -1 + (2 * x);
      motor2x = -1 * x;
      motor3x = 1 - (2 * x);
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
    
    if(y != 0) {
      servo1 = ((-1 * motor1) + 1) * 90;
      servo2 = ((-1 * motor1) + 1) * 90;
      servo3 = ((-1 * motor1) + 1) * 90;
      servo4 = ((-1 * motor1) + 1) * 90;
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
