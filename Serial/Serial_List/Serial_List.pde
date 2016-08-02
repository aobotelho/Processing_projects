import processing.serial.*;

Serial port; // The serial port object
volatile boolean settingCOM = true;
int COMIndex = 0;


void setup() {  
  size(512,512);
  background(0);
  
  fill(255);
  text("Coms availables: ",200,200);
  
  for(int i=0;i<Serial.list().length;i++)
    text(Serial.list()[i],200,220+10*i);while(settingCOM == true);
  
  println("Uia!");
}

void draw() {

}

void keyPressed() {
  clear();
  fill(255);
  text("You have pressed: " + key , 150,150);
  settingCOM = false;
}
