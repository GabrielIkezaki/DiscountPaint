color saveButtonBorder = color(158,158,158);
color saveButtonFill = color(57, 57, 57);
color red = color(255,0,0,255);            //This is only a temporary color, which will be the paint brush color
color eraserColor = color(200,200,200);   //The eraser tool will only paint over with the background color. It's not really changing the color of the pixels


Brush currentBrush;          //This class represents all the current attributes of the brush (thickness, type, color)
SaveButton button;                //This is the save button
BrushButton pencilButton, eraserButton;        //These two buttons will change the type of the brush


void setup()
{
  currentBrush = new Brush();
  currentBrush.SetType(BrushType.PENCIL);
  
  size(800,800);        //window size
  background(eraserColor);     //background color will be the same as the eraser color
  //frameRate(1040);
  
  button = new SaveButton(650, 750, 100, 35, saveButtonBorder, saveButtonFill, "Save as PNG");
  pencilButton = new BrushButton(70, 70, 30, 30, saveButtonBorder, saveButtonFill, "P", BrushType.PENCIL, currentBrush);      //Notice the last two parameters. This button sets the currentBrush to a PENCIL
  eraserButton = new BrushButton(70,130, 30,30, saveButtonBorder, saveButtonFill, "B", BrushType.ERASER, currentBrush);   //This button sets the currentBrush to an ERASER
}

void draw(){
  
  
  if(mousePressed){          //Checks if the mouse if being pressed
    strokeWeight(currentBrush.thickness);      //Sets the thickness of each line to the thickness variable
   
    //funcao de linha :))
    //line(mouseX, mouseY, pmouseX/10, pmouseY/10);
    
    //nankin?
    //line(mouseX, mouseY, pmouseX - pmouseX/10, pmouseY - pmouseY/10);
     //button.OnClick();
     
     switch(currentBrush.currentType){      //Depending on what the currentBrush type is, different colors will be used for the brush
       case PENCIL:
         DrawLine(red);
       break;
       case ERASER:
         DrawLine(eraserColor);
       break;
       
     }          
   // GenerateCircle(red, radius);
      
  }
}

void mouseReleased(){      //This function checks if the mouse was released
   button.CheckClick();        //If so, the save button will check if it has been pressed
   pencilButton.CheckClick();
   eraserButton.CheckClick();

}

void DrawLine(color tempColor){        //This function is responsible for drawing lines on each frame, making it look like the user is drawing a single stroke. 
   stroke(tempColor);    //The stroke function colors lines
   line(mouseX, mouseY, pmouseX, pmouseY);        //This will create a line starting from the current mouse position, and ending at the mouse position from the previous frame.
    
}

void keyPressed(){      //checks if any key has been pressed
    if(key == 'e'){    
       currentBrush.currentType = BrushType.ERASER; 
     }
     
     if(key == 'b'){
       currentBrush.currentType  = BrushType.PENCIL;
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
