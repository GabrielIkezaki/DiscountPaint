public class CurrentColorDisplay extends UIButton{        //This will be a large square which will display the current brush color. It behaves like a button, although it can't be clicked
  Brush brush;
      public CurrentColorDisplay(int tempXPos, int tempYPos, int tempXRect, int tempYRect, color tempBorder, color tempFill, String tempText, Brush tempBrush, color invis){
        super(tempXPos, tempYPos, tempXRect, tempYRect, tempBorder, tempFill, tempText, invis);
        brush = tempBrush;
      }
      
      protected void display(){
          stroke(saveButtonBorder);
          fill(brush.currentColor);
          square(xPos- 50 , yPos - 50, xRect*2);    //This line draws a square and fills it with the current brush color
      }
}
