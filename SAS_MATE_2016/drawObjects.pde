void drawTitle() {
  
  textAlign(CENTER, CENTER);
  fill(255, 214, 170);
  rect(0, 0, width, height/6);
  textFont(font, 30);
  fill(39,88,107);
  text("MATE Control 2016", 600, 50);
}

void drawDebug() {
  
  fill(85, 44, 0);
  rect(1025, 550, 250, 50);
  
  //debug title
  fill(109, 146, 160);
  textAlign(CENTER, BOTTOM);
  textFont(font, 15);
  text("Debug", 1200 - 175/2, 575);
  //debug gore
  textFont(font, 10);
  text("Output: " + 'T' + hex(m1,2) + hex(m2,2) + hex(m3,2) + hex(m4,2) + hex(s1,2) + hex(s3,2) + hex(s3,2) + hex(s4,2), 1200 - 175/2, 595);
}

void drawXYGraph(){
  
  //background
  fill(212, 208, 106);
  rect(50, 150, 250, 250);
  
  //restraint lines
  line(50, 275, 175, 150);
  line(175, 150, 300, 275);
  line(50, 275, 175, 400);
  line(175, 400, 300, 275);
  
  //display joystick x y
  line(175, 275, 175 + x * 125, 275 + -z * 125);
  fill(82, 43, 114);
  ellipse(175 + x * 125, 275 + -z * 125, 5, 5); //dot
}

void drawRotation(){
  
  //background bar
  fill(212, 208, 106);
  rect(50, 535, 250, 40);
  
  //rotation bar
  fill(82, 43, 114);
  rect(175, 535, 125 * rotation, 40);
  
}

void drawSensitivity() {
  
  //background bar
  fill(212, 208, 106);
  rect(50, 450, 250, 40);
  //sensitivity bar
  fill(82, 43, 114);
  rect(50, 450, 250 * sensitivity, 40);
}

void drawElevation() {
  
  
}
