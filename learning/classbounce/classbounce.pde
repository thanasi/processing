class Boundary {
  color c;
  float x0;
  float y0;
  float bwidth;
  float bheight;
  boolean visible;
  
  Boundary(color c_, float x0_, float y0_, float bwidth_, float bheight_) {
    c = c_;
    x0 = x0_;
    y0 = y0_;
    bwidth = bwidth_;
    bheight = bheight_;
    visible = true;
  }
  
  void drawb() {
    if (visible){
      noFill();
      stroke(c);
      rect(x0,y0,bwidth,bheight);
    }
  }
  
  void changeVis() {
    visible = !visible;
  }
  
  void changeVis(boolean tf) {
    visible = tf;
  }
}

class Particle {
  color c;
  float r;
  float x;
  float y;
  float speed_x;
  float speed_y;

  Particle(color c_, float r_, float x0, float y0, float sx, float sy) {
    c = c_;
    r = r_;
    x = x0;
    y = y0;
    speed_x = sx;
    speed_y = sy;
  }
  
  void drawp() {
    fill(c);
    ellipse(x,y,2*r,2*r);
  }
  
  void check_collisions(Boundary b) {
    if (b.visible){
      if ((x+r>=b.x0+b.bwidth) || (x-r<=b.x0)) {
        speed_x = -speed_x;
      }
      if ((y+r>=b.y0+b.bheight) || (y-r<=b.y0)) {
        speed_y = -speed_y;
      }
    }
  }
  
  void move () {
    x = (x + speed_x) % width;
    y = (y + speed_y) % height;
  }
  
  void pos() {
    println("x: " + x + "\ty: " + y);
  }
}
  
/* Start main loop */
int scr = 500;
int dt = 4;
Boundary b = new Boundary(color(0), 50,50, 400,400);
Particle p = new Particle(color(0,0,255,126), 50,300,300, 10, 15);

void setup(){
  size(scr,scr);
  frameRate(dt);
}

void draw() {
  background(255);
  b.drawb();
  p.check_collisions(b);
  p.move();
  p.pos();
  p.drawp();
}
