void drawText() {
  
  textFont(font, 18);
  fill(39,88,107);
  
  textAlign(CENTER, BOTTOM);
  text("Joystick Map", 175, 150);
  text("Sensitivity", 175, 450);
  text("Rotation", 175, 535);
  text("Motor 1", 640, 175);
  text("Motor 2", 990, 175);
  text("Motor 3", 640, 365);
  text("Motor 4", 990, 365);
  
  textAlign(LEFT, BOTTOM);
  //motor1
  text("Speed: " + motor1*100, 500, 200);
  text("Servo: " + servo1, 500, 265);
  //motor2
  text("Speed: " + motor2*100, 850, 200);
  text("Servo: " + servo2, 850, 265);
  //motor3
  text("Speed: " + motor3*100, 500, 390);
  text("Servo: " + servo3, 500, 455);
  //motor4
  text("Speed: " + motor2*100, 850, 390);
  text("Servo: " + servo2, 850, 455);
}
