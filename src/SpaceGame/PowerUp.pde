class PowerUp {
  //member variables
  int x, y, speed, r, pu;
  String[] puInfo = {"Ammo", "Health", "Bullets"};

  //constructor
  PowerUp(int x, int y) {
    r = 40;
    this.x = x;
    this.y = y;
    speed = int(random(2, 8));
    pu = int(random(4));
  }

void move() {
y += speed;
}

 boolean reachedBottom() {
    if (y > height + r*4) {
      return true;
    } else {
      return false;
    }
  }  
  //member methods
  void display() {
    noStroke();
    switch(pu) {
    case 0: // Ammo
      fill(255,0,0);
      ellipse(x, y, r, r);
      fill(255);
      textSize(9);
      textAlign(CENTER);
      text(puInfo[0], x, y);
      break;
    case 1: // Health
      fill(0,255,0);
      ellipse(x, y, r, r);
      fill(255);
      textSize(9);
      textAlign(CENTER);
      text(puInfo[1], x, y);
      break;
    case 2: // Lasers
      fill(0,0,255);
      ellipse(x, y, r, r);
      fill(255);
      textSize(9);
      textAlign(CENTER);
      text(puInfo[2], x, y);
      break;
    }
  }
}
