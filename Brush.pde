public class Brush{
    BrushType currentType;        //BrushType is an enum that includes all possible brushtypes for the currentbrush
    int thickness;          //Brush thickness
    color currentColor = color(0,0,0,255);      //The color which is currently in use
    
    Brush(){
      currentType = BrushType.PENCIL;      //The default type of the brush is pencil. 
      thickness = 10;            //The default thickness is 10
    }
    
    void SetColor(color tempColor){    //This method changes the current brush color
      currentColor = tempColor;
    }
    
    void AddSize(int additionalThickness){      //This method adds to and subtracts from the brush thickness
      thickness += additionalThickness;
    }
    
    void SetSize(int newSize){      //This method changes the thickness to a predetermined value
      thickness = newSize;
    }
    
    void SetType(BrushType tempType){        //This method changes the brush type
      currentType = tempType;
    }
    
}
