void log() {
  outputLog.println(datetime() + " --> " + 'T' + hexOut());
  motor1Log.println(datetime() + " --> " + "1, " + servo1 + ", " + motor1 + " PWM Signal: " + m1);
  motor2Log.println(datetime() + " --> " + "2, " + servo2 + ", " + motor2 + " PWM Signal: " + m2);
  motor3Log.println(datetime() + " --> " + "3, " + servo3 + ", " + motor3 + " PWM Signal: " + m3);
  motor4Log.println(datetime() + " --> " + "4, " + servo4 + ", " + motor4 + " PWM Signal: " + m4);
  
  outputLog.flush();
  motor1Log.flush();
  motor2Log.flush();
  motor3Log.flush();
  motor4Log.flush();
}
