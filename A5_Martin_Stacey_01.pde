import java.util.Arrays;                                //MARTIN STACEY GENETIC ALGORYTHMS
int nPop = 100;                                         //Population Number                                     
Population p;                                           //Declare Population
int gen;                                                //Keep Count of Generations
PVector [] po = new PVector [3];

void setup() {
  size(800, 800);   
  float r1 = random(width*.1,width*.33);                //RANDOM 3 POINTS:
  float r2 = random(width*.33,width*.66);               //Random Restrictions (to avoid super big circles)
  float r3 = random(width*.66,width*.8);
  po [0] = new PVector (r1, r1);
  po [1] = new PVector (r3, r2);
  po [2] = new PVector (r1, r3);
  setupsl();                                            //SETUP DISPLAY
  setupbt();
  setuppd();
  p = new Population();                                 //POPULATION INSTANCIATE
} 
void draw() {
  background(255);   
  if (bstate[0]&&frameCount%10==0) {                    //Population Evolve (every 10 frameCounts) 
    p.evolve();                                        
    gen++;                                              //Count Generation
  }
  text("Generation: "+gen, 60, 20);         //Show Generation
  for (int i=0; i<pdis.nCells; i++) {                   //Draw Representative Portion of Population on Bottom
    pushMatrix();
    translate(i*pdis.cellSize, height-(80+pdis.cellSize));
    scale(1.0/pdis.nCells, 1.0/pdis.nCells);   
    p.pop[i*pdis.step()].draw();
    popMatrix();
  }
    p.pop[int(slVal[0])-1].draw(); 
  p.pop[int(slVal[0])-2].draw();
    fill(255,5);
  noStroke();
  rect(0,0,width,height);
  
  p.pop[int(slVal[0])].draw();                         //Draw Selected Member in big screen


  drawpd();
  drawsl();                                            //Draw Sliders and buttons
  drawbt();
}
void mousePressed() {
  presssl();                                            //PressSliders and Buttons
  pressbt();
  pdis.press();
}
void mouseReleased() {                                 //Release Slider
  releasesl();
}