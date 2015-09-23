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
