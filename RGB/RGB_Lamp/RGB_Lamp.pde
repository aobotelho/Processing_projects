import processing.serial.*;

int COMIndex = 0;
int max = 512;
boolean settingCOM = true;
boolean COMOpened = false;
boolean DrawImage = false;
Serial port;

void setup() {  
  size(max,max);
  background(0);
  
  fill(255);
  text("Coms availables: ",200,200);

  for(int i=0;i<Serial.list().length;i++)
    text("[" + i + "]: " + Serial.list()[i],200,220+10*i);

  
}

void draw() {
  if(!settingCOM && !COMOpened){
    port = new Serial(this,Serial.list()[COMIndex],9600);
    COMOpened = true;
    DrawImage = true;
  }
  else if(COMOpened && DrawImage){
    clear();
    noStroke();
    colorMode(HSB, max);
    for (int i = 0; i < max; i++) {
      for (int j = 0; j < max; j++) {
        stroke(i, j*10, max);
        point(i, j);
      }
    }
    
    DrawImage = false;
  }
}

void keyPressed(){
  COMIndex = key - '0';
  if(COMIndex < 0 || COMIndex >=Serial.list().length){
    text("Wrong input!!!",200,100);
    text("Coms availables: ",200,200);
    for(int i=0;i<Serial.list().length;i++)
      text("[" + i + "]: " + Serial.list()[i],200,220+10*i);
  }
  else{settingCOM = false;}
}

void mousePressed(){
  int Color;
  Color = get(mouseX,mouseY);
  port.write("R" + hex(Color>>16 & 0xFF,2) + "G" + hex(Color>>8 & 0xFF,2) + "B" + hex(Color & 0xFF,2));
}
