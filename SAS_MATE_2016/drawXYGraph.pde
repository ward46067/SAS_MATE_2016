void drawXYGraph(){
  
  fill(212, 208, 106);
  rect(50, 150, 250, 250);
  //display joystick x y
  line(175, 275, 175 + x * 125, 275 + -z * 125);
  fill(82, 43, 114);
  ellipse(175 + x * 125, 275 + -z * 125, 5, 5); //dot
}
