void mathSensitivity() {
  //calculate sensitivity
  if(sensitivity <= 0.2){
    sensitivity = 0.2;
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
