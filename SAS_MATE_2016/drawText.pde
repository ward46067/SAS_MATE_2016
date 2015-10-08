void drawText() {
  
  textFont(font, 18);
  fill(colorText[0],colorText[1],colorText[2]);
  
  textAlign(CENTER, BOTTOM);
  text("Joystick Map", 175, 150);
  text("Sensitivity: " + nf((sensitivity * 100), 2, 5) + "%", 175, 450);
  text("Rotation: " + nf((rotation * 100), 2, 5), 175, 535);
  text("Elevation", 370, 150);
  text("Motor 1", 640, 175);
  text("Motor 2", 990, 175);
  text("Motor 3", 640, 365);
  text("Motor 4", 990, 365);
  
  textAlign(RIGHT, TOP);
  //text("Change Modes", 6, 26);
  
  textAlign(LEFT, BOTTOM);
  //motor1
  text("Speed: " + nf((float)(motor1*100), 2, 5), 500, 200);
  text("Servo: " + nf((float)(servo1), 2, 5), 500, 265);
  //motor2
  text("Speed: " + nf((float)(motor2*100), 2, 5), 850, 200);
  text("Servo: " + nf((float)(servo2), 2, 5), 850, 265);
  //motor3
  text("Speed: " + nf((float)(motor3*100), 2, 5), 500, 390);
  text("Servo: " + nf((float)(servo3), 2, 5), 500, 455);
  //motor4
  text("Speed: " + nf((float)(motor4*100), 2, 5), 850, 390);
  text("Servo: " + nf((float)(servo4), 2, 5), 850, 455);
  
  //title
  textAlign(CENTER, CENTER);
  textFont(font, 30);
  fill(colorText[0],colorText[1],colorText[2]);
  text("MATE Control 2016", 600, 50);
  
  //debug title
  fill(colorDebugText[0], colorDebugText[1], colorDebugText[2]);
  textAlign(CENTER, BOTTOM);
  textFont(font, 15);
  text("Debug", 1200 - 175/2, 575);
  
  //debug text
  textFont(font, 10);
  text("Output: " + 'T' + hex(m1,2) + hex(m2,2) + hex(m3,2) + hex(m4,2) + hex(s1,2) + hex(s3,2) + hex(s3,2) + hex(s4,2), 1200 - 175/2, 595);
  
  //display date and time
  textFont(font, 15);
  textAlign(LEFT, TOP);
  text(datetime(), 5, 5);
  
  //xz
  textAlign(LEFT, TOP);
  textFont(font, 10);
  text("X: " + nf((float)(x * 100), 2, 5), 55, 155);
  
  textAlign(RIGHT, TOP);
  text("Z: " + nf((float)(z * 100), 2, 5), 295, 155);
  
  //credits
  textAlign(RIGHT, TOP);
  textFont(font, 15);
  text("Created by Dalen Ward", 1195, 5);
}
