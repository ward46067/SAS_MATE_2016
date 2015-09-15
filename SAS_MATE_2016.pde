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

//controll variables
ControllSlider sliderY;
ControllSlider sliderX;
ControllSlider sliderSens;
ControllSlider sliderRot;
ControllButton buttonBoost;
ControllButton buttonElvCheck;
ControllButton buttonServoOpen;
ControllButton buttonServoClose;



int motorleft = 0; //throttle of left motor
int motorright = 0; //throttle of right motor
int motorelev = 0; //throttle of elevation motor
int motorlat = 0; //throttle of lateral motor
int servo = 0; //servo for arm
int srv = 0;

float x, y, r, s, e, b, ec, srvo, srvc; //controller values //all doubles
long lastSend; //last millisecond to send message to Arduino
PFont bigfont;
//PImage ping;

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
    sliderY = device.getSlider(0);
    sliderX = device.getSlider(1);
    sliderRot = device.getSlider(2);
    sliderSens = device.getSlider(3);
    buttonBoost = device.getButton(1);
    buttonElvCheck = device.getButton(2);
    buttonServoOpen = device.getButton(4);
    buttonServoClose = device.getButton(3);
  } catch (Exception e) {
    println("Error while aquiring joystick!"); 
  }
  
  
  
  bigfont = loadFont("font.vlw");
  
  //ping = loadImage("http://i.imgur.com/oJpc87s.png", "png");
  //ping.resize(0, 500);
  
  lastSend = millis();
  
  
}

//create GUI
void draw(){
  
  //backdrop colors
  fill(191, 144, 46);
  rect(0, 0, width, height/2);
  fill(46, 144, 191);
  rect(0, height/2, width, height/2);
  
  textAlign(CENTER, BOTTOM);
  
  //show background objects
  fill(255);
  rect(100, 100, 255, 255); //stick xy  
  rect(400, 100, 50, 255); //elevation bar
  
  rect(600, 100, 50, 255); //left motor
  rect(800, 100, 50, 255); //right motor
  rect(600, 425, 255, 50); //lateral motor
  rect(700, 100, 50, 255); //elevation motor
  rect(500, 100, 50, 255); //sensitivity
  rect(900, 100, 50, 255); //servo
  
  //image(ping, width - ping.width, height/2 - ping.height); //draw ping
  
  //show text
  textFont(bigfont, 18);
  
  
  //text
  fill(0,255,0);
  text("TRANS", 227, 100);
  text("ELEV", 425, 100);
  text("LEFT", 625, 100);
  text("RIGHT", 825, 100);
  text("ELEV", 727, 100);
  text("ROTATE", 727, 425);
  text("SENS", 525, 100);
  text("SERVO", 925, 100);
  
  textFont(bigfont,30);
  fill(0);
  text("CONSOLE", 326, 75);
  text("ROV", 727, 75);
  
  textFont(bigfont, 20);
  text("STATUS", 510, 20);
  if (commsError) {
    fill(255,0,0);
    text("SERIAL", 510, 40);
  }
  else {
    fill(0,255,0);
    text("SERIAL", 510, 40);
  }
  
  if (jsError) {
    fill(255,0,0);
    text("JSTICK", 510, 60);
  }
  else {
    fill(0,255,0);
    text("JSTICK", 510, 60);
  }
  
  try {
    //set variables to doubles and proper numbers
    x = sliderX.getValue();
    y = sliderY.getValue();
    r = sliderRot.getValue();
    s = sliderSens.getValue();
    b = buttonBoost.getValue();
    ec = buttonElvCheck.getValue();
    srvo = buttonServoOpen.getValue();
    srvc = buttonServoClose.getValue();
    jsError = false;
    
    s = (s+1)/(-2)+1; //sensitivity
    
    if (s<=0.15){//keep sensitivity above 15%
      s = 0.15;
    }
    
    if (b > 0) {//boost changes sensitivity
      s = 1;
    }
    //println(u); //test input
    
    //display joystick sensitivity
    rect(500, 354.5, 50, ((s * (-1))* 2) * 127);
    
    //set elevation
    e = r;
    e = e*(-1);
    
    //mutiply sensitivity
    x = x*s;
    y = y*s;
    r = r*s;
   
    
    //toggle elevation
    if (ec > 0) {
      e = e;
    }
    else {
      e = 0;
    }
    e = e*s;
    
    //servo
    if (srvo > 0){
      srv = 55; //degree of claw opening
    }
    else if (srvc > 0){
      srv = 0; //degree of claw closing
    }
    
  }
  catch (Exception e) {
    if (!jsError) {
      jsError = true;
      println("Error while polling joystick values!");
    }
  }
  
  //display joystick x y
  line(227, 227, 227 + x * 127, 227 + y * 127);
  fill(255, 0, 0);
  ellipse(227 + x * 127, 227 + y * 127, 10, 10); 
  
  //display joystick elevation
  rect(400, 227, 50, e * 127);
  
  //process motor output
  motorleft = (int)constrain((y - x)*127, -127, 127);
  motorright = (int)constrain((y + x)*127, -127, 127);
  motorlat = (int)(x * 127);
  motorelev = (int)(e * 127);
  servo = (int)(srv);
  ec = 0;
  
  //display motor output
  fill(0, 255, 0);
  rect(600, 227, 50, motorleft);
  rect(800, 227, 50, motorright);
  rect(727, 425, (r*127), 50);
  rect(700, 227, 50, motorelev);
  rect(900, 227, 50, (srv));
  
  //send motor output
  if ( millis() - lastSend > 100) { //minimum time between msg = 100ms
    lastSend = millis();
    printToArduino(-motorleft,  -motorright,  -motorelev, servo, motorlat); //negatives for correct polarity
    
    if (commsError) { //if not connected, attempt reconnect
       if (Serial.list().length == 1) {
        port = new Serial(this, Serial.list()[0], 9600);
        commsError = false;
       }
    }
    
  } 
}

//send to arduino
void printToArduino(int m1,  int m2,  int m3,  int m4, int s1) {
  if (!commsError) {
    //add 127 to all motor values
    m1 += 127; 
    m2 += 127;
    m3 += 127;
    m4 += 127;
    println('T' + hex(m1,2) + hex(m2,2) + hex(m3,2) + hex(m4,2) + hex(s1,2)); //debug
    port.write('T' + hex(m1,2) + hex(m2,2) + hex(m3,2) + hex(m4,2) + hex(s1,2));
  }
}
