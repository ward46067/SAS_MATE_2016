void drawWindowMode(){
  
  windowMode = new GWindow[1];
  
  windowMode[0] = new GWindow(this, "Choose Mode", 300, 200, 400, 150, false, JAVA2D);
  windowMode[0].setBackground(128);
  windowMode[0].addData(new winModeData());
  windowMode[0].addDrawHandler(this, "windowDraw");
  //windowMode[0].addMouseHandler(this, "windowMouse");
  
  
  
}
/*
void windowMouse(GWinApplet appc, GWinData winData, MouseEvent event){
  winModeData data = (winModeData)winData;
  
  
}
*/
void windowDraw(GWinApplet appc, GWinData winData){
  winModeData data = (winModeData)winData;
  
  appc.fill(255, 0, 0);
  appc.rect(0, 0, 50, 50);
}

class winModeData extends GWinData {
  int sx, sy, ex, ey;
  boolean done;
}

