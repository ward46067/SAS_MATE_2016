void drawMotor1() {

  //background
  fill(212, 162, 106);
  rect(490, 150, 300, 165);
  
  //speed background
  fill(212, 208, 106);
  rect(500, 200, 280, 40);
  
  //speed bar
  fill(82, 43, 114);
  rect(640, 200, (float)(140 * motor1), 40);
  
  //servo background
  fill(212, 208, 106);
  rect(500, 265, 280, 40);
  
  //servo bar
  fill(82, 43, 114);
  rect(500 + (float)(280 * (servo1/180)), 265, 5, 40); 
  rect(500 + (float)(280 * (servo1/180)), 265, -5, 40); 
}
