//start
void setup(){
  size(width, height); //resolution 
  
  font = loadFont("font.vlw");
  
  lastSend = millis();
  
  createFiles();
  
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
  
  connectDevice();

  try {
    throttle.setTolerance(0.15f);//deadzone
    buttonMode = throttle.getButton(5); //get the mode value
    
    
   
  } catch (Exception e) {
    println("Error while aquiring joystick!"); 
  } 
  
  //set button location and width and hover
  for(int i = 0; i < 3; i++){
    modeButtonXY[i][0] = ((i * 100) + 900); //x
    modeButtonXY[i][1] = 45; //y
    
    modeButtonWH[i][0] = 90; //width
    modeButtonWH[i][1] = 50; //height
    
    modeButtonHover[i] = false;
  }
  
  
  //xml
  loadXML();
  
  draw(); 
}

void connectDevice(){
  //check for devices
  for (int i = 0; i < controll.getNumberOfDevices(); i++) {//loop until it gets preffered device
     if (controll.getDevice(i).getName().equals("Saitek Pro Flight X-55 Rhino Stick")) { //find actual controller with matching name //name is found in "Printers and Devices"
        joystick = controll.getDevice("Saitek Pro Flight X-55 Rhino Stick");
        connectedJoystick = true;
        println("Joystick Connected");
        outputLog.println(month() + "/" + day() + "/" + year() + " " + hour() + ":" + minute() + ":" + second() + "--> Joystick connected");
     }
     
     if (controll.getDevice(i).getName().equals("Saitek Pro Flight X-55 Rhino Throttle")) { //find actual controller with matching name //name is found in "Printers and Devices"
        throttle = controll.getDevice("Saitek Pro Flight X-55 Rhino Throttle");
        connectedThrottle = true;
        println("Throttle Connected");
        outputLog.println(month() + "/" + day() + "/" + year() + " " + hour() + ":" + minute() + ":" + second() + "--> Throttle connected");
     }
     
  }
  
  if(connectedJoystick && connectedThrottle){
    connectedDevice = true;
  }
}

void createFiles() {
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

