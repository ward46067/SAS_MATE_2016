void loadXML() {
  
  /*
  colorPalette[primary/complement/secondary][color range][r/g/b]
  
  for this xml sheet
  
  color Palette[primary/secondary-1/secondary-2][color 1-5][r/g/b]
  */
  
  //load xml
  colorXML = loadXML("palette.xml");
  
  //load xml children
  colorset = colorXML.getChildren("colorset");
  xmlURL = colorXML.getChild("url");
  paletteURL = xmlURL.getContent();
  
  //get all xml values
  for(int i = 0; i < colorset.length; i++) {
    xmlID = colorset[i].getString("id");
    
    colorsetChild = colorset[i].getChildren("color");
    
    for(int x = 0; x < colorsetChild.length; x++) {
      colorPalette[i][x][0] = colorsetChild[x].getInt("r");
      colorPalette[i][x][1] = colorsetChild[x].getInt("g");
      colorPalette[i][x][2] = colorsetChild[x].getInt("b");
    }
  }
  
  //set colors
  for(int i = 0; i < 3; i++) { //loop 3 times for rgb
  
    colorText[i] = colorPalette[3][0][i];
    
    colorBackground[i] = colorPalette[0][0][i];
    
    colorTitleBackground[i] = colorPalette[0][1][i];
    
    colorMotorBackground[i] = colorPalette[0][2][i];
    
    colorBarBackground[i] = colorPalette[1][2][i];
    colorBarInfo[i] = colorPalette[2][0][i];
    
    colorDebugBackground[i] = colorPalette[0][4][i];
    colorDebugText[i] = colorPalette[3][1][i];
  }
  
}
