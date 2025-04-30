color choose;
PImage img;
PImage starcirc;
PImage whe;
PImage sunf;
boolean change = true;
PImage star;
PImage re;
int tileCount =10;
import processing.sound.*;
SoundFile file;
SoundFile thing;



void setup() {
     frameRate(4);
    size(700, 900);
    img = loadImage("Van Gogh.jpg");
    starcirc = loadImage("star.png");
    whe = loadImage("wheat.jpg");
    file = new SoundFile(this,"Vincent.mp3");
    thing = new SoundFile(this,"Things you said.mp3");
    sunf = loadImage("sunflower.png");
    star = loadImage("starr.png");
    re = loadImage("reaper.png");
    if(change){file.play();}
    background(6,38,102); }

  
void draw() {

             if(change){
               set();
            for(int i =0; i<tileCount;i++){
              for(int j=0; j<tileCount;j++){
               pushMatrix();
               translate(width/tileCount/2, height/tileCount/2);
               strokeWeight(mouseY/60);
               float posX = width*1.0/tileCount*i;
               float posY = height*1.0/tileCount*j;
              float shiftY = random(-mouseY, mouseY)/20;
              noStroke();
              image(star,posX,posY+shiftY,mouseY/20,mouseY/30);
              image(star,posX,posY,mouseY/20,mouseY/45);
              popMatrix();
            }}
             image(img, 110,170,480,511);}
        else{ 
            
           
          image(whe, 110,170,480,511);}
        
        }

    
  
void VanGogh() {
  int grid = 1;  
  for (int x = 0; x < width; x += grid) {
    for (int y = 0; y < height; y += grid) {
      float r = random(10, 30);  
      float g = random(20, 50);  
      float b = random(80, 120); 
      fill(r, g, b); 
      noStroke();  
      float c = random(-2, 2);
      float d = random(-2, 2);
      rect(x + c, y + d, grid, grid);
    }
  }
}
void drawCluster (float c, float d){
   int size = int(random(5,25));
   for(int i =0; i<size;i++){
     float m = random(-10,10);
     float n = random(-10,10);
     fill(0);
     noStroke();
     ellipse(c+m,d+n,random(10,20),random(10,30));}
}
void mouseMoved(){
  if(change){
  image(star,mouseX-25,mouseY-20, 50,50);}
  else{
  image(sunf,mouseX-25,mouseY-20,80,80);

}}
void mousePressed(){
   //image(img, 110,170,480,511);
   if(mouseX<480 && mouseX>110 && mouseY<511 && mouseY>170)
     {change = !change;}
   file.stop();
   if(change){ 
       if(thing.isPlaying()){thing.stop();}
     file.loop();
   }
      
    else{
      thing.play();
       int gridSize = 1; 
             for (int x = 0; x < width; x += gridSize) {
        for (int y = 0; y < height; y += gridSize) {
            float xx = random(-4, 5); 
            float yy = random(-5, 5);
            if(random(1)>0.4){
             choose = color(248,224,126);}
             else{
               choose = color(242,115,3);}
            fill(choose);
            noStroke();
            ellipse(x + xx, y + yy, random(30, 40), random(10, 20));}
          }
           for(int i =0; i<tileCount;i++){
              for(int j=0; j<tileCount;j++){
               pushMatrix();
               translate(width/tileCount/2, height/tileCount/2);
               strokeWeight(mouseY/60);
               float posX = width*1.0/tileCount*i;
               float posY = height*1.0/tileCount*j;
              float shiftY = random(-mouseY, mouseY)/20;
              noStroke();
              image(re,posX,posY+shiftY,mouseY/30,mouseY/30);
              image(re,posX,posY,mouseY/30,mouseY/30);
              popMatrix();}}
    
  

}}
void set(){ 
int gridSize = 3; 
    for (int x = 0; x < width; x += gridSize) {
        for (int y = 0; y < height; y += gridSize) {
            float xx = random(-4, 5); 
            float yy = random(-5, 5);
            if(random(1)>0.2){
              choose = color(10,20,80);}
             else{
               choose = color(4,6,8);}
            fill(choose);
            noStroke();
            ellipse(x + xx, y + yy, random(30, 40), random(10, 20));
           
              
        }}
        
          for(int i =0; i<10;i++){
             float m = random(width/2);
             float n = random(height/1.5);
             drawCluster(m,n);}
             VanGogh();
    
}



     
     
    
