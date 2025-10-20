float x1,y1,x2,y2,r,MODE,xc,yc;
void setup(){
  size(1000,1000);
  stroke(0,0,0);
  strokeWeight(3);
  r=8;
  x1 = 360;    y1 = 500;
  x2 = 800;    y2 = 700;
  xc = (x1+x2)/2;
  yc = (y1+y2)/2;
  
}
void draw(){
  background(225,225,225);
  line(x1,y1,xc,yc);
  line(xc,yc,x2,y2);
  circle(x1,y1,2*r);
  circle(x2,y2,2*r);
  circle(xc,yc,2*r);
}
void mousePressed(){
  
  if(dist(x1,y1,mouseX,mouseY)<=r){MODE = 1;}
  if(dist(x2,y2,mouseX,mouseY)<=r){MODE = 2;}
  if(dist(xc,yc,mouseX,mouseY)<=r){MODE = 3;}
  
}
void mouseDragged(){
  
  if(MODE == 1){x1 = mouseX;  y1 = mouseY;}
  if(MODE == 2){x2 = mouseX;  y2 = mouseY;}
  if(MODE == 3){xc = mouseX;  yc = mouseY;}
  
}
void mouseReleased(){
  MODE = 0;
}
  
