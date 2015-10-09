void drawModeButton(){
  updateModeButton();
  
  for(int i = 0; i < 3; i++){
    if(modeButtonHover[i]){
      fill(colorButtonHover[0], colorButtonHover[1], colorButtonHover[2]);
    }
    else if(modeButtonHover[i] == false && modeButtonSelected[i] == false){
      fill(colorButton[0], colorButton[1], colorButton[2]);
    }
    rect(modeButtonXY[i][0], modeButtonXY[i][1], modeButtonWH[i][0], modeButtonWH[i][1]);
  }
}
void mousePressed(){
  for(int i = 0; i < 3; i++){
    if(modeButtonHover[i]){
      modeButtonSelected[0] = false;
      modeButtonSelected[1] = false;
      modeButtonSelected[2] = false;
      
      modeButtonSelected[i] = true;
    }
  }
  getMode();
}
void updateModeButton(){
  for(int i = 0; i < 3; i ++){
    if(mx() >= modeButtonXY[i][0] && mx() <= modeButtonXY[i][0] + modeButtonWH[i][0] && my() >= modeButtonXY[i][1] && my() <= modeButtonXY[i][1] + modeButtonWH[i][1]){
      modeButtonHover[i] = true;
    }
    else {
      modeButtonHover[i] = false;
    }
  }
}




