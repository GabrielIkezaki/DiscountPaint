public class ColorPack{        //A ColoPack is a group of interface elements that contains the increase and decrease buttons, and color value
      int xRect = 60;        //The length of the increase, decrease and color value elements buttons
      int yRect = 20;        //The width of all elements
      color borderColor;    //Color of the border of each button
      color fillColor;
      String text;            //Text that reads R, G or B depending on the colorpack
      UIButton[] allButtons;        //Array that contains all buttons of a pack
      IncreaseArrow increaseArrow;    //Button that increases the RGB value when clicked
      DecreaseArrow decreaseArrow;    //Button that decreases the RGB value when clicked
      EmptyButton colorText;          //This isn't really a button. It behaves like one, but it's more of a display for the RGB value
      public ColorPack(int xPos, int yPos, int tempColor, Brush brush, float colorValue){        //The 3rd parameter defines whether this color pack controls the red, green of blue of the brush
        
        switch(tempColor){
          case 0:
            fillColor = color(237,89,89);
            borderColor = color(245, 140, 140);
            text = "R: ";
            break;
          case 1:      
            fillColor = color(80, 207, 79);
            borderColor = color(155, 245, 140);
            text = "G: ";
            break;
           case 2:
             fillColor = color(89,110,237);
             borderColor = color(140, 165, 245);
             text = "B: ";
             break;
            
        }
          colorText = new EmptyButton(xPos, yPos + 50, xRect,  yRect, borderColor, fillColor, text, brush,color(255,255,255), colorValue);      //The colorValue parameter fills the display color

          increaseArrow = new IncreaseArrow(xPos, yPos, xRect,  yRect, color(158,158,158), color(57, 57, 57), "+", brush, color(255,255,255), tempColor, colorText);
          decreaseArrow = new DecreaseArrow(xPos, yPos + 100, xRect,  yRect, color(158,158,158), color(57, 57, 57), "-", brush, color(255,255,255), tempColor, colorText);

          allButtons = new UIButton[]{increaseArrow, colorText, decreaseArrow};
      }
      
      void display(){        //All buttons of a pack will be drawn
        increaseArrow.display();
        colorText.display();
        decreaseArrow.display();
      }
      
      void CheckClick(){        //ALl buttons of a pack will check if the mouse has clicked them
      increaseArrow.CheckClick();
      decreaseArrow.CheckClick();

      }
      
      void Hide(){        //All buttons will be hidden
        increaseArrow.Hide();
        colorText.Hide();
        decreaseArrow.Hide();
      }
      
}
