void drawMotor3() {
  
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
  rect(500 + (float)(280 * (servo3/180)), 455, 5, 40);
  rect(500 + (float)(280 * (servo3/180)), 455, -5, 40);  
}
