void draw(){
  
  //backdrop colors
  fill(170, 116, 57);
  rect(0, 0, width, height);
  
  equations();

  textAlign(CENTER, BOTTOM);
  
  // title
  fill(255, 214, 170);
  rect(0, 0, width, height/6);
  textFont(font, 30);
  fill(39,88,107);
  text("MATE Control 2016", 600, 50);
  
  //debug
  fill(85, 44, 0);
  rect(width-width/8, height-height/10, width/8, height/10);
  fill(109, 146, 160);
  //debug title
  textFont(font, 15);
  text("Debug", width-width/16, height-height/15);
  //debug gore
  textFont(font, 10);
  text("Output: " + 'T' + hex(m1,2) + hex(m2,2) + hex(m3,2) + hex(m4,2) + hex(s1,2) + hex(s3,2) + hex(s3,2) + hex(s4,2), width-width/16, height-height/22);
  
  //xy graph
  fill(212, 208, 106);
  rect(50, 150, 200, 200);
  //display joystick x y
  line(150, 250, 150 + x * 50, 250 + x * 150);
  fill(255, 0, 0);
  //ellipse(); 
  
  //text
  textFont(font, 18);
  fill(39,88,107);
}
