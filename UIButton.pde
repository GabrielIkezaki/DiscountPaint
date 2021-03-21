public class UIButton{          //The button class will be a parent. Every button will share similar (but not identical) behaviors, which is why I decided to create a base class for all buttons
  
  String text;        //This text will be displayed inside the button
  int xPos, yPos, xRect, yRect;      //xPos, yPos = central X and Y coordinates of the button || xRect,yRect = the length and width of the button
  color borderColor, fillColor;
  
  public UIButton(int tempXPos, int tempYPos, int tempXRect, int tempYRect, color tempBorder, color tempFill, String tempText){        //All variables will be defined through these parameters
    xPos = tempXPos;
    yPos = tempYPos;
    xRect = tempXRect;
    yRect = tempYRect;
    
    borderColor = tempBorder;
    fillColor = tempFill;
    
    text = tempText;
    
    DrawButton(borderColor, fillColor);      //The DrawButton function, as implied by its name, will display the actual button on the screen, and will be called as soon as the button is first initialized
    
  }
  
  void DrawButton(color tempBorder, color tempFill){
    strokeWeight(5);    //The strokeWeight will define the thickness of the border of the button
    stroke(tempBorder);     //This line defines the color of the button border
    fill(tempFill);        //On the other hand, this line will color the inner part of the button
    
    quad((xPos - xRect), (yPos-yRect), (xPos + xRect), (yPos-yRect), (xPos + xRect), (yPos + yRect), (xPos - xRect), (yPos + yRect));      //The button will be a quadrilateral shape
    
    textAlign(CENTER, CENTER);        //This line makes it so that the text is centered with the x and y positions of the button
    textSize(24);              //Defining the font size
    fill(tempBorder);          //Definiing the font color (same as the border)
    text(text,xPos, yPos);      //Displaying the text at (xPos, yPos)
  }
  
  protected void OnClick(){}       //This function isn't defined in the parent class, because the idea is that each button will do something different upon being clicked. Therefore, all children will override this method.
  
  void CheckClick(){        //Every time the mouse is released, this function will be called
    if(mouseX < (xPos + xRect) && mouseX > (xPos - xRect) && mouseY > (yPos-yRect) && mouseY<(yPos+yRect)){        //This lines checks if the mouse is within the button's area
      OnClick();      //If it is, the OnClick function will be called
    }
  }
  
  void display(){
    DrawButton(borderColor, fillColor);  
  }
}
