void log(){
  outputLog.println(month + "/" + day + "/" + year + " " + hour + ":" + minute + ":" + second + "::" + millis + " --> " + 'T' + hex(m1,2) + hex(m2,2) + hex(m3,2) + hex(m4,2) + hex(s1,2) + hex(s3,2) + hex(s3,2) + hex(s4,2));
  motor1Log.println(month + "/" + day + "/" + year + " " + hour + ":" + minute + ":" + second + "::" + millis + " --> " + "1, " + servo1 + ", " + motor1);
  motor2Log.println(month + "/" + day + "/" + year + " " + hour + ":" + minute + ":" + second + "::" + millis + " --> " + "2, " + servo2 + ", " + motor2);
  motor3Log.println(month + "/" + day + "/" + year + " " + hour + ":" + minute + ":" + second + "::" + millis + " --> " + "3, " + servo3 + ", " + motor3);
  motor4Log.println(month + "/" + day + "/" + year + " " + hour + ":" + minute + ":" + second + "::" + millis + " --> " + "4, " + servo4 + ", " + motor4);
}
