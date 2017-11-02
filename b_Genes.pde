class Genotype {                 
  int [] genes;  
  Genotype() {
    genes = new int [3];
    for (int i=0; i<genes.length; i++) {
      genes[i] = (int) random(256);
    }
  }
  void mutate() {                                               //5% mutation rate
    for (int i=0; i<genes.length; i++) {
      if (random(100)<5) {
        genes[i] = (int) random(256);
      }
    }
  }
}
class Phenotype {
  float cirX, cirY, cirRadius;                                  //3 Phenotypes
  PVector cirCenter;                                            // X Y to Vector 
  PVector [] ptsPos = new PVector [3];
  float [] ptsDistCenter = new float [3];
  float distAvg, distDif, radDif, totFit;


  Phenotype(Genotype g, PVector[] p) {
    ptsPos = p;
    cirX = g.genes[0]*width/256;
    cirY = g.genes[1]*height/256;
    cirRadius = g.genes[2]*height/256;
    cirCenter = new PVector (cirX, cirY);
  }
  void draw() {
    fill(0);
    stroke(0);
    for (int i=0; i<ptsPos.length; i++) {                        
      ellipse(ptsPos[i].x, ptsPos[i].y, 15, 15);                // Draw Points for Every Circle
    }
    fill(0);
    text( "Fit:"+ int(totFit), cirCenter.x+5, cirCenter.y-5);   //Display Fitness
    float map1 = map(totFit, 0, 255, 255, 0);                   //Color according to Fitness
    float maptrans = map(totFit, 0, 1000, 255, 0);
    stroke(map1, 0, totFit, maptrans);
    fill(map1, 0, totFit, maptrans );
    ellipse(cirCenter.x, cirCenter.y, 5, 5);                 
    noFill();
    ellipse(cirX, cirY, cirRadius*2, cirRadius*2);              //Draw Circle
  }
  float evaluate() {
    for (int i=0; i<ptsDistCenter.length; i++) {
      ptsDistCenter[i] = 0;                                     //Zero all distances
    }
    radDif = distAvg = distDif = totFit = 0;                    //Zero all calculations
    for (int i=0; i<ptsDistCenter.length; i++) {
      ptsDistCenter [i] = PVector.dist(cirCenter, ptsPos[i]);   // Distances from circle center to all points
    }
    for (int i=0; i<ptsDistCenter.length; i++) {
      distDif += abs(ptsDistCenter[i] - ptsDistCenter[(i+1)%3])/3 ;//Adds Differences between distance (if there are no differences they belong to same circumference)
    }   
    for (int i=0; i<ptsDistCenter.length; i++){ 
      distAvg += ptsDistCenter [i]/3;                            //Average Distance from Point to circle Center(Point to center) to compare with radius
    }
    radDif = abs(cirRadius - distAvg);                           //Difference between averarage distance with circle Radius 
    totFit = radDif + distDif; 
    return totFit;
  }
}