void mathElevationToggle() {
  
  if(elevationToggle > 0) {
    y = rotation;
  }
  else
    y = y; //leave y to its past value so you don't have to hold down the button
    
  
}

void mathElevationServo() {
  
  if(y == 0) {
    servo1 = 90;
    servo2 = 90;
    servo3 = 90;
    servo4 = 90;
  }
  
  if(y > 0) {
      
      if(motor1 > 0)
          servo1 = ((motor1 + y)/2) * 90;
      if(motor2 > 0)
          servo2 = ((motor2 + y)/2) * 90;
      if(motor3 > 0)
          servo3 = ((motor3 + y)/2) * 90;
      if(motor4 > 0)
          servo4 = ((motor4 + y)/2) * 90;
      
      if(motor1 < 0)
          servo1 = (((-motor1 + y)/2) * 90) + 90;
      if(motor2 < 0)
          servo2 = (((-motor2 + y)/2) * 90) + 90;
      if(motor3 < 0)
          servo3 = (((-motor3 + y)/2) * 90) + 90;
      if(motor4 < 0)
          servo4 = (((-motor4 + y)/2) * 90) + 90;
      
      if(motor1 == 0){
          servo1 = 90 - (y *90);
          motor1 = y;
      }
      if(motor2 == 0){
          servo2 = 90 - (y *90);
          motor2 = y;
      }
      if(motor3 == 0){
          servo3 = 90 - (y *90);
          motor3 = y;
      }
      if(motor4 == 0){
          servo4 = 90 - (y *90);
          motor4 = y;
      }
  }
  
  if(y < 0) {
      
      if(motor1 > 0)
          servo1 = (((motor1 + y)/2) * 90) + 90;
      if(motor2 > 0)
          servo2 = (((motor2 + y)/2) * 90) + 90;
      if(motor3 > 0)
          servo3 = (((motor3 + y)/2) * 90) + 90;
      if(motor4 > 0)
          servo4 = (((motor4 + y)/2) * 90) + 90;
      
      if(motor1 < 0)
          servo1 = ((-motor1 + y)/2) * 90;
      if(motor2 < 0)
          servo2 = ((-motor2 + y)/2) * 90;
      if(motor3 < 0)
          servo3 = ((-motor3 + y)/2) * 90;
      if(motor4 < 0)
          servo4 = ((-motor4 + y)/2) * 90;
      
      if(motor1 == 0){
          servo1 = (y * 90) + 90;
          motor1 = -y;
      }
      if(motor2 == 0){
          servo2 = (y * 90) + 90;
          motor2 = -y;
      }
      if(motor3 == 0){
          servo3 = (y * 90) + 90;
          motor3 = -y;
      }
      if(motor4 == 0){
          servo4 = (y * 90) + 90;
          motor4 = -y;
      }
    
  }
}
