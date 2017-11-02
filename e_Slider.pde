                                                                                         //SLIDERS - MARTIN STACEY
float [] slVal = {99};                                                                   //Initial Values Sliders
Slider sl [] = new Slider [slVal.length];                                                //Declare Sliders

void setupsl() {                                                                           //Instanciate all Sliders    
  sl[0] = new Slider(width/2-100, height-20, 200, 0, 99, slVal[0], "Member Shown (0=Weakest)", false); //X,Y, Length, Initial Value, String, Display as Float? 

}
void drawsl() {                                                                            //Display all Sliders, get ther Value
  for (int i=0; i<sl.length; i++)  sl[i].display(99);
  for (int i=0; i<sl.length; i++)  slVal [i] = sl [i].value;
}
void presssl() {                                                                          //Press all sliders (Change Value)
  for (int i=0; i<sl.length; i++) if (sl[i].isOver()) sl[i].lock = true;
}
void releasesl() {                                                                        //Release all sliders (Stop Changing value)  
  for (int i=0; i<sl.length; i++) sl[i].lock = false;
}
class Slider {
  float x, y, minX, maxX, value;
  float  minV, maxV, inV;
  boolean lock = false;
  boolean flt = false;
  int bsize=27; 
  String tittle;
  Slider (float posX, float posY, float maxX, float minV, float maxV, float inV, String tittle, boolean flt) {
    this.minX = posX;
    this.x=map(inV, minV, maxV, posX, minX+maxX);
    this.y=posY;
    this.maxX=maxX;
    this.minV=minV;
    this.maxV=maxV;
    this.inV=inV;
    this.tittle=tittle;
    this.flt = flt;
  }
  void display(float _maxV) {                                                              //Display and write value according to position                                                                       
    maxV = _maxV;
    pushStyle();
    colorMode(RGB, 255);
    if (flt) value = map(x, minX, minX+maxX, minV, maxV);  
    else value = int(map(x, minX, minX+maxX, minV, maxV));      
    float mx = constrain(mouseX, minX, minX+maxX );     
    if (lock) x = mx;
    fill(255);
    stroke(200);
    strokeWeight(1);
    rect(minX, y, maxX, 2.5);         
    pushMatrix();
    ellipse(x, y, bsize, bsize);              
    fill(100);  
    textAlign(CENTER, CENTER);
    if (flt) text(nf(value, 0, 2), x+1, y-2);
    else text(int(value), x+1, y-2); 
    textAlign(LEFT, CENTER);
    text(tittle, minX, y-20);
    popMatrix();
    popStyle();
  }   
  void displaymove(float ren) {                                                              //To use when you want it as an output
    pushStyle();
    colorMode(RGB, 255);
    x=map(ren, minV, maxV, minX, minX+maxX);
    if (flt) value = map(x, minX, minX+maxX, minV, maxV);  
    else value = int(map(x, minX, minX+maxX, minV, maxV));      
    float mx = constrain(mouseX, minX, minX+maxX );     
    if (lock) x = mx;
    strokeWeight(1);
    fill(255);
    stroke(200);
    rect(minX, y, maxX, 2.5); 
    pushMatrix();
    translate(0, 0, 1);
    ellipse(x, y, bsize, bsize);              
    fill(100);  
    textAlign(CENTER, CENTER);
    if (flt) text(nf(value, 0, 2), x+1, y-2);
    else text(int(value), x+1, y-2); 
    textAlign(LEFT, CENTER);
    text(tittle, minX, y-20);
    popMatrix();
    popStyle();
  }
  boolean isOver() {
    return (x+(bsize/2) >= mouseX) && (mouseX >= x-(bsize/2)) && (y+(bsize/2) >= mouseY) && (mouseY >= y-(bsize/2));
  } 
  float flSlider() {
    return value;
  }
}