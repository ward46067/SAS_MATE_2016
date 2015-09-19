void draw(){
  
    //backdrop colors
  fill(170, 116, 57);
  rect(0, 0, width, height);
  
  fill(255, 214, 170);
  rect(0, 0, width, height/6);
  
  textAlign(CENTER, BOTTOM);
  //show title
  textFont(font, 30);
  fill(39,88,107);
  text("MATE Control 2016", 600, 50);
  
   //show text
  textFont(font, 18);
  
  equations();
  
  
  
  String textX = Double.toString(x);
  String textZ = Double.toString(z);
  
  //text
  fill(39,88,107);
  text("X: " + textX, 227, 100);
  text("Z: " + textZ, 425, 100);
  
  
  
}
