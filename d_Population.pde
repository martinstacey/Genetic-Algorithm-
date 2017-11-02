class Population {
  Individual [] pop;
  Population() {
    pop = new Individual[nPop];
    for(int i=0; i<nPop; i++) {   
      pop[i] = new Individual();
      pop[i].evaluate();
    }
    Arrays.sort(pop);                                                                      
  }
  void evolve() {
    Individual a = select();
    Individual b = select();                                                                
    Individual x = sex(a,b);                                                                
    pop[0] = x;                                                                              
    x.evaluate();                                                                             
    Arrays.sort(pop);
  }
  Individual select()  {
    int which = (int) floor( ((float)nPop - 1e-6) * (1.0 - sq(random(0,1))) );                
    return pop[which];                                                                         
  }                                                                                         
}