                                                                                      //BUTTONS - MARTIN STACEY
boolean [] bstate = {false};                                                          //Initial State
Button bt [] = new Button [bstate.length];

void setupbt() {                                                                      //Instanciate
  bt[0] = new Button(width/2-90, height-60, 25, "Evolve", bstate[0]);                              //Evolve

}
void drawbt() {                                                                       //Draw all buttons
  for (int i=0; i<bt.length; i++)  bt[i].display();
  for (int i=0; i<bt.length; i++)  bstate[i]=bt[i].onoff();
}
void pressbt() {                                                                      //Press Button
  for (int i=0; i<bt.length; i++)  bt[i].press();
}

class Button {
  int x, y, bSize;
  String label;
  boolean state;
  Button(int x, int y, int bSize, String label, boolean state) {
    this.x = x;
    this.y = y;
    this.bSize = bSize;
    this.label = label;
    this.state = state;
  }
  void display() {
    pushStyle();
    colorMode(RGB, 255);
    strokeWeight(1);
    stroke(200);
    pushMatrix();
    textAlign(CENTER, CENTER);
    if (state) {
      stroke(200);
      fill(255);
      ellipse(x, y, bSize, bSize);
      fill(100);
          
      text("ON", x, y);
    } else {
      fill(255);
      ellipse(x, y, bSize, bSize);
      fill(100);
      text("OFF", x, y);
    } 
    textAlign(LEFT, CENTER);
    text(label, x+bSize, y);
    popStyle();
    popMatrix();
  }
  void press() {
    if (mouseX > (x - bSize/2) && mouseX < (x + bSize/2)  &&mouseY > (y - bSize/2) && mouseY < (y + bSize/2)) state = !state;
  }
  boolean onoff() {
    return state;
  }
  
}