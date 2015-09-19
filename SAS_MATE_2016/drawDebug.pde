void drawDebug() {
  
  fill(85, 44, 0);
  rect(1025, 550, 250, 50);
  
  //debug title
  fill(109, 146, 160);
  textAlign(CENTER, BOTTOM);
  textFont(font, 15);
  text("Debug", 1200 - 175/2, 575);
  //debug gore
  textFont(font, 10);
  text("Output: " + 'T' + hex(m1,2) + hex(m2,2) + hex(m3,2) + hex(m4,2) + hex(s1,2) + hex(s3,2) + hex(s3,2) + hex(s4,2), 1200 - 175/2, 595);
}
