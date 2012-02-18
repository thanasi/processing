int r = 100;
int g = 150;
int b = 23;

void setup () {
  size(500,500);
  stroke(255);
}

void draw() {
  background(r,g,b);
  line(150,25, mouseX,mouseY);
}

void mousePressed() {
  r += 15;
  g += 30;
  b += 21;
  r = r%256;
  g = g%256;
  b = b%256;
}
