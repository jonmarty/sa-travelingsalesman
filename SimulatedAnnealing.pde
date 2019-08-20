class Optimizer{
  Optimizer(){}
  void step(){}
}

class SimulatedAnnealing extends Optimizer {
  SimulatedAnnealing(){
    super();
  }
  void step(){
    int[] proposal = this.sample();
    println(this.prob(proposal)/this.prob(path), this.energy(path), T);
    if(this.energy(path) < leastEnergy || step == 1){
      leastEnergy = this.energy(path);
      leastStep = step;
    }
    if (this.prob(proposal) / this.prob(path) > random(0,1)){
      path = proposal;
    }
  }
  int[] sample(){
    int ind1 = int(random(N));
    int ind2 = int(random(N-1));
    if (ind2 >= ind1) {ind2++;}
    int item1 = path[ind1];
    int item2 = path[ind2];
    int[] newPath = new int[N];
    arrayCopy(path, newPath);
    newPath[ind1] = item2;
    newPath[ind2] = item1;
    return newPath;
  }
  float energy(int[] state){
    float sum = 0;
    for (int i = 0; i < state.length - 1; i++){
      float[] node1 = nodes[state[i]];
      float[] node2 = nodes[state[i + 1]];
      sum += sqrt(pow(node2[0] - node1[0],2) + pow(node2[1] - node1[1],2));
    }
    sum += sqrt(pow(startNode[0] - nodes[0][0],2) + pow(startNode[1] - nodes[0][1],2));
    sum += sqrt(pow(startNode[0] - nodes[N-1][0],2) + pow(startNode[1] - nodes[N-1][1],2));
    return sum;
  }
  float prob(int[] state){
    return exp(-energy(state)/(k*T));
  }
}

class TempFunction {
  TempFunction(){}
  float call(int step){
    return 1/log(step + 1);
  }
}
