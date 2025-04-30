Table table;
int numDays;
String[] dates;
float[] boxOffice;
float[] boxOfficeShare;
String[] weekdays;
String[] comment;
PImage img;
PImage img1;
int currentImage=0;
int currentday= 0;
float maxboxoffice = 120; //set the max as the scale for convenience.
boolean check = false;
ArrayList<ParticleSystem> fireSystems;
float displayBoxOffice = 0;
float increase = 0.60;
float startTime;
import processing.sound.*;
SoundFile soundfile;
int numberofcomments;
int a;
PFont myFont;
float markTime;
void setup(){
   myFont = createFont("Arial", 24, true);
  a = int(random(0,11));
  markTime = millis();
  soundfile = new SoundFile(this,"NEZHA.mp3");
  startTime = millis();
  size(1200,800);
  table = loadTable("Nezha2.csv","header");
  
  img = loadImage("nezha.png");
  img1 = loadImage("nezha4.png");
 
  numDays = table.getRowCount();
  dates = new String[numDays];  //Initiliaze all the attributes that need in this work.
  boxOffice = new float[numDays];
  comment = new String[numDays];
  soundfile.play();
 
  
  for(int j=0; j<numDays;j++){
    TableRow everyrow = table.getRow(j);
    dates[j] = everyrow.getString("date");
    boxOffice[j] = everyrow.getFloat("boxtotal");
    comment[j] = everyrow.getString("comment");
    fireSystems = new ArrayList<ParticleSystem>();
  }
  numberofcomments = comment.length;


}
void drawLinechart(){
  stroke(242,106,132,80);
  strokeWeight(8);
  noFill();
  beginShape();
  for(int i =0; i<currentday;i++){
    float x = map(i,0,numDays-1,150,width-100);
    float y = map(boxOffice[i], 0, maxboxoffice, height-100,100);
    vertex(x,y);
  }
  endShape();// make a lighting effect for the line
  stroke(255,0,0);
  strokeWeight(3);
  noFill();
  beginShape();
  for(int i =0; i<currentday;i++){
    float x = map(i,0,numDays-1,150,width-100);
    float y = map(boxOffice[i], 0, maxboxoffice, height-100,100);
    vertex(x,y);
  }
  endShape();
  if(currentday< numDays){
    currentday+=1;}
  else if(currentday>= numDays){
    check = check==true ? false:true;
    
  
  }}
    
    
    // make every 5 framecounts to add 1, so that it won't draw so fast 
  

  




void XYaxis(){
  stroke(242,106,132,80);
  strokeWeight(2);
  for(int i=0;i<maxboxoffice;i+=20){
    float ycoordinates = map(i,0,maxboxoffice,height-100,100);
    line(100,ycoordinates,width-50,ycoordinates);
  }  // make a little grid;
  for(int i=0;i<numDays;i+=5){
    float xcoordinates = map(i,0, numDays-1, 150,width-100);
    line(xcoordinates,height-100, xcoordinates,100);
  }
  stroke(255);
  strokeWeight(3);
  line(100,height-100,width-50,height-100);// draw xaxis
  line(100,height-100, 100,100);
  textSize(18);
  
  for(int i=0;i<numDays;i+=5){
    float x = map(i,0,numDays-1,150,width-100);
    fill(0,150);
    textAlign(CENTER,CENTER);
    fill(255);
    text(dates[i], x+30, height-80);
  }
  for(int i = 0; i<=maxboxoffice; i+=20){
    float y = map(i,0,maxboxoffice, height-100,100);
    fill(0,150);
    textAlign(RIGHT,CENTER);
    fill(255);
    text(i+"HM", 90,y);
  }
}
void demonstrate_real_time_data(){
 
  textSize(24);
  fill(255);
  textAlign(LEFT,TOP);
  if(currentday>0){
    float value = boxOffice[currentday-1];
    if(displayBoxOffice<value){
      displayBoxOffice += increase;
      
    if(displayBoxOffice>= value){displayBoxOffice = value;}
       
    }
    text("Total boxoffice Until Feb 15 (RMB) "  +": " + nf(displayBoxOffice,0,2) + "HM", 20,20);
  }
  else{
    text("Day 0: 0.00 HM", 20,20);
  
  }
    
  
  }
  




void WindFireWheel(){
  pushMatrix();
  translate(270, 250);
  stroke(255, 204, 0, 180);
  strokeWeight(3);
  noFill();
  ellipse(0, 0, 240, 240);
  
  rotate(frameCount * 0.02);
  for(int i = 0; i < 12; i++){
    float angle = TWO_PI/12 * i;
    float x1 = cos(angle)*120;
    float y1 = sin(angle)*120;
    float x2 = cos(angle)*130;
    float y2 = sin(angle)*130;
    line(x1, y1, x2, y2);
  }
  popMatrix();
}
void draw(){
  background(0);
  float current = millis()-markTime;
  if(currentImage==0){
  image(img, width-400,height-500,320,340);}
  else{
  image(img1, width-400,height-500,320,340);}
  
  if(current>3000){
    currentImage = (currentImage+1)%2;
    markTime = millis();
  }
 
  XYaxis();
  WindFireWheel();
  drawLinechart();
  drawFireEffect();
  demonstrate_real_time_data();
  
  fill(50,50,200,180);
  noStroke();
  
  fill(255,map(millis()%100,0,100,50,255));
  textSize(20);
  textAlign(RIGHT,CENTER);
  drawComments();
 

  

}

void drawComments(){
  String film = "NE ZHA II";
  textAlign(LEFT,CENTER);
  textSize(70);
  for(int i=0; i<5; i++){
    float factor = i*1.5;
    int alpha = int(100-i*15);
    fill(255,215,0,alpha);
    text(film, 100+factor, 90+factor);
  }
  fill(255,223,90+sin(frameCount*0.1)*50);
  text(film, 100, 90);
  float current = millis()-startTime;
  fill(#FFFF00);
  ellipse(270,250,240,240);
  textAlign(CENTER, CENTER);
  noStroke();
  fill(0);
  textSize(10);
  textFont(myFont);
  if(current<4000){
 
  text(comment[a], 170,140,200,200);}
  else{
    startTime = millis();
    a = int(random(0,11));
  }

 
}


class Particle {
  PVector position, velocity;
  float lifespan, size;
  color c;
  
  Particle(PVector origin){
    position = origin.copy();
    velocity = new PVector(random(-2,2), random(-5,5));
    lifespan = 255;
    size = random(3,9);
    float temp = map(position.y, height-100, 100, 0, 1);
    c = lerpColor(color(60), color(255,50,0), temp);
  }
  
  void update(){
    position.add(velocity);
    lifespan -= 6;
  }
  
  void display(){
    noStroke();//make it glow
    frameRate(10);
    fill(c, lifespan/2);
    ellipse(position.x, position.y, size*2, size*2);
   // another layer of particles here.
    fill(c, lifespan);
    ellipse(position.x, position.y, size, size);
  }
  
  boolean isDead(){
    return lifespan < 0;
  }
}
void drawFireEffect(){
  if(frameCount % 10 == 0 && fireSystems.size() < numDays){
    int index = fireSystems.size();
    float x = map(index, 0, numDays-1, 150, width-100);
    float y = map(boxOffice[index], 0, maxboxoffice, height-100, 100);
    fireSystems.add(new ParticleSystem(new PVector(x, y)));
  } blendMode(ADD);
  for(ParticleSystem ps : fireSystems){
    ps.update();ps.display();
    

}
  blendMode(BLEND);
}


class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  
  ParticleSystem(PVector location){
    origin = location.copy();
    particles = new ArrayList<Particle>();
  }
  
  void update(){
    for (int i = 0; i < 10; i++){
      particles.add(new Particle(origin));
    }
    for (int i = particles.size()-1; i >= 0; i--){
      Particle p = particles.get(i);
      p.update();
      if(p.isDead()){
        particles.remove(i);
      }
    }
  }
  
  void display(){
    for(Particle p : particles){
      p.display();
    }
  }
}
