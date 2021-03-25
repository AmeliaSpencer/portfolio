class Bullet {
  //member variables
  int x, y, speed, rad;
  color c;

  //constructor
  Bullet(int x, int y) {
    this.x=x;
    this.y=y;
    speed = 4;
    c = 220;
    rad = 2;
  }

  //member methods
  void fire() {
    y-=speed;
  }
  
  boolean reachedTop() {
    if (y<0-2) {
      return true;
    } else {
      return false;
    }
  }  

  void display() {
    fill(c);
    noStroke();
    rectMode(CENTER);
    rect(x, y, rad, rad*2);
  }
}
