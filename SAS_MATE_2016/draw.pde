void draw(){
  
  //backdrop colors
  fill(colorBackground[0], colorBackground[1], colorBackground[2]);
  rect(0, 0, width, height);
  
  getMode();
  //mode1();
  
  math();
  
  drawTitle();
  drawDebug();
  drawXYGraph();
  drawSensitivity();
  drawRotation();
  drawElevation();
  drawMotor1();
  drawMotor2();
  drawMotor3();
  drawMotor4();
  drawText();
  drawModeButton();
  

}
