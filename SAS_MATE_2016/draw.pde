void draw(){
  
  //backdrop colors
  fill(170, 116, 57);
  rect(0, 0, width, height);
  
  math();
  
  drawTitle();
  drawDebug();
  drawSensitivity();
  drawMotor1();
  drawMotor2();
  drawMotor3();
  drawMotor4();
  drawText();

}
