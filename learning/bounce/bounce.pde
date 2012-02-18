color c = color(0);
float x0 = 25;
float y0 = 50;
float rectwidth = 100;
float rectheight = 100;
float x = 50;
float y = 100;
float speed_x = .25;
float speed_y = .35;
float r = 5;

void setup(){
  size(200,200);
}

void draw() {
  background(255);
  noFill();
  stroke(0,0,0);
  rect(x0,y0,rectwidth,rectheight);
  move();
  display();
}

void move() {
  x = (x + speed_x) % width;
  y = (y + speed_y) % height;
  if ((x+r>=x0+rectwidth) || (x-r<=x0)) {
   speed_x = -speed_x;
  }
  if ((y+r>=y0+rectheight) || (y-r<=y0)) {
   speed_y = -speed_y;
  }
  
  println("x:"+x+"\ty:"+y);
}

void display() {
  fill(c);
  ellipse(x,y,r,r);
}
