void getMode(){
  mode = buttonMode.getValue();
  
  if(mode > 0)
    println(mode);
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
    
    
    //device.printSliders();
    
    
  } catch (Exception e) {
    println("Error while aquiring joystick!"); 
  } 
  
}

void mode2(){
  
}

void mode3(){
  
}
