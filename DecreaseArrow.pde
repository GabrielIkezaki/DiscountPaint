public class DecreaseArrow extends UIButton{ //The DecreaseArrow behaves exactly like the IncreaseArrow, except that it decreases the specified RGB value
  int colorType;
  int additioner = 1;
  Brush localBrush;
  EmptyButton colorButton;

  
  public DecreaseArrow(int tempXPos, int tempYPos, int tempXRect, int tempYRect, color tempBorder, color tempFill, String tempText, Brush brush, color invis, int tempColor, EmptyButton tempButton){
       super(tempXPos, tempYPos, tempXRect, tempYRect, tempBorder, tempFill, tempText, invis);
       localBrush = brush;
       colorType = tempColor;
       colorButton = tempButton;

  }
  protected void OnClick(){
    print("DECREASE");
    
      switch(colorType){
        case 0:
        if(red(localBrush.currentColor) > 0){    //In order for the RGBValue to be decreased, it has to be more than 0
          localBrush.currentColor = color(red(localBrush.currentColor) - additioner, green(localBrush.currentColor), blue(localBrush.currentColor));
          colorButton.UpdateColor(-1);
        }
          break;
        case 1:
        if(green(localBrush.currentColor) > 0){
          localBrush.currentColor = color(red(localBrush.currentColor), green(localBrush.currentColor) - additioner, blue(localBrush.currentColor));
          colorButton.UpdateColor(-1);
        }
          break;
        case 2:
        if(blue(localBrush.currentColor) > 0){
          localBrush.currentColor = color(red(localBrush.currentColor), green(localBrush.currentColor), blue(localBrush.currentColor) - additioner);
          colorButton.UpdateColor(-1);
        }
          break;        
      }
   
      colorButton.display();

  }     
}
