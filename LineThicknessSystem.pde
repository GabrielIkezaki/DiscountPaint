public class LineThicknessSystem{    //This is a 2 button class: the increase and decrease brush thickness buttons
  
  ThicknessChangeButton[] buttons;
  ThicknessChangeButton increaseButton, decreaseButton;
  
  
  public LineThicknessSystem(int tempXPos, int tempYPos, Brush brush){
    increaseButton = new ThicknessChangeButton(tempXPos - 15, tempYPos, 12, 12, color(158,158,158), color(57, 57, 57), "+", color(255,255,255), brush, true);
    decreaseButton = new ThicknessChangeButton(tempXPos + 15, tempYPos, 12, 12, color(158,158,158), color(57, 57, 57), "-", color(255,255,255), brush, false);
    buttons = new ThicknessChangeButton[]{increaseButton, decreaseButton};
  }
     void display(){      
      increaseButton.display();
      decreaseButton.display();
    }
    void Hide(){
      increaseButton.Hide();
      decreaseButton.Hide();
    }
    
    void CheckClick(){
      increaseButton.CheckClick();
      decreaseButton.CheckClick();
    }
}
