void drawMotor1() {

  //background
  fill(colorMotorBackground[0], colorMotorBackground[1], colorMotorBackground[2]);
  rect(490, 150, 300, 165);
  
  //speed background
  fill(colorBarBackground[0], colorBarBackground[1], colorBarBackground[2]);
  rect(500, 200, 280, 40);
  
  //speed bar
  fill(colorBarInfo[0], colorBarInfo[1], colorBarInfo[2]);
  rect(640, 200, (float)(140 * motor1), 40);
  
  //servo background
  fill(colorBarBackground[0], colorBarBackground[1], colorBarBackground[2]);
  rect(500, 265, 280, 40);
  
  //servo bar
  fill(colorBarInfo[0], colorBarInfo[1], colorBarInfo[2]);
  rect(500 + (float)(280 * (servo1/180)), 265, 5, 40); 
  rect(500 + (float)(280 * (servo1/180)), 265, -5, 40); 
}

void drawMotor2() {
  
  //background
  fill(colorMotorBackground[0], colorMotorBackground[1], colorMotorBackground[2]);
  rect(840, 150, 300, 165);
  
  //speed background
  fill(colorBarBackground[0], colorBarBackground[1], colorBarBackground[2]);
  rect(850, 200, 280, 40);
  
  //speed bar
  fill(colorBarInfo[0], colorBarInfo[1], colorBarInfo[2]);
  rect(990, 200, (float)(140 * motor2), 40);
  
  //servo background
  fill(colorBarBackground[0], colorBarBackground[1], colorBarBackground[2]);
  rect(850, 265, 280, 40);
  
  //servo bar
  fill(colorBarInfo[0], colorBarInfo[1], colorBarInfo[2]);
  rect(850 + (float)(280 * (servo2/180)), 265, 5, 40); 
  rect(850 + (float)(280 * (servo2/180)), 265, -5, 40); 
}

void drawMotor3() {
  
  //background
  fill(colorMotorBackground[0], colorMotorBackground[1], colorMotorBackground[2]);
  rect(490, 340, 300, 165);
  
  //speed background
  fill(colorBarBackground[0], colorBarBackground[1], colorBarBackground[2]);
  rect(500, 390, 280, 40);
  
  //speed bar
  fill(colorBarInfo[0], colorBarInfo[1], colorBarInfo[2]);
  rect(640, 390, (float)(140 * motor3), 40);
  
  //servo background
  fill(colorBarBackground[0], colorBarBackground[1], colorBarBackground[2]);
  rect(500, 455, 280, 40);
  
  //servo bar
  fill(colorBarInfo[0], colorBarInfo[1], colorBarInfo[2]);
  rect(500 + (float)(280 * (servo3/180)), 455, 5, 40);
  rect(500 + (float)(280 * (servo3/180)), 455, -5, 40);  
}

void drawMotor4() {
  
  //background
  fill(colorMotorBackground[0], colorMotorBackground[1], colorMotorBackground[2]);
  rect(840, 340, 300, 165);
  
  //speed background
  fill(colorBarBackground[0], colorBarBackground[1], colorBarBackground[2]);
  rect(850, 390, 280, 40);
  
  //speed bar
  fill(colorBarInfo[0], colorBarInfo[1], colorBarInfo[2]);
  rect(990, 390, (float)(140 * motor4), 40);
  
  //servo background
  fill(colorBarBackground[0], colorBarBackground[1], colorBarBackground[2]);
  rect(850, 455, 280, 40);
  
  //servo bar
  fill(colorBarInfo[0], colorBarInfo[1], colorBarInfo[2]);
  rect(850 + (float)(280 * (servo4/180)), 455, 5, 40); 
  rect(850 + (float)(280 * (servo4/180)), 455, -5, 40);
}
