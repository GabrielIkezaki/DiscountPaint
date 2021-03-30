public class BrushButton extends UIButton{
  
    String imageAddress;  
    PImage icon;  //Added icones for the brush buttons, effectively replacing letters
    BrushType buttonType;        //This is the brush type to which the brush will change upon clicking this button
    Brush localBrush;        //Will reference the currentBrush class, which is declared in the DiscountPaint file
    
    public BrushButton(int tempXPos, int tempYPos, int tempXRect, int tempYRect, color tempBorder, color tempFill, String tempText, BrushType tempBrush, Brush brush, color invis){  
      super(tempXPos, tempYPos, tempXRect, tempYRect, tempBorder, tempFill, tempText, invis);      //Because the UIButton class requires parameters, we need to specify that the child class will inherit the parameters with the "super" keyword.
      buttonType = tempBrush;        //Now I'm defining (through encapsulation) what the button type will switch to once this button is pressed
      localBrush = brush;          //In this line, I'm referencing the currentBrush. I will be using localBrush whenever I want to change an attribute from the currentBrush
      imageAddress = tempText;
      icon = loadImage(imageAddress);      //This line defines what the icon variable will load from the data folder
      image(icon, xPos - 25, yPos - 25, 50, 50);    //This line draw the specified icon image
      //print(tempText);
  }  
  
  protected void OnClick(){
    localBrush.SetType(buttonType);      //This line switches the currentBrush type to whatever was specified in this class' parameters
  }


  protected void display(){

      DrawButton(borderColor, fillColor);   
      image(icon, xPos - 25, yPos - 25, 50, 50);
  }
  
  protected void DrawButton(color tempBorder, color tempFill){
    PImage img;  
    strokeWeight(5);    //The strokeWeight will define the thickness of the border of the button
    stroke(tempBorder);     //This line defines the color of the button border
    fill(tempFill);        //On the other hand, this line will color the inner part of the button
    
    quad((xPos - xRect), (yPos-yRect), (xPos + xRect), (yPos-yRect), (xPos + xRect), (yPos + yRect), (xPos - xRect), (yPos + yRect));      //The button will be a quadrilateral shape
    

    
    /*
    textAlign(CENTER, CENTER);        //This line makes it so that the text is centered with the x and y positions of the button
    textSize(24);              //Defining the font size
    fill(tempBorder);          //Definiing the font color (same as the border)
    text(text,xPos, yPos);      //Displaying the text at (xPos, yPos)*/
  }
  

}
