import ddf.minim.*;
float x,y,i,g,s,sr,sg,sb,MODE,cx1,cy1,cx2,cy2,cx3,cy3,cx4,cy4,cx5,cy5,OLD_MODE;
PImage gomma;
boolean isMuted = false;
Minim minim;
AudioPlayer sound;
void setup(){
  size(1000,1000);
  background(255,255,255);
  minim = new Minim(this);
  sound = minim.loadFile("sound.mp3");
  gomma = loadImage("gomma.png");
  sound.loop();
  //INIZIALIZZAZIONI VARIABILI
  s = 5;   MODE = 0; sr = 0;  sg = 0;  sb = 0; g=0;  OLD_MODE=0;
  
  //CERCHI
  cx1 = 30;   cy1 = 50;
  cx2 = 30;   cy2 = 90;
  cx3 = 30;   cy3 = 130;
  cx4 = 30;   cy4 = 170;
  cx5 = 30;   cy5 = 210;
}
void draw(){

  
  //VARIABILI PER COLORI E SPESSORI
  sr=cx1;  sg=cx2;  sb=cx3;  s=cx4-27;  g=cx5-27;
  
  //RETTANGOLO
  strokeWeight(10);
  fill(190,190,190);
  stroke(190,190,190);
  rect(0,0,1000,250);
  
  //LINEE
  stroke(0,0,0);
  line(30,50,285,50);
  line(30,90,285,90);
  line(30,130,285,130);
  line(30,170,100,170);
  stroke(255,255,255);
  line(30,210,150,210);
  
  //CERCHI
  strokeWeight(1);
  stroke(0,0,0);
  fill(255,0,0);
  
  circle(cx1,cy1,20);
  fill(0,255,0);
  
  circle(cx2,cy2,20);
  fill(0,0,255);
  
  circle(cx3,cy3,20);
  fill(0,0,0);
  
  circle(cx4,cy4,20);
  fill(255,255,255);
  
  circle(cx5,cy5,20);
  
  //LINEA PROVA
  strokeWeight(s);
  stroke(sr,sg,sb);
  line(350,50,350,210);
  
  //TESTO
  fill(sr,sg,sb);
  textSize(40);
  text("M = MATITA",400,60);
  text("S = SPRAY",400,110);
  text("R = CANCELLA TUTTO",400,160);
  text("A/D = ATTIVA/DISATTIVA AUDIO",400,210);
  
}
void mouseDragged(){
  
  //DISEGNO
  if(MODE<=5){
  if(mouseButton==LEFT){
  if(mouseY <= 250){mouseY = 200;pmouseY = 200;}
  else{cursor(CROSS);  strokeWeight(s);  stroke(sr,sg,sb);  line(pmouseX,pmouseY,mouseX,mouseY);}}}
  
  //GOMMA
  if(mouseButton==RIGHT){
  if(mouseY <= 250){mouseY = 200;pmouseY = 200;}
  else{MODE=0;cursor(gomma);  strokeWeight(g);  stroke(255,255,255);  line(pmouseX,pmouseY,mouseX,mouseY);}}
  
  //LIMITE CERCHI
  if(MODE==1){cx1=mouseX;if(cx1<=30){cx1=30;}if(cx1>=285){cx1=285;}}
  if(MODE==2){cx2=mouseX;if(cx2<=30){cx2=30;}if(cx2>=285){cx2=285;}}
  if(MODE==3){cx3=mouseX;if(cx3<=30){cx3=30;}if(cx3>=285){cx3=285;}}
  if(MODE==4){cx4=mouseX;if(cx4<=30){cx4=30;}if(cx4>=100){cx4=100;}}
  if(MODE==5){cx5=mouseX;if(cx5<=30){cx5=30;}if(cx5>=150){cx5=150;}}
  
  //SPRAY
  if(MODE==6)
  {
    cursor(CROSS);
    while(i<100){
      x = mouseX + randomGaussian()*s;
      y = mouseY + randomGaussian()*s;
      strokeWeight(s);
      stroke(sr,sg,sb,s+10);
      point(x,y);
      i++;
      } 
   }
   
   i=0;
      
  }
  
void mousePressed(){
 
  //CONTROLLO CERCHIO PREMUTO
  if(dist(cx1,cy1,mouseX,mouseY)<=20){MODE=1;}
  if(dist(cx2,cy2,mouseX,mouseY)<=20){MODE=2;}
  if(dist(cx3,cy3,mouseX,mouseY)<=20){MODE=3;}
  if(dist(cx4,cy4,mouseX,mouseY)<=20){MODE=4;}
  if(dist(cx5,cy5,mouseX,mouseY)<=20){MODE=5;}
  
  }
void mouseReleased(){

  cursor(HAND);
  if(OLD_MODE==1){MODE=6;}else{MODE=0;}
 
}
void keyPressed(){

  if(key=='r'|| key=='R'){background(255,255,255);}
  if(key=='m'|| key=='M'){MODE=0;OLD_MODE=0;}
  if(key=='s'|| key=='S'){MODE=6;OLD_MODE=1;}
  if(key=='d'|| key=='D'){if(sound.isPlaying()){sound.mute();}isMuted=true;}
  if(key=='a'|| key=='A'){if(isMuted==true){sound.unmute();isMuted=false;}}
}
