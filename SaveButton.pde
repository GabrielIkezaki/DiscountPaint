public class SaveButton extends UIButton{      //The SaveButton class will be a child of the UIButton class
    
    UIButton[] buttonArray;
    
    public SaveButton(int tempXPos, int tempYPos, int tempXRect, int tempYRect, color tempBorder, color tempFill, String tempText, color invis){  
      super(tempXPos, tempYPos, tempXRect, tempYRect, tempBorder, tempFill, tempText, invis);      //Because the UIButton class requires parameters, we need to specify that the child class will inherit the parameters with the "super" keyword.
  }
    //super(xPos, yPos, xRect, yRect);
      
    void InsertArray(UIButton[] temparray){
         buttonArray = temparray;  

    }
      
    protected void OnClick(){      //The save button will override the OnClick method, so that it will always save the drawing when clicked
        print("CLICK");
        for(int i = 0; i < buttonArray.length; i++){
          buttonArray[i].Hide();    //The Hide function only draws a rectangle of the same color as the background over a button, it doesn't really make it transparent
        }
        save("desenhoteste.png"); 
        
        for(int i = 0; i < buttonArray.length; i++){
          buttonArray[i].display(); //After saving, each button will draw a rectangle of its initial color
        }

    }


}
