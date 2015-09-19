//start
void setup(){
  size(width, height); //resolution 
  
  font = loadFont("font.vlw");
  
  lastSend = millis();
  
  //check for arduinos
  controll = ControllIO.getInstance(this);
  if (Serial.list().length < 1) { //none
     println("No Arduinos detected!");
  }
  else if (Serial.list().length > 1) {// mutiple
     println("Multiple serial interfaces detected!"); 
  }
  else {//one
    port = new Serial(this, Serial.list()[0], 9600);
    commsError = false;
  }
  
  //check for devices
  for (int i = 0; i < controll.getNumberOfDevices(); i++) {//loop until it gets preffered device
     if (controll.getDevice(i).getName().equals("Saitek X52 Flight Control System")) { //find actual controller with matching name
        device = controll.getDevice(i);
        jsError = false;
     }
  }
  try {
    //set proper names to device buttones
    device.setTolerance(0.15f); //deadzone
    sliderX = device.getSlider(0);
    sliderZ = device.getSlider(1);
    
  } catch (Exception e) {
    println("Error while aquiring joystick!"); 
  }
  
  //delete previous log files
  String outputLogFileName = dataPath("log/outputLog.txt");
  String motor1LogFileName = dataPath("log/motor1Log.txt");
  String motor2LogFileName = dataPath("log/motor2Log.txt");
  String motor3LogFileName = dataPath("log/motor3Log.txt");
  String motor4LogFileName= dataPath("log/motor4Log.txt");
  
  File outputLogFile = new File(outputLogFileName);
  File motor1LogFile = new File(motor1LogFileName);
  File motor2LogFile = new File(motor2LogFileName);
  File motor3LogFile = new File(motor3LogFileName);
  File motor4LogFile = new File(motor4LogFileName);
  
  if(outputLogFile.exists()) {
    outputLogFile.delete();
  }
  if(motor1LogFile.exists()) {
    motor1LogFile.delete();
  }
  if(motor2LogFile.exists()) {
    motor2LogFile.delete();
  }
  if(motor3LogFile.exists()) {
    motor3LogFile.delete();
  }
  if(motor4LogFile.exists()) {
    motor4LogFile.delete();
  }
  
  //log variables
  outputLog = createWriter("log/outputLog.txt");
  motor1Log = createWriter("log/motor1Log.txt");
  motor2Log = createWriter("log/motor2Log.txt");
  motor3Log = createWriter("log/motor3Log.txt");
  motor4Log = createWriter("log/motor4Log.txt");
  
  
}

