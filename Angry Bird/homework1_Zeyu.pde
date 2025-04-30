PFont font;
void setup(){
  size(590,840);
  background(255,3,3);
  smooth(3);
  font = createFont("Courier New Bold", 48);
  textFont(font);

  
  
}

void draw(){
  strokeWeight(3);
  stroke(0);
  fill(255,3,3);
  
  //draw crow curve(control point, startpoint, endpoint, control point2)
  curve(85,370,0,420, 110,311, 154,251);
  
  
  
  curve(94,320,110,311,118,300,118,290);
  curve(170,120, 118,300,154,160, 265,97);
  curve(232,366,154,160,320,70, 345,201);
  curve(360,100,320,70,360,72,633,-28);
  curve(662,12,360,72,550,59,1286,174);
  curve(718,60,550,60,360,150,676,103);
  curve (540,230,360,150,570,160,477,223);
  curve(1278,243,570,160,420,250,602,233);
  curve(-493,180,420,250,280,840,264,805);
  //try fill the color manually 第一段矩形 fill a rect first
  noStroke();
  fill(0);
  beginShape();
  vertex(0,420);
  vertex(0,840);
  vertex(280,840);
  vertex(280,420);
  endShape();
  //第二段连接第一个curve构成了一个三角形,fill triangle
  fill(0);
  beginShape();
  vertex(0,420);
  curveVertex(94,320);
  curveVertex(110,311);
  curveVertex(118,300);
  curveVertex(118,290);
  vertex(118,290);
  vertex(280,420);
  
  //the third part, fill it like a gentleman
  endShape();
  beginShape();
  fill(0);
  vertex(280,840);
  vertex(280,420);
  vertex(420,250);
  curveVertex(-493,180);
  curveVertex(420,250);
  curveVertex(280,840);
  curveVertex(264,805);
  endShape();
  
  beginShape();
  fill(0);
  vertex(280,420);
  vertex(118,290);
  vertex(420,250);
  endShape();
  
  beginShape();
  fill(0);
  vertex(118,290);
  curveVertex(170,120);
  curveVertex(118,300);
  curveVertex(154,160);
  curveVertex(265,97);
  vertex(420,250);
  endShape();
  
  beginShape();
  fill(0);
  vertex(154,160);
  curveVertex(232,366);
  curveVertex(154,160);
  curveVertex(320,70);
  curveVertex(345,201);
  vertex(360,150);
  endShape();
  
  beginShape();
  fill(0);
  vertex(154,160);
  vertex(360,150);
  vertex(420,250);
  endShape(); 
  
  beginShape();
  fill(0);
  vertex(380,190);
  vertex(360,150);
  curveVertex(540,230);
  curveVertex(360,150);
  curveVertex(570,160);
  curveVertex(477,223);
  vertex(380,190);
  endShape();
  //鸟的hui
  beginShape();
  fill(0);
  vertex(570,160);
  curveVertex(1278,243);
  curveVertex(570,160);
  curveVertex(420,250);
  curveVertex(602,233);
  vertex(380,190);
  
  endShape();
  
  beginShape();
  fill(0);
  vertex(360,150);
  curveVertex(360,100);
  curveVertex(320,70);
  curveVertex(360,72);
  curveVertex(633,-28);
  
  endShape();
  
  beginShape();
  fill(0);
  vertex(360,72);
  curveVertex(662,12);
  curveVertex(360,72);
  curveVertex(550,59);
  curveVertex(1286,174);
  vertex(360,150);
  endShape();
  
  beginShape();
  stroke(246,250,249);
  strokeWeight(4);
  line(262,115, 291,145);
  line(290,110, 263,156);
  endShape();
  
  beginShape();
  stroke(255);
  strokeWeight(3);
  rect(200,600,90,90);
  
  endShape();
  
  
  stroke(255);
  strokeWeight(3);
  rect(210,610, 70,70);
  fill(255);
  textSize(45);
  text("Pb", 218,657);
  
 
  for (int x = 485; x<548; x+=37){
    for (int y = 150; y<=182; y+=6){
      fill(255);
      beginShape();
      line(x-25,y-27, y+291,x+-387);
    }
  }
   textSize(30);
   text("Plumbum Killer\n", 336,731);
   textSize(20);
   text("\nSave the birds",338,750);
   
   int times = 6;
   int a = 440;
   int b = 230;
   
   for(int i = 0; i<times;i++){
     float c = random(a,840);
   float d = random(0,b);
   
   float f = random(20,45);
     
     fill(255);
     textSize(f);
     text("Pb",d,c);
     
     
     
     
   }
  
   }
