//start
void setup(){
  size(width, height); //resolution 
  
  font = loadFont("font.vlw");
  
  lastSend = millis();
  
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
  
  //check for arduinos
  controll = ControllIO.getInstance(this);
  if (Serial.list().length < 1) { //none
     println("No Arduinos detected!");
     outputLog.println(datetime() + "--> ERROR: No Arduinos detected!"); 
  }
  else if (Serial.list().length > 1) {// mutiple
    println("Multiple serial interfaces detected!");
    outputLog.println(datetime() + "--> ERROR: Multiple serial interfaces detected!"); 
  }
  else {//one
    port = new Serial(this, Serial.list()[0], 9600); //9600 is the communication rate
    connectedArduino = true;
    outputLog.println(datetime() + "--> Arduino connected");
    
  }
  
  //check for devices
  for (int i = 0; i < controll.getNumberOfDevices(); i++) {//loop until it gets preffered device
     if (controll.getDevice(i).getName().equals("Saitek X52 Flight Control System")) { //find actual controller with matching name //name is found in "Printers and Devices"
        device = controll.getDevice(i);
        connectedJoystick = true;
        outputLog.println(month() + "/" + day() + "/" + year() + " " + hour() + ":" + minute() + ":" + second() + "--> Joystick connected");
     }
  }
  try {
    //set proper names to device buttones
    device.setTolerance(0.15f); //deadzone
    sliderX = device.getSlider(0); //joystick left and right
    sliderZ = device.getSlider(1); //joystick up and down
    buttonBoost = device.getButton(0); //boost trigger
    sliderSensitivity = device.getSlider(3); //sensitivity
    sliderRotation = device.getSlider(2); //joystick rotation
    buttonElevation = device.getButton(5); //elevation toggle
    
    //device.printSliders();
    
    
  } catch (Exception e) {
    println("Error while aquiring joystick!"); 
  } 
  
  //xml
  loadXML();
  
  draw(); 
}

