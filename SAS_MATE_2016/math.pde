void math() {
  try { //math for motor and servo values //surrouned in a try/catch statement incase of errors
  
  
  
  x = sliderX.getValue();
  z = sliderZ.getValue();
  boost = buttonBoost.getValue();
  sensitivity = sliderSensitivity.getValue();
  
  
  
  }
  catch (Exception e) {
    if (connectedJoystick) {
      connectedJoystick = false;
      println("Error while polling joystick values!");
    }
  }
  
  z *= -1; //negative to correct numbers
  
  println(x);
  
  mathSpeed();
  mathElevation();
  mathSensitivity();
  
  
  //calculate motor output
  m1 = (int)(motor1 * 127) + 127;
  m2 = (int)(motor2 * 127) + 127;
  m3 = (int)(motor3 * 127) + 127;
  m4 = (int)(motor4 * 127) + 127;
  
  //calculate servo output
  s1 = (int)(x * 90) + 90;
  s2 = (int)(servo2);
  s3 = (int)(servo3);
  s4 = (int)(servo4);
  
 
  
  
  //send motor output
  if ( millis() - lastSend > 10) { //send 100 times per seconed
    lastSend = millis();
    log();
    printToArduino(); 
    
    if (!connectedArduino) { //if not connected, attempt reconnect
       if (Serial.list().length == 1) {
        port = new Serial(this, Serial.list()[0], 9600);
        connectedArduino = true;
       }
    }
    
  }
 
}
