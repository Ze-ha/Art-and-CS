float[][] starlocation = new float[300][2];
int numbertotal = 10;
String[] mark = {"☉", "♆", "⚚", "✦", "✵", "⊕", "⛢"};
int len = mark.length;
PFont font;
import processing.sound.*;
SoundFile file;
int startTime;
float duration = 10000;
int state = 0;
float current;
void setup(){
  startTime = millis();
  font = createFont("Arial ", 50);
  textFont(font);
  file = new SoundFile(this,"Interstellar.mp3");
  file.play();
  size(800,800);
  background(10,10,30);
  for(int i =0; i<300; i++){
          starlocation[i][0] = random(width);
          starlocation[i][1] = random(height);
  
  fill(255,255,255,random(120,255));
  ellipse(starlocation[i][0], starlocation[i][1],5,2); // making a silky river, background setting. 
  }
  noFill();

}
void parametrization(int x, int y, int totalnumber, float innerradius, float outerradius){// x, y means the center of the circle
    pushMatrix();
    float perangle = TWO_PI/ totalnumber;
    for(int i =0; i< totalnumber; i++){
    float currentangle = i* perangle;
    float x1 = x+ cos(currentangle)*outerradius;
    float y1 = y + sin(currentangle)*outerradius; // this is the coordinates of the vertex
    float x2 = x + cos(currentangle-perangle/2)*innerradius;
    float y2 = y + sin(currentangle-perangle/2)*innerradius;
    float x3 = x + cos(currentangle+perangle/2)*innerradius;
    float y3 = y + sin(currentangle+perangle/2)*innerradius;
    beginShape();
   // stroke(255,map(i,0,totalnumber-1,250,10)*abs(sin(frameCount*0.05)));
    vertex(x1,y1);
    vertex(x2,y2);
    vertex(x3,y3);
    vertex(x1,y1);
    endShape();
    }
    
    strokeWeight(2);
    
    ellipse(x,y, innerradius*2, innerradius*2);
    ellipse(x,y, innerradius*2-20, innerradius*2-20);
    ellipse(x,y, innerradius*2-30, innerradius*2-30);
    popMatrix();
}
void square(float size){
    int totalsquare = 3;
    for(int i=0; i< totalsquare; i++){
       pushMatrix();
       translate(width/2, height/2);
       if(millis()>5000){
       rotate(frameCount*0.01);}
      // rotate(angu);
       rectMode(CENTER);
       rect(0,0, size,size);
       popMatrix();
       
      
      
    
    }
  
  
  
  
}
void rect(int countrec, float radius){
     blendMode(ADD);
     stroke(208,6,244);//can change color here
     
     for(int m=0; m<countrec; m++){
     float an = TWO_PI/ countrec;
     float bn = an * m;
     float xc = width/2 + cos(bn)*radius;
     float yc = height/2 + sin(bn)*radius;
     pushMatrix();
     translate(xc,yc);
     if(millis()>5000)
     rotate(bn+frameCount*0.1);
     rectMode(CENTER);
     rect(0,0,10,20);
     popMatrix();
      
      
    
    }

}
void ShrinkMatrix(float current){
    float zoomin = 1-0.01*current*0.06;
    blendMode(ADD);
    parametrization(width/2, height/2, 10, 91*zoomin,150*zoomin);
    rect(80,160*zoomin);
    rect(50, 220*zoomin);
   
    
    strokeWeight(2);
    ellipse(width/2, height/2, 150*zoomin,150*zoomin);
    noFill();
    ellipse(width/2, height/2, 180*zoomin,180*zoomin);
    ellipse(width/2, height/2, 305*zoomin,305*zoomin);
    ellipse(width/2, height/2, 340*zoomin,340*zoomin);
    square(120*zoomin);
   
    square(300*zoomin);
    strokeWeight(4);
    ellipse(width/2, height/2, 520*zoomin,520*zoomin);
    strokeWeight(2);
    ellipse(width/2, height/2, 500*zoomin,500*zoomin);
    
    for(int i =0; i< len; i++){
      textAlign(CENTER,CENTER);
      textSize(50);
      float jiao = i * TWO_PI/ len;
      float radius = 300*zoomin;
      float xr = width/2 + radius* cos(jiao);
      float yr = height/2 + radius*sin(jiao);
      text(mark[i], xr,yr);
}}
void BasicMatrix(){  blendMode(ADD);
    parametrization(width/2, height/2, 10, 91,150);
    rect(80,160);
    rect(50, 220);
   
    
    strokeWeight(2);
    ellipse(width/2, height/2, 150,150);
    noFill();
    ellipse(width/2, height/2, 180,180);
    ellipse(width/2, height/2, 305,305);
    ellipse(width/2, height/2, 340,340);
    square(120);
   
    square(300);
    strokeWeight(4);
    ellipse(width/2, height/2, 520,520);
    strokeWeight(2);
    ellipse(width/2, height/2, 500,500);
    
    for(int i =0; i< len; i++){
      textAlign(CENTER,CENTER);
      textSize(50);
      float jiao = i * TWO_PI/ len;
      float radius = 300;
      float xr = width/2 + radius* cos(jiao);
      float yr = height/2 + radius*sin(jiao);
      text(mark[i], xr,yr);
}}
void draw(){
    float current = millis()-startTime;
    if(state==0){
      if(current<duration*0.8){
       // background(10,10,30);
      
         BasicMatrix();
    }
    else{state = 1; startTime = millis();}
}
else if(state ==1){
  if(current<duration*1.6){
    background(10,10,30);
    ShrinkMatrix(current);
  }
  else{state =2; startTime = millis();}
 
}
else if(state==2){
  if(current<duration*1.2){
    ShrinkMatrix(current);
  }
  else{state=3; startTime = millis();}

}
else{
  background(10,10,30);
  BasicMatrix();
  state=0;
  startTime = millis();
  stroke(random(100,208),6,244);
  fill(random(50,150),random(0,80),random(180,255));
  


}


}
