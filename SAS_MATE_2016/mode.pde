void getMode(){
  
  fill(colorButtonSelected[0], colorButtonSelected[1], colorButtonSelected[2]);
      
  if(modeButtonSelected[0]){
    rect(modeButtonXY[0][0], modeButtonXY[0][1], modeButtonWH[0][0], modeButtonWH[0][1]);
    outputLog.println(datetime() + " --> " + "Mode " + (0 + 1));
    //mode1();
  }
  else if(modeButtonSelected[1]){
    rect(modeButtonXY[1][0], modeButtonXY[1][1], modeButtonWH[1][0], modeButtonWH[1][1]);
    outputLog.println(datetime() + " --> " + "Mode " + (1 + 1));
    mode2();
  }
  else if(modeButtonSelected[2]){
    rect(modeButtonXY[2][0], modeButtonXY[2][1], modeButtonWH[2][0], modeButtonWH[2][1]);
    outputLog.println(datetime() + " --> " + "Mode " + (2 + 1));
    mode3();
  }
}
void mode1(){
  
  try {
    //set proper names to device buttons
    joystick.setTolerance(0.15f); 
    
    sliderX = joystick.getSlider(1); //joystick left and right
    sliderZ = joystick.getSlider(0); //joystick up and down
    buttonBoost = joystick.getButton(0); //boost trigger
    sliderRotation = joystick.getSlider(2); //joystick rotation
    buttonElevation = joystick.getButton(5); //elevation toggle
    
    throttle.setTolerance(0.15f);//deadzone
    sliderSensitivity = throttle.getSlider(0); //sensitivity
    
    println("Here");
    //device.printSliders();
  }
  catch(Exception e) {
    println("error");
  }
}

void mode2(){
  try {
     joystick.setTolerance(0.15f); 
    sliderX = joystick.getSlider(0); //joystick left and right
    sliderZ = joystick.getSlider(1);
  } catch (Exception e) {
    println("Error while aquiring joystick!"); 
  } 
  
}

void mode3(){
  
}
