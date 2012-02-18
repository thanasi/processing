import processing.pdf.*;

color bgcolor = color(4,131,224);
color textcolor = color (255,255,255);
int imwidth = 300;
int imheight = 300;

String name = "dvl";
int len = name.length();
PFont f;
float fontheight = 100;

float x,y;

void setup(){
  size(300,300,PDF,"logo.pdf");
  f = createFont("Dotum",100);
}

void draw(){
  textFont(f,fontheight);
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

