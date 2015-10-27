void drawTitle() {
  
  //background
  fill(colorTitleBackground[0], colorTitleBackground[1], colorTitleBackground[2]);
  rect(0, 0, width, height/6);
  
  
}

void drawDebug() {
  
  fill(colorDebugBackground[0], colorDebugBackground[1], colorDebugBackground[2]);
  rect(1025, 550, 250, 50);
  
  
}

void drawXYGraph(){
  
  //background
  fill(colorBarBackground[0], colorBarBackground[1], colorBarBackground[2]);
  rect(50, 150, 250, 250);
  
  //restraint lines
  line(175 - 125*sensitivity, 275, 175, 275 - 125*sensitivity);
  line(175, 275 - 125*sensitivity, 175 + 125*sensitivity, 275);
  line(175 - 125*sensitivity, 275, 175, 275 + 125*sensitivity);
  line(175, 275 + 125*sensitivity, 175 + 125*sensitivity, 275);
  
  //display joystick x y
  line(175, 275, 175 + x * 125, 275 + -z * 125);
  fill(colorBarInfo[0], colorBarInfo[1], colorBarInfo[2]);
  ellipse(175 + x * 125, 275 + -z * 125, 5, 5); //dot
}

void drawRotation(){
  
  //background bar
  fill(colorBarBackground[0], colorBarBackground[1], colorBarBackground[2]);
  rect(50, 535, 250, 40);
  
  //rotation bar
  fill(colorBarInfo[0], colorBarInfo[1], colorBarInfo[2]);
  rect(175, 535, 125 * rotation, 40);
  
}

void drawSensitivity() {
  
  //background bar
  fill(colorBarBackground[0], colorBarBackground[1], colorBarBackground[2]);
  rect(50, 450, 250, 40);
  
  //sensitivity bar
  fill(colorBarInfo[0], colorBarInfo[1], colorBarInfo[2]);
  rect(50, 450, 250 * sensitivity, 40);
}

void drawElevation() {
  
  //background
  fill(colorBarBackground[0], colorBarBackground[1], colorBarBackground[2]);
  rect(350, 150, 40, 250);
  
  //elevation bar
  fill(colorBarInfo[0], colorBarInfo[1], colorBarInfo[2]);
  rect(350, 275, 40, -y * 125);
}




