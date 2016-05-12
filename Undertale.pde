import processing.sound.*;
PImage[] frisk = new PImage[2];
PImage hall, blue, r1;
PImage[] act = new PImage[1];
PFont font;
int walktimer = 0;
int story, counter, frisknum;
float camx = 0;
float camy = height/2;
float x = -338;
float y = height/2 + 210;
PVector friskp = new PVector(-338, height/2 + 210, 0);
PVector dest = new PVector();
float lcambound, rcambound, ucambound, dcambound;
float lbound, rbound, ubound, dbound;
float xsize = 28;
float ysize = 62;
String room, state, bstate;
boolean[] keys = new boolean[5];
boolean freeze, playsong;
String text1 = "Come in, have a seat.";
SoundFile sans, home;
void setup() {
  playsong = true;
  sans = new SoundFile(this, "sans.wav");
  home = new SoundFile(this, "home.mp3");
  r1 = loadImage("r1.png");
  font = loadFont("DeterminationMono-48.vlw"); 
  textFont(font, 20);
  background(0);
  hall = loadImage("hall.png");
  blue = loadImage("blue.png");
  keys[0] = false;
  keys[1] = false;
  keys[2] = false;
  keys[3] = false;
  keys[4] = false;
  size(640, 480, P3D);
  frisk[0] = loadImage("sl.png");
  frisk[1] = loadImage("btl.png");
  act[0] = loadImage("actnots.png");
  room = "r1";
  state = "talk";
  bstate = "main";
  story = 1;
}

void keyPressed() {
  if (keyCode == UP) {
    keys[0] = true;
  }
  if (keyCode == DOWN) {
    keys[1] = true;
  }
  if (keyCode == LEFT) {
    keys[2] = true;
  }
  if (keyCode == RIGHT) {
    keys[3] = true;
  }
  if (key == 'z' || key == 'Z') {
    keys[4] = true;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    keys[0] = false;
    if (keys[1] == false && keys[2] == false && keys[3] == false && state == "walk") {
      frisk[0] = loadImage("su.png");
      walktimer = -1;
    }
  }
  if (keyCode == DOWN) {
    keys[1] = false;
    if (keys[0] == false && keys[2] == false && keys[3] == false && state == "walk") {
      frisk[0] = loadImage("sd.png");
      walktimer = -1;
    }
  }
  if (keyCode == LEFT) {
    keys[2] = false;
    if (keys[0] == false && keys[1] == false && keys[2] == false && state == "walk") {
      frisk[0] = loadImage("sl.png");
      walktimer = -1;
    }
  }
  if (keyCode == RIGHT) {
    keys[3] = false;
    if (keys[0] == false && keys[1] == false && keys[2] == false && state == "walk") {
      frisk[0] = loadImage("sr.png");
      walktimer = -1;
    }
  }
  if (key == 'z' || key == 'Z') {
    keys[4] = false;
  }
}

void draw() {
  background(0);
  if (room == "r1" && state == "walk" || room == "r1" && state == "talk") {
    if (playsong == true) {
      home.play();
      playsong = false;
    }
    if (home.duration() == 15) {
      playsong = true;
    }
    image(r1, -907, -55, 330*2, 250*2);
    ubound = 59;
    dbound = 314;
    rbound = -347;
    lbound = -860;
    ucambound = 185;
    rcambound = -587;
    lcambound = -587;
    dcambound = 185;
    if (x >= -347 && y <= 296 && y >= 194 && keys[3] && state == "walk" && story > 3) {
      room = "hall";
    }
    if (x >= -44 && y <= 452 && y >=374) {
      room = "hall";
    }
    if (keys[0] && state == "walk") {
      if (y <= ubound || y <= 272 && y >= 185 && x <= -488 && x >= -692 || y <= 128 && x >= -635 && x <= -539) {
        y+=0;
      } else {
        y -= 3;
      }
    }
    if (keys[1] && state == "walk") {
      if (y >= dbound || y >=182 && x <= -488 && x >= -692 && y <= 269) {
        y+=0;
      } else {
        y += 3;
      }
    }
    if (keys[2] && state == "walk") {
      if (x <= lbound || y >= 185 && y <= 269 && x <= -485 && x >= -692 || y <= 125 && x >= -635 && x <= -536) {
        x +=0;
      } else {
        x -= 3;
      }
    }
    if (keys[3] && state == "walk") {
      if (x >= rbound || y >=185 && y <= 269 && x <= -494 && x >= -695 || y <= 125 && x >= -638 && x <= -539) {
        x+=0;
      } else {
        x += 3;
      }
    }
    if (y == 182 && x <= -539 && x >= -626 && story == 2 && key == 'z') {
      state = "battle";
    }
  }
  if (room == "hall" && state == "walk" || room == "hall" && state == "talk") {
    image(hall, -320, 100, 745*2, 156*2);
    lcambound = 0;
    rcambound = 850;
    ucambound = height/2;
    dcambound = height/2;
    lbound = -320;
    rbound = 1090;
    ubound = 220;
    dbound = 300;
    if (x >= 406 && x <= 436 && y <= 218 && keys[0] && state == "walk") {
      room = "blue";
    }
    if (keys[0] && state == "walk") {
      if (y <= ubound) {
        y+=0;
      } else {
        y -= 3;
      }
    }
    if (keys[1] && state == "walk") {
      if (y >= dbound) {
        y+=0;
      } else {
        y += 3;
      }
    }
    if (keys[2] && state == "walk") {
      if (x <= lbound) {
        x +=0;
      } else {
        x -= 3;
      }
    }
    if (keys[3] && state == "walk") {
      if (x >= rbound) {
        x+=0;
      } else {
        x += 3;
      }
    }
  }
  if (room == "blue" && state == "walk" || room == "blue" && state == "talk") {
    image(blue, 267, -165, 239*2, 233*2);
    lbound = 390;
    rbound = 661;
    ubound = -34;
    dbound = 191;
    lcambound = 500;
    rcambound = 500;
    ucambound = 59;
    dcambound = 59;
    if (y >= 190 && x >= 406 && x <= 440 && keys[1] && state == "walk") {
      room = "hall";
    }
    if (keys[0] && state == "walk") {
      if (y <= ubound || y <= 135 && x <= 430) {
        y+=0;
      } else {
        y -= 3;
      }
    }
    if (keys[1] && state == "walk") {
      if (y >= dbound || y >=95 && x >= 592) {
        y+=0;
      } else {
        y += 3;
      }
    }
    if (keys[2] && state == "walk") {
      if (x <= lbound || x <= 433 && y <= 132) {
        x +=0;
      } else {
        x -= 3;
      }
    }
    if (keys[3] && state == "walk") {
      if (x >= rbound || x >= 589 && y >=98) {
        x+=0;
      } else {
        x += 3;
      }
    }
  }
  if (x <= lcambound) {
    camx = lcambound;
  } else if (x <= rcambound) {
    camx = x;
  }
  if (x >= rcambound) {
    camx = rcambound;
  }
  if (y >= dcambound) {
    camy = dcambound;
  } else if (y >= ucambound) {
    camy = y;
  }
  if (y <= ucambound) {
    camy = ucambound;
  }
  camera(camx, camy, (height/2) / tan(PI/6), camx, camy, 0, 0, 1, 0);
  if (state == "walk") {
    if (keys[1] && keys[2] == false && keys[3] == false) {
      walktimer += 1;
      if (walktimer == 0) {
        frisk[0] = loadImage("w1d.png");
      }
      if (walktimer == 10) {
        frisk[0] = loadImage("sd.png");
      }
      if (walktimer == 20) {
        frisk[0] = loadImage("w2d.png");
      }
      if (walktimer == 30) {
        frisk[0] = loadImage("sd.png");
      }
      if (walktimer == 40) {
        walktimer = -1;
      }
    }
    if (keys[0] && keys[2] == false && keys[3] == false) {
      walktimer += 1;
      if (walktimer == 0) {
        frisk[0] = loadImage("w1u.png");
      }
      if (walktimer == 10) {
        frisk[0] = loadImage("su.png");
      }
      if (walktimer == 20) {
        frisk[0] = loadImage("w2u.png");
      }
      if (walktimer == 30) {
        frisk[0] = loadImage("su.png");
      }
      if (walktimer == 40) {
        walktimer = -1;
      }
    }
    if (keys[3] && keys[2] == false) {
      walktimer += 1;
      if (walktimer == 0) {
        frisk[0] = loadImage("wr.png");
      }
      if (walktimer == 10) {
        frisk[0] = loadImage("sr.png");
      }
      if (walktimer == 20) {
        walktimer = -1;
      }
    }
    if (keys[2] && keys[3] == false) {
      walktimer += 1;
      if (walktimer == 0) {
        frisk[0] = loadImage("wl.png");
      }
      if (walktimer == 10) {
        frisk[0] = loadImage("sl.png");
      }
      if (walktimer == 20) {
        walktimer = -1;
      }
    }
  }
  if (state == "battle") {
    xsize = 28.5;
    ysize = 46.5;
    frisknum = 1;
    if (story == 2) {
      fill(0);
      stroke(255);
      strokeWeight(7);
      strokeCap(PROJECT);
      rectMode(CENTER);
      rect(camx, camy+50, 525, 150);
      fill(255);
      if (bstate == "main") {
        x = lerp(x, mouseX, 0.1);
        y = lerp(y, mouseY, 0.1);
        imageMode(CENTER);
        image(act[0], camx, camy+200);
        imageMode(CORNER);
      }
    }
  }
  pushMatrix();
  translate(x, y);
  image(frisk[frisknum], 0, 0, xsize, ysize);
  popMatrix();
  textSize(20);
  text(friskp.mag(), x, y-20);
  text(mouseY, x, y-5);
  text(y, x, y-35);
  if (state == "talk") {
    fill(0);
    stroke(255);
    strokeWeight(7);
    strokeCap(PROJECT);
    rectMode(CENTER);
    rect(camx, camy+150, 525, 150);
    rectMode(CORNER);
    if (story == 1) {
      textSize(30);
      fill(255);
      if (counter < text1.length()*3) {
        counter++;
        sans.amp(0.25);
        sans.play();
      }
      text(text1.substring(0, counter/3), camx -180, camy + 115, 300, 75);
      if (counter/3 == 21) {
        if (keys[4]) {
          state = "walk";
          story = 2;
          counter = 0;
        }
      }
    }
  }
  if (state != "battle") {
    frisknum = 0;
    xsize = 38;
    ysize = 62;
  }
}