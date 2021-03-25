//class EnemyShip {
//  // member variables
//  int r, health, x, y, speed,healthStart;
//  boolean right;
//  int savedTime; 
//  int totalTime;

//  EnemyShip(int x, int y,int t, int health) {
//    healthStart = health;
//    r = 25;
//    this.x = x;
//    this.y = y;
//    this.health = health;
//    speed = 5;
//    this.totalTime = t;
//  }

//  void display() {
//    fill(#F29420);
//    triangle(x, y+30, x+40, y-20, x-40, y-20);
//    fill(0);
//    textSize(12);
//    textAlign(CENTER);
//    text(health,x,y);
//  }
  
//  void move() {
//    x += speed;
//    if (x >= width|| x <= 0) {
//      speed *= -1;
//      y+=50;
//    }
//  }

//  boolean bulletIntersection(Bullet bullet) {
//    // Calculate distance
//    float distance = dist(x, y, bullet.x, bullet.y); 

//  //  // Compare distance to sum of radii
//  //  if (distance < r + bullet.r) { 
//  //    return true;
//  //  } else {
//  //    return false;
//  //  }
//  //}
  
//  void start() {
//    savedTime = millis();
//  }

  
//  boolean isFinished() { 
//    int passedTime = millis()- savedTime;
//    if (passedTime > totalTime) {
//      return true;
//    } else {
//      return false;
//    }
//  }
//}
