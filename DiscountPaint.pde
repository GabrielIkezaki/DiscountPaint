color saveButtonBorder = color(158,158,158);
color saveButtonFill = color(57, 57, 57);
color red = color(255,0,0,255);            //This is only a temporary color, which will be the paint brush color
color eraserColor = color(255,255,255);   //The eraser tool will only paint over with the background color. It's not really changing the color of the pixels

boolean hasPrevMousePos = false;        //This will only be set true if the user click once on the canvas after selecting the straight line tool
int clickWeight = 0;          //This variable is used so that the initial point of the line won't be recorded if the user clicks on the straight line button itself 
int prevMouseXPos, prevMouseYPos;       //These are the coordinates of the initial point of a straight line

Brush currentBrush;          //This class represents all the current attributes of the brush (thickness, type, color)
SaveButton button;                //This is the save button
BrushButton pencilButton, eraserButton, eyedropperButton, straightLButton;        //These two buttons will change the type of the brush
CurrentColorDisplay colorDisplay;
UIButton[] allButtons;

RGBSystem rgbSystem;
LineThicknessSystem lineSystem;

void setup()
{
  currentBrush = new Brush();
  currentBrush.SetType(BrushType.PENCIL);
  
  size(800,800);        //window size
  background(eraserColor);     //background color will be the same as the eraser color
  //frameRate(1040);
  
  rgbSystem = new RGBSystem(700, 200, currentBrush);
  lineSystem = new LineThicknessSystem(70, 20, currentBrush);

  button = new SaveButton(650, 750, 100, 35, saveButtonBorder, saveButtonFill, "Save as PNG", eraserColor, rgbSystem, lineSystem);
  pencilButton = new BrushButton(70, 70, 30, 30, saveButtonBorder, saveButtonFill, "pencil.png", BrushType.PENCIL, currentBrush, eraserColor);      //Notice the last two parameters. This button sets the currentBrush to a PENCIL
  eraserButton = new BrushButton(70,130, 30,30, saveButtonBorder, saveButtonFill, "eraser.png", BrushType.ERASER, currentBrush, eraserColor);   //This button sets the currentBrush to an ERASER
  eyedropperButton = new BrushButton(70, 190, 30, 30, saveButtonBorder, saveButtonFill, "eyedropper.png", BrushType.EYEDROPPER, currentBrush, eraserColor); 
  straightLButton = new BrushButton(70, 250, 30, 30, saveButtonBorder, saveButtonFill, "straightline.png", BrushType.STRAIGHTLINE, currentBrush, eraserColor);
  colorDisplay = new CurrentColorDisplay(700, 100, 50, 50, saveButtonBorder, saveButtonFill, "", currentBrush, eraserColor);
  allButtons = new UIButton[]{button, pencilButton, eraserButton, eyedropperButton, straightLButton, colorDisplay};
  button.InsertArray(allButtons);
  
  
}

void draw(){
  
  
  if(mousePressed){          //Checks if the mouse if being pressed
    strokeWeight(currentBrush.thickness);      //Sets the thickness of each line to the thickness variable
      rgbSystem.CheckClick();
    //funcao de linha :))
    //line(mouseX, mouseY, pmouseX/10, pmouseY/10);
    
    //nankin?
    //line(mouseX, mouseY, pmouseX - pmouseX/10, pmouseY - pmouseY/10);
     //button.OnClick();
     
     switch(currentBrush.currentType){      //Depending on what the currentBrush type is, different colors will be used for the brush
       case PENCIL:
         DrawLine(currentBrush.currentColor);
       break;
       case ERASER:
         DrawLine(eraserColor);
       break;
       case EYEDROPPER:
         GetPixelColor();
       break;
     } 
     
     for(int i = 0; i < allButtons.length;i++){
       allButtons[i].display();
       rgbSystem.display();
       lineSystem.display();
     }
   // GenerateCircle(red, radius);
      
  }
  
  
}
void mouseClicked(){
    lineSystem.CheckClick();

  
    if(currentBrush.currentType == BrushType.STRAIGHTLINE){
      if(clickWeight > 0){    //Only if the user has already clicked on the button and THEN on the canvas will the initial point be stored  
        DrawStraightLine();
      }else{
        clickWeight++;   //The very first click of the mouse on the straight line button won't be recorded, because the user probably doesn't want to create a line that starts on the button position     
      }
    }
         

    
    print(red(currentBrush.currentColor) + ", " + green(currentBrush.currentColor) + ", " + blue(currentBrush.currentColor) + "\n");
}
void mouseReleased(){      //This function checks if the mouse was released
   for(int i = 0; i<allButtons.length; i++){
     if(allButtons[i].isMouseOnButton()){
       clickWeight = 0;
     }

     allButtons[i].CheckClick();
   }
   
}

void DrawLine(color tempColor){        //This function is responsible for drawing lines on each frame, making it look like the user is drawing a single stroke. 
    
   boolean canDraw = true; 
    
   for(int i = 0; i < lineSystem.buttons.length; i++){
     if(lineSystem.buttons[i].isMouseOnButton()){
       canDraw = false;
     }
   }
   
   if(canDraw){
     stroke(tempColor);    //The stroke function colors lines
     line(mouseX, mouseY, pmouseX, pmouseY);        //This will create a line starting from the current mouse position, and ending at the mouse position from the previous frame.
   }
}

void DrawStraightLine(){
  
 
  
  if(!hasPrevMousePos)        //If there are no previous mouse positions
  {
    prevMouseXPos = mouseX;      //The program will make it so that the current click position is the initial line point
    prevMouseYPos = mouseY;
    
    hasPrevMousePos = true;    //Now there is a previous mouse position  
    DrawLine(currentBrush.currentColor);      //This will only draw a single point on the mouse position so that the user knows where the line will start from  
  }else{
    strokeWeight(currentBrush.thickness);    
    stroke(currentBrush.currentColor);
    line(prevMouseXPos, prevMouseYPos, mouseX, mouseY);        //If there already is an initial point, a line heading from the initial point to the current mouse position will be drawn
    
    hasPrevMousePos = false;        //The previous mouse position will be reset, so that the user can create a new straight line
  }
}

void GetPixelColor(){
  boolean canExtractColor = true;        //This bool will prevent the eyedropper from copying the color from buttons.
  for(int i = 0; i < allButtons.length; i++){
    if(allButtons[i].isMouseOnButton()){    //If by the time the user releases the mouse it's position on top of a button, the variable will be set to false, and the color won't be extracted
      canExtractColor = false;
      break;
    }
  }
  
  if(canExtractColor){      //As long as no button has been pressed upon releasing the mouse, the eyedropper tool will copy the color of whatever pixel is currently "under" the mouse
    currentBrush.currentColor = color(get(mouseX, mouseY));  
  }
}


void keyPressed(){      //checks if any key has been pressed
    if(key == 'e'){    
       currentBrush.currentType = BrushType.ERASER; 
     }
     
     if(key == 'b'){
       currentBrush.currentType  = BrushType.PENCIL;
     }
     
     if(key == 'd'){
       currentBrush.currentType  = BrushType.EYEDROPPER;
     }
     
   
     
    if(key==']'){ 
      currentBrush.AddSize(1);
      print(currentBrush.thickness+"\n");
      
      
    }  
    
    if(key=='['){
      if(currentBrush.thickness>0){
       currentBrush.AddSize(-1);

        print(currentBrush.thickness+"\n");
      }
    }
}
