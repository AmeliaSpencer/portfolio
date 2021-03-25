class SpaceShip {
  // member variables
  int x, y, health, ammo, lives, rad, r;
  char displayMode;
  color c1;
  PImage ship;
  

  //constructor
  SpaceShip(color c1) {
    x = 0;
    y = 0;
    health = 100;
    ammo = 200;
    lives = 3;
    displayMode = '1';
    this.c1 = c1;
    rad = 25;
     ship = loadImage("SHIP.png");
  }

  // Rock vs. Ship Collision
  boolean rockIntersection(Rock rock) {
    float distance = dist(x,y,rock.x, rock.y);
    if(distance < rad + rock.rad) {
      return true;
    } else {
      return false;
    }
  }
  
   boolean puIntersect(PowerUp pu) {
    // Calculate distance
    float distance = dist(x, y, pu.x, pu.y); 

    // Compare distance to sum of radii
    if (distance < r + pu.r) { 
      return true;
    } else {
      return false;
    }
  }
  
  boolean enemyLaserIntersect(EnemyLaser elaser) {
    // Calculate distance
    float distance = dist(x, y, elaser.x, elaser.y); 

    // Compare distance to sum of radii
    if (distance < r + elaser.r) { 
      return true;
    } else {
      return false;
    }
  }
  
  //  boolean shipIntersect(Enemy enemy) {
  //  // Calculate distance
  //  float distance = dist(x, y, enemy.x, enemy.y); 

  //  // Compare distance to sum of radii
  //  if (distance < r + enemy.r) { 
  //    return true;
  //  } else {
  //    return false;
  //  }
  //}

  //member methods
  void display(int x, int y) {
    this.x=x;
    this.y=y;
    
    image(ship, x-23, y);
    
    //if (displayMode == '1') {
    //  rectMode(CENTER);
    //  stroke(150);
    //  strokeWeight(2);
    //  fill(65);
    //  rect(x+18, y+10, 8, 8);
    //  rect(x-18, y+10, 8, 8);
    //  line(x+35, y, x+35, y+10);
    //  line(x-35, y, x-35, y+10);
    //  line(x+30, y-5, x+30, y);
    //  line(x-30, y-5, x-30, y);
    //  triangle(x, y-20, x+40, y+10, x-40, y+10);
    //  fill(200);
    //  ellipse(x, y, 20, 80);
    //  fill(255);
    //  ellipse(x, y-30, 10, 10);
    //}
  }
}
