color saveButtonBorder = color(158,158,158);
color saveButtonFill = color(57, 57, 57);
color red = color(255,0,0,255);            //This is only a temporary color, which will be the paint brush color
color eraserColor = color(200,200,200);   //The eraser tool will only paint over with the background color. It's not really changing the color of the pixels
int thickness = 10;              //This variable will store the thickness of the brush and eraser tools.
boolean eraser = false;        //Switches between the eraser and brush tools
SaveButton button;
void setup()
{
  size(800,800);        //window size
  background(eraserColor);     //background color will be the same as the eraser color
  //frameRate(1040);
  
  button = new SaveButton(650, 750, 100, 35, saveButtonBorder, saveButtonFill, "Save as PNG");
}

void draw(){
  
  
  if(mousePressed){          //Checks if the mouse if being pressed
    
    strokeWeight(thickness);      //Sets the thickness of each line to the thickness variable
   
    //funcao de linha :))
    //line(mouseX, mouseY, pmouseX/10, pmouseY/10);
    
    //nankin?
    //line(mouseX, mouseY, pmouseX - pmouseX/10, pmouseY - pmouseY/10);
     //button.OnClick();
     if(!eraser){            //Each lines will change color depending on what tool the user is currently using 
      DrawLine(red);     //If the brush tool is active, each line will be red
     }else{
       DrawLine(eraserColor);      //On the other hand, if the eraser tool is active, the drawn lines will have the same color as the background
     }
   // GenerateCircle(red, radius);
      
  }
}

void mouseReleased(){      //This function checks if the mouse was released
   button.CheckClick();        //If so, the save button will check if it has been pressed

}

void DrawLine(color tempColor){        //This function is responsible for drawing lines on each frame, making it look like the user is drawing a single stroke. 
   stroke(tempColor);    //The stroke function colors lines
   line(mouseX, mouseY, pmouseX, pmouseY);        //This will create a line starting from the current mouse position, and ending at the mouse position from the previous frame.
    
}

void keyPressed(){      //checks if any key has been pressed
    if(key == 'e'){    
      eraser = !eraser;        //the "e" key is the shortcut for the eraser tool. Currently, it switches between the eraser and brush tool.
    }
    
    if(key==']'){
      thickness += 1;        //Like in Photoshop, the "]" key increases the thickness of the brush/eraser tools
      print(thickness+"\n");
    }  
    
    if(key=='['){
      if(thickness>0){
        thickness -= 1;      //Meanwhile, the "[" key decreases this value
        print(thickness+"\n");
      }
    }
    if(key == 's'){
      save("girafa.png");        //the save(string) function donwloads the drawing as a png.
    }
}
