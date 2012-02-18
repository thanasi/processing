import processing.pdf.*;

color bgcolor = color(4,131,224);
color textcolor = color (255,255,255);
int imwidth = 32;
int imheight = 32;

String name = "dvl";
int len = name.length();
PFont f;
float fontheight = imheight / 3;

float x,y;

void setup(){
  size(imwidth,imheight,PDF,"favicon.pdf");
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
  println("Done");
  exit();
}

