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


ControllSlider sliderX;
ControllSlider sliderZ;




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

int m1, m2, m3, m4, s1, s2, s3, s4;

double x, y, z, rot, sens, elv;
long lastSend;
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
     if (controll.getDevice(i).getName().equals("Saitek X52 Flight Control System")) { //find actual controller with matching name
        device = controll.getDevice(i);
        jsError = false;
     }
  }
  try {
    //set proper names to device buttones
    device.setTolerance(0.15f); //deadzone
    sliderX = device.getSlider(0);
    sliderZ = device.getSlider(1);
    
  } catch (Exception e) {
    println("Error while aquiring joystick!"); 
  }
  

  
  bigfont = loadFont("font.vlw");
  
 
  
  lastSend = millis();
  
  
}




