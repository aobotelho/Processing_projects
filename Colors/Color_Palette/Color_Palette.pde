int max = 300;

void setup(){
  size(max,max);
  
  noStroke();
  colorMode(HSB, max);
  for (int i = 0; i < max; i++) {
    for (int j = 0; j < max; j++) {
      stroke(i, j*10, max);
      point(i, j);
    }
  }
}

void draw(){
  
}
