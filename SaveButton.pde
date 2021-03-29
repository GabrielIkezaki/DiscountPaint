public class SaveButton extends UIButton{      //The SaveButton class will be a child of the UIButton class
    
    UIButton[] buttonArray;
    RGBSystem rgbSystem;
    
    public SaveButton(int tempXPos, int tempYPos, int tempXRect, int tempYRect, color tempBorder, color tempFill, String tempText, color invis, RGBSystem rgbSys){  
      super(tempXPos, tempYPos, tempXRect, tempYRect, tempBorder, tempFill, tempText, invis);      //Because the UIButton class requires parameters, we need to specify that the child class will inherit the parameters with the "super" keyword.
      rgbSystem = rgbSys;  
}
    //super(xPos, yPos, xRect, yRect);
      
    void InsertArray(UIButton[] temparray){
         buttonArray = temparray;  

    }
      
    protected void OnClick(){      //The save button will override the OnClick method, so that it will always save the drawing when clicked
        print("CLICK");
        for(int i = 0; i < buttonArray.length; i++){
          buttonArray[i].Hide();    //The Hide function only draws a rectangle of the same color as the background over a button, it doesn't really make it transparent
          rgbSystem.Hide();
        }
        save("desenhoteste.png"); 
        
        for(int i = 0; i < buttonArray.length; i++){
          buttonArray[i].display(); //After saving, each button will draw a rectangle of its initial color
          rgbSystem.display();
        }

    }


}
