void equations() {
 try { //math for motor and servo values //surrouned in a try/catch statement incase of errors
 
  x = sliderX.getValue();
  z = sliderZ.getValue();
  
  }
  catch (Exception e) {
    if (!jsError) {
      jsError = true;
      println("Error while polling joystick values!");
    }
  }
  
  z *= -1; //negative to correct numbers
    
  if(y == 0) {
    servo1 = 90;
    servo2 = 90;
    servo3 = 90;
    servo4 = 90;
  }

  if(x == 0) {
    motor1x = 0;
    motor2x = 0;
    motor3x = 0;
    motor4x = 0;
  }

  if(z == 0) {
    motor1z = 0;
    motor2z = 0;
    motor3z = 0;
    motor4z = 0;
  }

  if(x < 0) {
    motor1x = x;
    motor2x = -1 * x;
    motor3x = -1 * x;
    motor4x = x;
    
  }

  if(x > 0) {
    motor1x = x;
    motor2x = -1 * x;
    motor3x = -1 * x;
    motor4x = x;
  }

  if(z > 0) {
    motor1z = -1 * z;
    motor2z = -1 * z;
    motor3z = z;
    motor4z = z;
  }

  if(z < 0) {
    motor1z = -1 * z;
    motor2z = -1 * z;
    motor3z = z;
    motor4z = z;
  }

  motor1 = motor1x + motor1z;
  motor2 = motor2x + motor2z;
  motor3 = motor3x + motor3z;
  motor4 = motor4x + motor4z;

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
  
  //calculate motor output
  m1 = (int)(motor1 * 127);
  m2 = (int)(motor2 * 127);
  m3 = (int)(motor3 * 127);
  m4 = (int)(motor4 * 127);
  
  //calculate servo output
  s1 = (int)(servo1);
  s2 = (int)(servo2);
  s3 = (int)(servo3);
  s4 = (int)(servo4);
   //send motor output
  if ( millis() - lastSend > 100) { //minimum time between msg = 100ms
    lastSend = millis();
    printToArduino(m1, m1, m3, m4, s1, s2, s3, s4); 
    
    if (commsError) { //if not connected, attempt reconnect
       if (Serial.list().length == 1) {
        port = new Serial(this, Serial.list()[0], 9600);
        commsError = false;
       }
    }
    
  } 
}
