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
  rect(width-width/8, height-height/6, width/8, height/6);
  fill(109, 146, 160);
  //debug title
  textFont(font, 15);
  text("Debug", width-width/16, height-height/6 + 20);
  //debug gore
  textFont(font, 10);
  text("Output: " + 'T' + hex(m1,2) + hex(m2,2) + hex(m3,2) + hex(m4,2) + hex(s1,2) + hex(s3,2) + hex(s3,2) + hex(s4,2), width-width/16, height-height/6 + 35);
  text("1, " + servo1 + ", " + motor1, width-width/16, height-height/6 + 50);
  text("2, " + servo2 + ", " + motor2, width-width/16, height-height/6 + 65);
  text("3, " + servo3 + ", " + motor3, width-width/16, height-height/6 + 80);
  text("4, " + servo4 + ", " + motor4, width-width/16, height-height/6 + 95);
  
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
  
  
  //text
  textFont(font, 18);
  fill(39,88,107);
  text("Joystick Map", 175, 175);
  text("Sensitivity", 175, 450);
  
}
