public class BrushButton extends UIButton{
  
    BrushType buttonType;        //This is the brush type to which the brush will change upon clicking this button
    Brush localBrush;        //Will reference the currentBrush class, which is declared in the DiscountPaint file
    
    public BrushButton(int tempXPos, int tempYPos, int tempXRect, int tempYRect, color tempBorder, color tempFill, String tempText, BrushType tempBrush, Brush brush){  
      super(tempXPos, tempYPos, tempXRect, tempYRect, tempBorder, tempFill, tempText);      //Because the UIButton class requires parameters, we need to specify that the child class will inherit the parameters with the "super" keyword.
      buttonType = tempBrush;        //Now I'm defining (through encapsulation) what the button type will switch to once this button is pressed
      localBrush = brush;          //In this line, I'm referencing the currentBrush. I will be using localBrush whenever I want to change an attribute from the currentBrush
  }  
  
  protected void OnClick(){
    localBrush.SetType(buttonType);      //This line switches the currentBrush type to whatever was specified in this class' parameters
  }

}
