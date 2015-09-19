void drawMotor2() {
  
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
  rect(850 + (float)(280 * (servo2/180)), 265, 5, 40); 
  rect(850 + (float)(280 * (servo2/180)), 265, -5, 40); 
}
