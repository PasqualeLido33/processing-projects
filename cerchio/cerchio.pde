float x,y,r;
void setup(){
  size(1000,1000);
  fill(0,0,255);
  r=100;
  x = 500;    
  y = 500;
}
void draw(){
  background(225,225,225);
  circle(x,y,2*r);
  print(x);
  print(" ");
  println(y);
}
void mousePressed(){
  
  if(mouseButton == LEFT) {r = r + 5;if(r>=500){r=500;}}
  if(mouseButton == RIGHT){r = r - 5;if(r<=0){r=0;}}
}
void mouseMoved(){
  
  if(dist(x,y,mouseX,mouseY)<=r){fill(255,0,0);}else{fill(0,0,255);}
  
}
void keyPressed(){
  
  if(keyCode == RIGHT){x = x + 10;}if(x>905){x=905;}
  if(keyCode == LEFT) {x = x - 10;}if(x<105){x=105;}
  if(keyCode == UP)   {y = y - 10;}if(y>905){y=905;}
  if(keyCode == DOWN) {y = y + 10;}if(y<105){y=105;}
  if(key == ' ')      {x = 500;  y = 500;  r = 100;  fill(0,0,255);}
}
  
