class Rock {
  //member variables
  int x, y, dia, health, speed, rad;
  char displayMode;
  color c;
  PImage asteroid;

  //constructor
  Rock(int x, int y) {
    this.x = x;
    this.y = y;
    dia = 50;
    health = 10;
    speed = int(random(1, 8));
    displayMode = '1';
    c = #C16E29;
    asteroid = loadImage("ASTROID.png");
    rad = 25;
  }
  
  // Rock vs. Bullet
  boolean bulletIntersection(Bullet b) {
    float distance = dist(x,y,b.x, b.y);
    if(distance < rad + b.rad) {
      return true;
    } else {
      return false;
    }
  }

  boolean reachedBottom() {
    if (y>height) {
      return true;
    } else {
      return false;
    }
  }  

  void move() {
    y+=speed;
  }

  //member methods
  void display() {
    image(asteroid, x-23, y-20);
  }
}
