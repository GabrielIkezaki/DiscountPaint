public class IncreaseArrow extends UIButton{          //This button increases the value of one of the RGB values of the brush. 
  int colorType;
  int additioner = 1;        //The value will always be increased by 1
  Brush localBrush;        //This will store the user brush
  EmptyButton colorButton;      //The colorButton is the display box that reads the RGB value of a pack
  
  public IncreaseArrow(int tempXPos, int tempYPos, int tempXRect, int tempYRect, color tempBorder, color tempFill, String tempText, Brush brush, color invis, int tempColor, EmptyButton tempButton){
       super(tempXPos, tempYPos, tempXRect, tempYRect, tempBorder, tempFill, tempText, invis);
       localBrush = brush;
       colorType = tempColor;
       colorButton = tempButton;
  }
  protected void OnClick(){
    print("ARROW");
    
      switch(colorType){
        case 0:
        if(red(localBrush.currentColor) < 255){      //As long as the current RGB value is less than 255, this button will increase the specified RGB value 
          localBrush.currentColor = color(red(localBrush.currentColor) + additioner, green(localBrush.currentColor), blue(localBrush.currentColor));
          colorButton.UpdateColor(1);      //The display text of the specified RGB value will be increased accordingly
        }
          break;
        case 1:
        if(green(localBrush.currentColor) < 255){
          localBrush.currentColor = color(red(localBrush.currentColor), green(localBrush.currentColor) + additioner, blue(localBrush.currentColor));
          colorButton.UpdateColor(1);
        }
          break;
        case 2:
        if(blue(localBrush.currentColor) < 255){
          localBrush.currentColor = color(red(localBrush.currentColor), green(localBrush.currentColor), blue(localBrush.currentColor) + additioner);
          colorButton.UpdateColor(1);
        }
          break;        
      }

      colorButton.display();        //The colorbutton text will be updated to match the new RGB value
  }     
}
