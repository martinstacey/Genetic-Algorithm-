                                                                                //Map Display
float [] pdVal = {10};
PopDisplay pdis ; 

void setuppd() {
  pdis=new PopDisplay(pdVal[0]);
}
void drawpd() {    
  pdVal  = pdis .calculate();
  pdis.display(100, pdVal[0]);
}
void presspd() {
  pdis.press();
}
class PopDisplay {
  float Num, maxNum, nCells, cellSize, npop, div;
  PopDisplay(float _Num) {
    Num = _Num;
    div=10;
    nCells = 10;
  }

  float [] calculate() {
    float [] n = new float [1];
    n [0] = nCells;
    return n;
  }

  void display(float _nPop, float _nCells) {
    nCells = _nCells;
    npop = _nPop;
    cellSize = width/(nCells);
    strokeWeight(1);
    noFill();
    stroke(100);
    triangle(20, height-40, 60, height-60, 60, height-20);
    triangle(width-20, height-40, width-60, height-60, width-60, height-20);
    stroke(200);
    for (int i=0; i<nCells; i++) rect(i*cellSize, height-80, cellSize, -cellSize);
    fill(100);
    for (int i=0; i<nCells; i++) text( nf((i/nCells)*npop, 1, 0), i*cellSize+(cellSize/2), height-80);
    strokeWeight(2);
    fill(100);
    textAlign(CENTER);
    text("Fittest", width-40, height-70);
    text("Weakest", 40, height-70);

    text("Show More", width-100, height-35);
    text("Show Less", 100, height-35);
  }
  void press() {
    if (mouseX > 20 && mouseX < 60  && mouseY > height-60 && mouseY < height-20) {
      if (nCells>2) {
        div++;
        if (npop%div!=0) while (npop%div!=0) div++;
        nCells  = npop/div;
      }
    }
    if (mouseX > width-60 && mouseX < width-20  && mouseY > height-60 && mouseY < height-20 ) {
      if (nCells<(npop/2)) {
        if (div==nCells)div --;
        if (div<npop) {
          div--;
          if (npop%div!=0) while (npop%div!=0) div--;
          nCells = npop/div;
        }
      }
    }
  }
  int step(){
    int cs = int(npop/nCells);
    return cs;
  }
}