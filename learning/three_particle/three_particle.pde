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
  
  void draw() {
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
  
  void draw() {
    fill(c);
    ellipse(x,y,2*r,2*r);
  }
  
  void check_collisions(Boundary b) {
    if (b.visible){
      if ((x+r+speed_x>b.x0+b.bwidth) || (x-r+speed_x<b.x0)) {
        speed_x = -speed_x;
      }
      if ((y+r+speed_y>b.y0+b.bheight) || (y-r+speed_y<b.y0)) {
        speed_y = -speed_y;
      }
      if (x < b.x0){
        x += 2*r;
        speed_x = -speed_x;
      }
      if (x > b.x0+b.bwidth){
        x -= 2*r;
        speed_x = -speed_x;
      }
      if (y < b.y0){
        y += 2*r;
        speed_y = -speed_y;
      }
      if (y > b.y0+b.bheight){
        y -= 2*r;
        speed_y = -speed_y;
      }  
    }
  }
    void check_collisions(Particle p) {
      if (dist(x+speed_x,y+speed_y,p.x+p.speed_x,p.y+p.speed_y)<2*r){
        if (abs((x+speed_x)-(p.x+p.speed_x)) < 2*r){
          speed_x = -speed_x;
          p.speed_x = -p.speed_x;
        }
        if (abs((y+speed_y)-(p.y+p.speed_y)) < 2*r){
          speed_y = -speed_y;
          p.speed_y = -p.speed_y;
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
int dt = 10;
Boundary b = new Boundary(color(0), 50,50, 400,400);
Particle p1 = new Particle(color(0,0,255,126), 25,350,300, 10, 15);
Particle p2 = new Particle(color(0,255,0,126), 25,250,300, 20, 15);
Particle p3 = new Particle(color(255,0,0,126), 25,55,200, -10, 5);

void setup(){
  size(scr,scr);
  frameRate(dt);
}

void draw() {
  background(255);
  b.draw();
  p1.check_collisions(b);
  p2.check_collisions(b);
  p3.check_collisions(b);
  p1.check_collisions(p3);
  p1.check_collisions(p2);
  p2.check_collisions(p3);
  p1.move();
  p2.move();
  p3.move();
  p1.draw();
  p2.draw();
  p3.draw();
}
