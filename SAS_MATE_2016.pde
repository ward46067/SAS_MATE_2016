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
  
  
  try {
    //set variables to doubles and proper numbers
    
    
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
