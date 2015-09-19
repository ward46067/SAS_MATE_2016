void draw(){
  
  //backdrop colors
  fill(170, 116, 57);
  rect(0, 0, width, height);
  
  equations();

  textAlign(CENTER, BOTTOM); //text origin will be at the center and bottom of the string 
  
  // title
  fill(255, 214, 170);
  rect(0, 0, width, height/6);
  textFont(font, 30);
  fill(39,88,107);
  text("MATE Control 2016", 600, 50);
  
  //debug
  fill(85, 44, 0);
  rect(1025, 550, 250, 50);
  fill(109, 146, 160);
  //debug title
  textFont(font, 15);
  text("Debug", 1025 + 175/2, 575);
  //debug gore
  textFont(font, 10);
  text("Output: " + 'T' + hex(m1,2) + hex(m2,2) + hex(m3,2) + hex(m4,2) + hex(s1,2) + hex(s3,2) + hex(s3,2) + hex(s4,2), 1115, 595);
  
  //xy graph
  fill(212, 208, 106);
  rect(50, 150, 250, 250);
  //display joystick x y
  line(175, 275, 175 + x * 125, 275 + -z * 125);
  fill(82, 43, 114);
  ellipse(175 + x * 125, 275 + -z * 125, 5, 5); //dot
  
  //sensitivity bar
  //background bar
  fill(212, 208, 106);
  rect(50, 450, 250, 40);
  //sensitivity bar
  fill(82, 43, 114);
  rect(50, 450, 250 * sensitivity, 40);
  
  //motor1
  //background
  fill(212, 162, 106);
  rect(490, 150, 300, 165);
  //speed background
  fill(212, 208, 106);
  rect(500, 200, 280, 40);
  //speed bar
  fill(82, 43, 114);
  rect(640, 200, (float)(140 * motor1), 40);
  //servo background
  fill(212, 208, 106);
  rect(500, 265, 280, 40);
  //servo bar
  fill(82, 43, 114);
  //rect(410, 265, (float)(280 * (servo1/180)), 40); //solid bar for servo instead of thick line
  rect(500 + (float)(280 * (servo1/180)), 265, 5, 40); 
  rect(500 + (float)(280 * (servo1/180)), 265, -5, 40); 
  
  //motor2
  //background
  fill(212, 162, 106);
  rect(840, 150, 300, 165);
  //speed background
  fill(212, 208, 106);
  rect(850, 200, 280, 40);
  //speed bar
  fill(82, 43, 114);
  rect(990, 200, (float)(140 * motor2), 40);
  //servo background
  fill(212, 208, 106);
  rect(850, 265, 280, 40);
  //servo bar
  fill(82, 43, 114);
  //rect(410, 265, (float)(280 * (servo1/180)), 40); //solid bar for servo instead of thick line
  rect(850 + (float)(280 * (servo2/180)), 265, 5, 40); 
  rect(850 + (float)(280 * (servo2/180)), 265, -5, 40); 
  
  //motor3
  //background
  fill(212, 162, 106);
  rect(490, 340, 300, 165);
  //speed background
  fill(212, 208, 106);
  rect(500, 390, 280, 40);
  //speed bar
  fill(82, 43, 114);
  rect(640, 390, (float)(140 * motor3), 40);
  //servo background
  fill(212, 208, 106);
  rect(500, 455, 280, 40);
  //servo bar
  fill(82, 43, 114);
  //rect(410, 265, (float)(280 * (servo1/180)), 40); //solid bar for servo instead of thick line
  rect(500 + (float)(280 * (servo3/180)), 455, 5, 40);
  rect(500 + (float)(280 * (servo3/180)), 455, -5, 40);  
  
  //motor4
  //background
  fill(212, 162, 106);
  rect(840, 340, 300, 165);
  //speed background
  fill(212, 208, 106);
  rect(850, 390, 280, 40);
  //speed bar
  fill(82, 43, 114);
  rect(990, 390, (float)(140 * motor4), 40);
  //servo background
  fill(212, 208, 106);
  rect(850, 455, 280, 40);
  //servo bar
  fill(82, 43, 114);
  //rect(410, 265, (float)(280 * (servo1/180)), 40); //solid bar for servo instead of thick line
  rect(850 + (float)(280 * (servo4/180)), 455, 5, 40); 
  rect(850 + (float)(280 * (servo4/180)), 455, -5, 40);
  
  
  //text
  textFont(font, 18);
  fill(39,88,107);
  textAlign(CENTER, BOTTOM);
  text("Joystick Map", 175, 150);
  text("Sensitivity", 175, 450);
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
