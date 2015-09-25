void mathSensitivity() {
  //calculate sensitivity
  sensitivity *= -1;
  sensitivity += 1;
  sensitivity /= 2;
  
  //sensitivity percentage
  sensitivityPercent = sensitivity * 100 + "%";
  
  //boost
  if(boost == 8) {
    sensitivity = 1;
  }
  
  
  
  
  //multiply sensitivity
  x *= sensitivity;
  y *= sensitivity;
  z *= sensitivity;
  motor1 *= sensitivity;
  motor2 *= sensitivity;
  motor3 *= sensitivity;
  motor4 *= sensitivity;
  
  
}
