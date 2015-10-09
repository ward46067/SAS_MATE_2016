
void updateModeButton(){
  for(int i = 0; i < 3; i ++){
    if(mx() >= modeButtonXY[i][0] && mx() <= modeButtonXY[i][0] + width && my() >= modeButtonXY[i][1] && my() <= modeButtonXY[i][1] + height){
      modeButtonHover[i] = true;
    }
    else {
      modeButtonHover[i] = false;
    }
  }
}

void drawModeButton(){
  updateModeButton();
  
  for(int i = 0; i < 3; i++){
    if(modeButtonHover[i] == true){
      fill(colorButtonHover[0], colorButtonHover[1], colorButtonHover[2]);
    }
    else {
      fill(colorButton[0], colorButton[1], colorButton[2]);
    }
    
    stroke(0);
    rect(modeButtonXY[i][0], modeButtonXY[i][1], modeButtonWH[i][0], modeButtonWH[i][1]);
  }
}




