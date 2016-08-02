import processing.serial.*;

Serial port;

int max = 600;

void setup(){
  size(max,max);
  
  port = new Serial(this,"COM4",9600);
  
  noStroke();
  colorMode(HSB, max);
  for (int i = 0; i < max; i++) {
    for (int j = 0; j < max; j++) {
      stroke(i, j, max);
      point(i, j);
    }
  }
}

void draw(){
  
}

void mousePressed(){
  int Color;
  Color = get(mouseX,mouseY);
  port.write("R" + hex(Color>>16 & 0xFF,2) + "G" + hex(Color>>8 & 0xFF,2) + "B" + hex(Color & 0xFF,2));
}
