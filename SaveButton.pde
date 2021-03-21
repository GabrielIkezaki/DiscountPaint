public class SaveButton extends UIButton{      //The SaveButton class will be a child of the UIButton class
    
    public SaveButton(int tempXPos, int tempYPos, int tempXRect, int tempYRect, color tempBorder, color tempFill, String tempText){  
      super(tempXPos, tempYPos, tempXRect, tempYRect, tempBorder, tempFill, tempText);      //Because the UIButton class requires parameters, we need to specify that the child class will inherit the parameters with the "super" keyword.
    }
    //super(xPos, yPos, xRect, yRect);
      
    protected void OnClick(){      //The save button will override the OnClick method, so that it will always save the drawing when clicked
        print("CLICK");
        save("fish.png"); 
    }


}
