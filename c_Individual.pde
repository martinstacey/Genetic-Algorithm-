class Individual implements Comparable {                           
  Genotype iGen;                                                      
  Phenotype iPhen;
  float iFit;
  Individual() {
    iGen =  new Genotype();
    iPhen = new Phenotype(iGen,po);
    iFit = 0;
  }
  void draw() {
    iPhen.draw();
  }
  void evaluate() {
    iFit = iPhen.evaluate();
  }
  int compareTo (Object objI) {                                        
    Individual iToCompare = (Individual) objI;
    if (iFit>iToCompare.iFit) return -1;                               
    else if (iFit<iToCompare.iFit)  return 1;                          
    return 0;                                                          
  }
}
Individual sex(Individual a, Individual b) {
  Individual c = new Individual();
  c.iGen = crossover(a.iGen, b.iGen);
  c.iGen.mutate();
  c.iPhen = new Phenotype(c.iGen,po);
  return c;
}

Genotype crossover(Genotype father, Genotype mother) {
  Genotype baby= new Genotype();
  for (int i=0; i<baby.genes.length; i++) {
    if (random(0, 1)<0.5) baby.genes[i] = father.genes[i];   
    else baby.genes[i] = mother.genes[i];
  }
  return baby;
}