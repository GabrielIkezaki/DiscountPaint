public class RGBSystem{      //The RGB class contains 3 "ColorPacks", one for each of the RGB values.
    ColorPack[] allPacks;      //An array that contains all 3 colorpacks
    ColorPack rColorPack, gColorPack, bColorPack;        //Each colorpack represents a color
    float r,g,b;      //These float values will contain the current RGB value of the brush
    
    public RGBSystem(int tempXPos, int tempYPos, Brush brush){
        r = red(brush.currentColor);
        g = green(brush.currentColor);
        b = blue(brush.currentColor);
      
        rColorPack = new ColorPack(tempXPos, tempYPos, 0, brush, r);    //Each colorpack will be positioned under the preceding one (red will be on top, green will be on the middle, blue will be on the bottom)
        gColorPack = new ColorPack(tempXPos, tempYPos + 180, 1, brush, g);
        bColorPack = new ColorPack(tempXPos, tempYPos + 360, 2, brush, b);
        
        allPacks = new ColorPack[]{rColorPack, gColorPack, bColorPack};
    }
    
    void display(){
      for(int i = 0; i < allPacks.length; i++){
        allPacks[i].display();      //Every pack contains the "display" function that draws the pack buttons
      }
    }
    void Hide(){
      for(int i = 0; i < allPacks.length; i++){
        allPacks[i].Hide();      //All packs have Hide functions that draws a white mask over the buttons
      }
    }
    
    void CheckClick(){
      //print("SYSTEM");
      for(int i = 0; i < allPacks.length; i++){
        allPacks[i].CheckClick();        //All pack buttons will check if the mouse is clicking them on the current frame
      }
    }
}
