int xo,yo,u,x,y;
float x1,y1,xbc1,ybc1,xbc2,ybc2,xnr,ynr;
PShape bc1,bc2,nr,bp1;
void setup(){
  size(1000,1000);
  bc1 = loadShape("bcavallo.svg");
  bc2 = loadShape("bcavallo.svg");
  bp1 = loadShape("bp.svg");
  nr = loadShape("nre.svg"); 
  u = 100;
  //CAVALLO
  xbc1 = u*2;  ybc1 = u*8;
  xbc2 = u*7;  ybc2 = u*8;
  //RE
  xnr = u*5;  ynr = u;
}
void draw(){
  background(225,225,225);
  xo = 100;  yo = 900;  x = 1;
    while(x<=8){
    y = 1;
  
  while(y<=8){
   
    if((x+y) % 2 == 0){
      fill(#5A2300);
    }else{fill(238, 220, 101);}
    x1 = x - 1; y1 = y;
    rect( xo + x1*u, yo - y1*u, u, u);
    y++;
  }
 x++;
 }
 //SCACCO
 //CAVALLO
 if((xbc1-xnr)*(xbc1-xnr)+(ybc1-ynr)*(ybc1-ynr)==50000){fill(255,0,0);rect(xnr, ynr, u, u);}
 if((xbc2-xnr)*(xbc2-xnr)+(ybc2-ynr)*(ybc2-ynr)==50000){fill(255,0,0);rect(xnr, ynr, u, u);}
 
 
 //CAVALLO
  shape(bc1, xbc1, ybc1, u, u);  if(xbc1>800){xbc1=800;} if(xbc1<100){xbc1=100;} if(ybc1>800){ybc1=800;} if(ybc1<100){ybc1=100;}
  shape(bc2, xbc2, ybc2, u, u);  if(xbc2>800){xbc2=800;} if(xbc2<100){xbc2=100;} if(ybc2>800){ybc2=800;} if(ybc2<100){ybc2=100;}
  
  //RE
  shape(nr, xnr, ynr, u, u);  if(xnr>800){xnr=800;} if(xnr<100){xnr=100;} if(ynr>800){ynr=800;} if(ynr<100){ynr=100;}
    
  
    
}
void keyPressed(){
  
 if( keyCode ==  RIGHT){xbc1 += u;}
 if( keyCode ==  LEFT) {xbc1 -= u;}
 if( keyCode ==  DOWN) {ybc1 += u;}
 if( keyCode ==  UP)   {ybc1 -= u;}
 
 if( key ==  'd') {xnr += u;}
 if( key ==  'a') {xnr -= u;}
 if( key ==  's') {ynr += u;}
 if( key ==  'w') {ynr -= u;}
}
void mousePressed(){
  
  if(mouseButton == LEFT){if (dist(xbc1,ybc1,mouseX,mouseY)<=u){background(0,0,0);}}
  

}
