color c = color(0);
float x = 0;
float y = 100;
float speed_x = .25;
float speed_y = .35;
float r = 5;

void setup(){
  size(200,200);
}

void draw() {
  background(255);
  move();
  display();
}

void move() {
  x = (x + speed_x) % width;
  y = (y + speed_y) % height;
}

void display() {
  fill(c);
  ellipse(x,y,r,r);
}
