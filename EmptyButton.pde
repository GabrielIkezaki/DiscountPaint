public class EmptyButton extends UIButton{        //An emptybutton is essentially just a colored box. This is used to display the RGB values of the current brush
  
  float currentColor;
  String initText;
    
    public EmptyButton(int tempXPos, int tempYPos, int tempXRect, int tempYRect, color tempBorder, color tempFill, String tempText, Brush brush, color invis, float colorValue){  
     super(tempXPos, tempYPos, tempXRect, tempYRect, tempBorder, tempFill, tempText, invis);      //Because the UIButton class requires parameters, we need to specify that the child class will inherit the parameters with the "super" keyword.
     initText = tempText;
  }  
  
 void UpdateColor(float additioner){
   currentColor += additioner;      //Every time the decrease or increasearrows are clicked, the text is updated to display the correct values
 } 
 
  protected void display(){
    text = initText + Float.toString(currentColor);        

     DrawButton(borderColor, fillColor);         //This function is from the UIButton class. An EmptyButton isn't used as a button (because the user can't click them), but it behaves like one.
 

  }

}
