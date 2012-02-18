//import processing.pdf.*;

color bgcolor = color(12,122,255);
color textcolor = color(255,255,255);
int imwidth = 16;
int imheight = 16;

String name = "dvl";
int len = name.length();
PFont f;
float fontheight = max(imheight / 3,10);

float x,y;

void setup(){
  //size(imwidth,imheight,PDF,"logo_"+imwidth+"x"+imheight+".pdf");
  size(imwidth,imheight);
  f = createFont("Dotum",fontheight);
}

void draw(){
  textFont(f,fontheight);
  background(bgcolor);
  fill(textcolor);

  x = 0;
  y = 0;

  for(int i=0;i<len;i++){
    char string = name.charAt(i);
    x = (i+1)*imwidth/4-textWidth(string)/2;
    y = (i+1)*imheight/4 + fontheight/3;
    text(string,x,y);
  }
  
  saveFrame("logo_"+imwidth+"x"+imheight+".png");
  println("Done");
  exit();
}

