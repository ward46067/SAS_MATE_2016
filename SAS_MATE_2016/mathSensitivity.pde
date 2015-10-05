void mathSensitivity() {
  //calculate sensitivity
  sensitivity *= -1;
  sensitivity += 1;
  sensitivity /= 2;
  
  if(sensitivity < 0.25)
    sensitivity = 0.25;
  
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
  rotation *= sensitivity;
}
