void drawMotor4() {
  
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
  rect(850 + (float)(280 * (servo4/180)), 455, 5, 40); 
  rect(850 + (float)(280 * (servo4/180)), 455, -5, 40);
}
