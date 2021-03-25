// SpaceGame | Dec 2020
// by Amelia Spencer
// Images made by Kait R


SpaceShip s1;
import processing.sound.*;
SoundFile bullet;
ArrayList<Bullet> bullets;
ArrayList<Rock> rocks;
ArrayList<Star> stars;
ArrayList<PowerUp> pUps;
//ArrayList<EnemyShip> enemies;
//ArrayList<EnemyLaser> elasers;
Timer timer, puTimer;
int pass, rockRate, rockCountt, score, weaponCount;
boolean play;

void setup() {
  size(500, 500);
  bullet = new SoundFile(this, "pew.wav");
  s1 = new SpaceShip(#384F74);
  bullets = new ArrayList();
  rocks = new ArrayList();
  stars = new ArrayList();
  pUps = new ArrayList();
 // enemies = new ArrayList();
 // elasers = new ArrayList();
  timer = new Timer(int(random(500, 3000)));
  puTimer = new Timer(5000);
  weaponCount = 1;
  score = 0;
  pass = 0;
  play = false;
  timer.start();
  puTimer.start();
}

void draw() {
  noCursor();

  if (!play) {
    startScreen();
  } else {
    background(0);

    stars.add(new Star(int(random(width)), int(random(height))));
    for (int i = 0; i < stars.size(); i++) {
      Star star = stars.get(i);
      star.display();
      star.move();
      if (star.reachedBottom()) {
        stars.remove(star);
      }
    }

    if (timer.isFinished()) {
      rocks.add(new Rock(int(random(width)), -50));
      timer.start();
    }

    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      // Rock vs. Ship Collision
      if (s1.rockIntersection(rock)) {
        s1.health-=rock.health;
        rocks.remove(rock);
        score+=50;
      }
      if (rock.reachedBottom()) {
        pass++;
        rocks.remove(rock);
      }
    }

    for (int i = 0; i < bullets.size(); i++) {
      Bullet bullet = bullets.get(i);
      bullet.display();
      bullet.fire();  
      // Bullet vs. Rock Intersection
      for (int j = 0; j < rocks.size(); j++) {
        Rock rock = rocks.get(j);
        if (rock.bulletIntersection(bullet)) {
          bullets.remove(bullet);
          rock.health-=10;
          if (rock.health<1) {
            rocks.remove(rock);
            score+=rock.health;
          }
        }
      }

      if (bullet.reachedTop()) {
        bullets.remove(bullet);
      }
    }

    //for (int k = 0; k<enemies.size(); k++) {
    //   EnemyShip enemy = enemies.get(k);
    //   if (enemy.laserIntersect(bullet)) {
    //     bullet.remove(bullet);
    //     enemy.health-=20;
    //     if (enemy.health<1) {
    //       score+=enemy.healthStart;
    //       enemies.remove(enemy);
    //     }
    //   }
    // }
    // dispose of lasers at top
    //if (bullet.reachedTop()) {
    //  bullets.remove(bullet);
    //}

    if (puTimer.isFinished()) {
      pUps.add(new PowerUp(int(random(width)), -50));
      puTimer.start();
    }

    for (int i = 0; i < pUps.size(); i++) {
      PowerUp pu = pUps.get(i);
      pu.display();
      pu.move();
      // Rock vs. Ship Collision
      if (s1.puIntersect(pu)) {
        if (pu.pu == 0) {
          s1.ammo+=100;
        } else if (pu.pu == 1) {
          s1.health+=100;
        } else if (pu.pu == 2) {
          weaponCount++;
        } 
        pUps.remove(pu);
      }

      if (pu.reachedBottom()) {
        pUps.remove(pu);
      }
    }


    infoPanel();

    s1.display(mouseX, mouseY);

    if (s1.health<1 || pass>10) {
      play = false;
      gameOver();
    }
  }
}

void mousePressed() {
  if (play) {
    bullet.play();
  }
  if (s1.ammo >0) {
    bullets.add(new Bullet(s1.x, s1.y));
  }
  s1.ammo--;
}

void startScreen() {
  background(0);
  textAlign(CENTER);
  text("Welcome!", width/2, height/2);
  text("Click to Continue...", width/2, height/2+20);

  if (mousePressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  textAlign(CENTER);
  fill(222);
  text("Game Over", width/2, height/2);
  text("Final Score:" + score, width/2, height/2+20);
  noLoop();
}

void infoPanel() {
  fill(128, 128);
  rectMode(CORNER);
  rect(0, 0, width, 50);
  fill(255, 128);
  text("Health: " + s1.health, 50, 20);
  text("Ammo: " + s1.ammo, 200, 20);
  text("Score: " + score, 340, 20);
  if (pass > 5) {
    fill(255, 0, 0);
  }
  text("Passed: " + pass, 400, 20);
}
