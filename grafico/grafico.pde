float ox,oy,x,y,x1,y1,i;
void setup(){
  i=2;
  size(1000,1000);
  background(255,255,255);
  x=0;
  ox=100;
  oy=900;
  strokeWeight(7);
  circle(100,900,7);
  strokeWeight(3);
  //800*800
  line(ox+0,oy-800,ox+0,oy-0);
  triangle(ox-2,oy-800,ox+0,oy-804,ox+2,oy-800);
  line(ox+800,oy-0,ox+0,oy-0);
  triangle(ox+800,oy-2,ox+804,oy-0,ox+800,oy+2);
  
  fill(0);
  textSize(20);
  text("y",ox-20,oy-780);
  text("x",ox+780,oy+20);
  
  while(x<=700)
  {
    stroke(255,0,0);
    y=sqrt(x);
    x1=x+1;
    y1=sqrt(x1);
    line(ox+x,oy-y*10,ox+x1,oy-y1*10);
    x++;
  }
  
  //line(ox+700,oy-264,ox+700,oy-2);
  while(i<=264){
    
    strokeWeight(2);
    stroke(105,105,105);
    line(ox+700,oy-257+i,ox+700,oy-235+i);
    i=i+23-0.2;
    stroke(255,255,255);
    line(ox+700,oy-233+i,ox+700,oy-209+i);
    i=i+23-0.2;
  }
  stroke(255,0,0);
  strokeWeight(5);
  circle(ox+700,oy-264,5);
}
