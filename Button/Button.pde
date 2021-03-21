class UIButton{
  
  int xPos, yPos, xRect, yRect;
  color borderColor, fillColor;
  
  UIButton(int tempXPos, int tempYPos, int tempXRect, int tempYRect, color tempBorder, color tempFill){
    xPos = tempXPos;
    yPos = tempYPos;
    xRect = tempXRect;
    yRect = tempYRect;
    
    borderColor = tempBorder;
    fillColor = tempFill;
    
    DrawButton(borderColor, fillColor);
    
  }
  
  void DrawButton(color tempBorder, color tempFill){
    stroke(tempBorder); 
    fill(tempFill);
    
    quad((xPos - xRect), (yPos-yRect), (xPos + xRect), (yPos-yRect), (xPos + xRect), (yPos + yRect), (xPos - xRect), (yPos + yRect));
  }
  
  
}
