import ddf.minim.*;
float dx,dy,dy1,dy2,x,y,y1,y2,MODE,v,vr;
int s1,s2,gm,p,r1,r2;
PImage palla,campo,rac,rac2; 
Minim minim;
AudioPlayer rim;
AudioPlayer end;
void setup(){
  size(1000,1000);
  minim = new Minim(this);
  rim = minim.loadFile("rim.mp3");
  end = minim.loadFile("end.mp3");
  
  //IMMAGINI
  palla = loadImage("palla.png");
  campo = loadImage("campo.png");
  rac = loadImage("racchetta.png");
  rac2 = loadImage("racchetta2.png");
  
  // Y RACCHETTE
  y1 = 400;  y2 = 400;
  // COORDINATE PALLINA
  x = 500;   y = 500;
  // VELOCITÀ
  dx=-1;     dy=0;  v=7;  vr=5;
  // PUNTEGGIO
  MODE=0;  r1 = 0;    r2 = 0;  s1=0; s2=0;  
  

}
void draw(){

  //MENÙ
  if(MODE==0){ s1=0; s2=0; y1 = 400;  y2 = 400;  x = 500;  y = 500;  dx=-1;  dy=0;
  
  //BACKGROUND MENÙ
  background(campo);
  noStroke();
  fill(0,0,0,0);
  rect(10,y1,45,250);
  rect(990,y2,-45,250);
  circle(x,y,100);
  image(palla,x -palla.width/2,y-palla.height/2);
  image(rac,10 +(45-rac.width)/2,y1+(140-palla.height)/2);
  image(rac2,990 +(-45-rac2.width)/2,y2+(140-palla.height)/2);
  
  //TESTO MENÙ
  fill(255,255,255);
  textSize(70); text("SCEGLI LA MODALITÀ",200,89);text("1",250,300);text("2",485,300);text("3",750,300);
  textSize(40); text("5 PUNTI",200,470);text("10 PUNTI",430,470); text("15 PUNTI",700,470);
  text("<~~  W = SU" ,100,600);text("<~~  S = GIÙ",100,700);
  text("O = SU   ~~>",700,600);text("K = GIÙ  ~~>",700,700); }
  
  //GAME OVER
  if(MODE==2){ background(255,0,0);fill(0,0,0);textSize(70);text("GIOCATORE:  "+p+"  HA VINTO!!!",100,350);
textSize(150);text("P1:  "+r1,100,590);text("P2:  "+r2,550,590);
textSize(70);text("PREMI 'R' PER TORNARE AL MENÙ",5,750);}

  //GIOCO
  if(MODE==1){
    
  //GAMEMODE + INCREMENTI DIFFICOLTÀ
  if(gm==1){if(s1 >= 3 || s2 >= 3){v = 10; vr = 7;}
            if(s1 == 5 ){end.rewind();end.play();MODE=2;p=1;s1=0;s2=0;r1++;}if(s2 == 5){end.rewind();end.play();MODE=2;p=2;s1=0;s2=0;r2++;}}
            
  if(gm==2){if(s1 >= 5 || s2 >= 5){v = 9; vr = 7;}
           if(s1 >= 7 || s2 >= 7){v = 12; vr = 8;}
           if(s1 == 10 ){end.rewind();end.play();MODE=2;p=1;s1=0;s2=0;r1++;}if(s2 == 10){end.rewind();end.play();MODE=2;p=2;s1=0;s2=0;r2++;}}
           
  if(gm==3){if(s1 >= 5 || s2 >= 5){v = 9; vr = 7;}
           if(s1 >= 10 || s2 >= 10){v = 12; vr = 8;}
           if(s1 == 15 ){end.rewind();end.play();MODE=2;p=1;s1=0;s2=0;r1++;}if(s2 == 15){end.rewind();end.play();MODE=2;p=2;s1=0;s2=0;r2++;}}
  
  //LEGGI ORARIE
  y1=y1+dy1*vr;
  y2=y2+dy2*vr;
  x=x+dx*v;
  y=y+dy*v;
  
  //SCHERMO DI GIOCO//
  //TESTO
  background(campo);
  fill(255,255,255);
  textSize(50); text(s1+"-"+s2,460,60); text("VITTORIE:  "+r1,100,60); text("VITTORIE:  "+r2,630,60);
  if(r1>r2){text("#",410,60);}  if(r2>r1){text("#",570,60);}
  //BARRIERA ROSSA
  stroke(255,0,0);
  fill(255,0,0);
  rect(0,0,10,1000);
  rect(990,0,10,1000);
  //RACCHETTE
  stroke(0,0,0,0);
  fill(0,0,0,0);
  rect(10,y1,45,250);
  rect(990,y2,-45,250);
  image(rac,10 +(45-rac.width)/2,y1+(140-palla.height)/2);
  image(rac2,990 +(-45-rac2.width)/2,y2+(140-palla.height)/2);
  //PALLINA
  circle(x,y,100);
  image(palla,x -palla.width/2,y-palla.height/2);


  //RIMBALZO PALLINA SU RACCHETTE
  if(x<110){if( y>=y1-60 ){if(y<=(y1+250)){rim.rewind();rim.play();dx=+1;if(dy==0){dy=-1;}}}}//110=(10+45)*2
  if(x>890){if( y>=y2-60 ){if(y<=(y2+250)){rim.rewind();rim.play();dx=-1;if(dy==0){dy=-1;}}}}//890=-10+990-45*2  
  if(x<110){if( y>=y1+80 ){if(y<=(y1-250)){rim.rewind();rim.play();dx=+1;}}}//110=(10+45)*2
  if(x>890){if( y>=y2+80 ){if(y<=(y2-250)){rim.rewind();rim.play();dx=-1;}}}//890=-10+990-45*2  
  
  
  //RIMBALZO PALLINA SU PARETI ROSSE
  if(x<=+50){y1 = 400;  y2 = 400;
  x = 500;   y = 500;
  dx=-1;     dy=0;s2=s2+1;}//50 = raggio
  if(x+50>=1000){y1 = 400;  y2 = 400;
  x = 500;   y = 500;
  dx=+1;     dy=0;s1=s1+1;}
  
  //RIMBALZO SU PARETI
  if(y1<=0){y1=0;}
  if(y1>=1000-250){y1=1000-250;}
  if(y2<=0){y2=0;}
  if(y2>=1000-250){y2=1000-250;}
  if(y<=50){dy=+1;}
  if(y>=950){dy=-1;}
  }
  
}
void keyPressed(){
  
 if (key == 'w'){dy1=-1;}
 if (key == 's'){dy1=+1;}
 if (key == 'o'){dy2=-1;}
 if (key == 'k'){dy2=+1;}
 if (MODE == 0){
 if (key == '1'){MODE=1; gm=1;}
 if (key == '2'){MODE=1; gm=2;}
 if (key == '3'){MODE=1; gm=3;}
 }
 if (MODE == 2){
 if (key == 'r'){MODE=0; gm=0;}
 }
                 
}
void keyReleased(){
  
 if (key == 'w'){dy1=0;}
 if (key == 's'){dy1=0;}
 if (key == 'o'){dy2=0;}
 if (key == 'k'){dy2=0;}
  
}
