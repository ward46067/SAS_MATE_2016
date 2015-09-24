void loadXML() {
  
  //load xml
  colorXML = loadXML("palette.xml");
  
  //load xml children
  colorset = colorXML.getChildren("colorset");
  
  //get all xml values
  for(int i = 0; i < 4; i++) {
    xmlID = colorset[i].getString("id");
    
    //primary colors
    if(xmlID .equals("primary")) {
      primaryChild = colorset[i].getChildren("color");
      for(int x = 0; x < 5; x++) {
        primary[x][0] = primaryChild[x].getInt("r");
        primary[x][1] = primaryChild[x].getInt("g");
        primary[x][2] = primaryChild[x].getInt("b");
      }
    }
    
    //secondary1 colors
    if(xmlID .equals("secondary-1")) {
      second1Child = colorset[i].getChildren("color");
      for(int x = 0; x < 5; x++) {
        second1[x][0] = second1Child[x].getInt("r");
        second1[x][1] = second1Child[x].getInt("g");
        second1[x][2] = second1Child[x].getInt("b");
      }
    }
    
    //secondary2 colors
    if(xmlID .equals("secondary-2")) {
      second2Child = colorset[i].getChildren("color");
      for(int x = 0; x < 5; x++) {
        second2[x][0] = second2Child[x].getInt("r");
        second2[x][1] = second2Child[x].getInt("g");
        second2[x][2] = second2Child[x].getInt("b");
      }
    }
    
    //secondary3 colors
    if(xmlID .equals("complement")) {
      complementChild = colorset[i].getChildren("color");
      for(int x = 0; x < 5; x++) {
        complement[x][0] = complementChild[x].getInt("r");
        complement[x][1] = complementChild[x].getInt("g");
        complement[x][2] = complementChild[x].getInt("b");
      }
    }
    
  }
  
  //set colors
  for(int i = 0; i < 3; i++) { //loop 3 times for rgb
  
    colorText[i] = complement[0][i];
    
    colorBackground[i] = primary[0][i];
    
    colorTitleBackground[i] = primary[1][i];
    
    colorMotorBackground[i] = primary[2][i];
    
    colorBarBackground[i] = second1[2][i];
    colorBarInfo[i] = second2[0][i];
    
    colorDebugBackground[i] = primary[4][i];
    colorDebugText[i] = complement[1][i];
  }
  
}
