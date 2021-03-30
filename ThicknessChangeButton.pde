public class ThicknessChangeButton extends UIButton{
  
  boolean addMode;  //Add mode determines whether this button will add or subtract from the current brush thickness
  Brush localBrush;
  public ThicknessChangeButton(int tempXPos, int tempYPos, int tempXRect, int tempYRect, color tempBorder, color tempFill, String tempText, color eraseColor, Brush brush, boolean willIncrease){
    super(tempXPos, tempYPos, tempXRect, tempYRect, tempBorder, tempFill, tempText, eraseColor);
    localBrush = brush;
    addMode = willIncrease;
  }
  
    protected void DrawButton(color tempBorder, color tempFill){
    strokeWeight(5);    //The strokeWeight will define the thickness of the border of the button
    stroke(tempBorder);     //This line defines the color of the button border
    fill(tempFill);        //On the other hand, this line will color the inner part of the button
    
    quad((xPos - xRect), (yPos-yRect), (xPos + xRect), (yPos-yRect), (xPos + xRect), (yPos + yRect), (xPos - xRect), (yPos + yRect));      //The button will be a quadrilateral shape
    
    textAlign(CENTER, CENTER);        //This line makes it so that the text is centered with the x and y positions of the button
    textSize(16);              //Defining the font size
    fill(tempBorder);          //Definiing the font color (same as the border)
    text(text,xPos, yPos);      //Displaying the text at (xPos, yPos)
  }
  
  
  
  protected void OnClick(){
    if(addMode){  
      localBrush.thickness += 2;    //If addMode is set to be true, it will increase the brush size
    }else{
      if(localBrush.thickness > 2){
        localBrush.thickness -= 2;    //If addMode is false, it will decrease it
      }
    }
  }
}
