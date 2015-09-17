void draw(){
  
    //backdrop colors
  fill(191, 144, 46);
  rect(0, 0, width, height/2);
  fill(46, 144, 191);
  rect(0, height/2, width, height/2);
  
  textAlign(CENTER, BOTTOM);
   //show text
  textFont(bigfont, 18);
  
  equations();
  
  
  
  String textX = Double.toString(x);
  String textZ = Double.toString(z);
  
  //text
  fill(0,255,0);
  text("X: " + textX, 227, 100);
  text("Z: " + textZ, 425, 100);
  
  
}
