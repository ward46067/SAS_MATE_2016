void math() {
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
  
  mathSpeed();
  mathElevation();
  mathSensitivity();
  
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
 log();
}