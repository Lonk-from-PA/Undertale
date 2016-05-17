import processing.sound.*;
PImage[] frisk = new PImage[2];
PImage hall, blue, r1, sanshead, sansbody;
PImage[] acticon = new PImage[1];
PFont font;
int walktimer = 0;
int story, counter, frisknum, songtimer, actstate, wait, bstory;
int liecount, explaincount, silencecount, drivetimer;
float camx = 0;
float camy = height/2;
float x = -338;
float y = height/2 + 210;
float destx, desty, songtime;
float lcambound, rcambound, ucambound, dcambound;
float lbound, rbound, ubound, dbound;
float xsize = 38;
float ysize = 62;
float sansx = -2.5;
float sansy;
String room, state, bstate, bbstate, sansmovex, sansmovey, evilstate;
String text1 = "Come in, have a seat.";
String[] acts = new String[4];
String[] btltext = new String[20];
boolean[] keys = new boolean[6];
SoundFile sanssound, therapy, btl1song, car, home;
void setup() {
  songtimer = 0;
  sanssound = new SoundFile(this, "sanstext.wav");
  therapy = new SoundFile(this, "Undertale OST_ 006 - Uwa!! So Temperate♫ 3.mp3");
  btl1song = new SoundFile(this, "Undertale OST_ 009 - Enemy Approaching.mp3");
  car = new SoundFile(this, "Car Engine Sound Effect.mp3");
  home = new SoundFile(this, "Undertale OST_ 012 - Home.mp3");
  font = loadFont("DeterminationMono-48.vlw"); 
  textFont(font, 20);
  background(0);
  keys[0] = false;
  keys[1] = false;
  keys[2] = false;
  keys[3] = false;
  keys[4] = false;
  keys[5] = false;
  size(640, 480, P3D);
  frisk[0] = loadImage("sl.png");
  frisk[1] = loadImage("btl.png");
  acticon[0] = loadImage("actnots.png");
  hall = loadImage("hall.png");
  blue = loadImage("blue.png");
  r1 = loadImage("r1.png");
  sanshead = loadImage("sanshead.png");
  sansbody = loadImage("sansbody.png");
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
  if (key == 'x' || key == 'X') {
    keys[5] = true;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    keys[0] = false;
    if (keys[1] == false && keys[2] == false && keys[3] == false && state == "walk") {
      frisk[0] = loadImage("su.png");
      walktimer = 0;
    }
  }
  if (keyCode == DOWN) {
    keys[1] = false;
    if (keys[0] == false && keys[2] == false && keys[3] == false && state == "walk") {
      frisk[0] = loadImage("sd.png");
      walktimer = 0;
    }
  }
  if (keyCode == LEFT) {
    keys[2] = false;
    if (keys[0] == false && keys[1] == false && keys[2] == false && state == "walk") {
      frisk[0] = loadImage("sl.png");
      walktimer = 0;
    }
  }
  if (keyCode == RIGHT) {
    keys[3] = false;
    if (keys[0] == false && keys[1] == false && keys[2] == false && state == "walk") {
      frisk[0] = loadImage("sr.png");
      walktimer = 0;
    }
  }
  if (key == 'z' || key == 'Z') {
    keys[4] = false;
  }
  if (key == 'x' || key == 'X') {
    keys[5] = false;
  }
  if (key == '3') {
    story = 3;
  }
  if (key == '1') {
    room = "blue";
  }
}

void draw() {
  background(0);
  if (room == "r1" && state == "walk" || room == "r1" && state == "talk") {
    if (songtimer == 0) {
      therapy.play(1, .015);
    }
    songtimer += 1;
    if (songtimer >= 3360) {
      songtimer = 0;
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
    if (x >= -347 && y <= 296 && y >= 194 && keys[3] && state == "walk" && story >= 3) {
      songtimer = 0;
      therapy.stop();
      state = "drive";
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
    if (y == 182 && x <= -539 && x >= -626 && story == 2 && keys[1]) {
      destx = x;
      desty = y;
      therapy.stop();
      songtimer = 0;
      state = "battle";
    }
  }
  if (room == "hall" && state == "walk" || room == "hall" && state == "talk") {
    if (songtimer == 0) {
      home.play(1, .015);
    }
    songtimer += 1;
    if (songtimer >= (123*60) - 10) {
      songtimer = 0;
    }
    image(hall, -320, 100, 745*2, 156*2);
    lcambound = 0;
    rcambound = 850;
    ucambound = height/2;
    dcambound = height/2;
    lbound = -320;
    rbound = 1090;
    ubound = 220;
    dbound = 300;
    if (x >= 394 && x <= 448 && y <= 220 && keys[0] && state == "walk") {
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
  if (room == "blue" && state == "walk" || room == "blue" && state == "talk" || room == "blue" && state == "battle") {
    if (songtimer == 0) {
      home.play(1, .015);
    }
    songtimer += 1;
    if (songtimer >= 123*60) {
      songtimer = 0;
    }
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
    if (keys[1] && keys[2] == false && keys[3] == false && keys[0] == false) {
      walktimer += 1;
      if (walktimer <= 9) {
        frisk[0] = loadImage("w1d.png");
      }
      if (walktimer >= 10 && walktimer <= 19) {
        frisk[0] = loadImage("sd.png");
      }
      if (walktimer >= 20 && walktimer <= 29) {
        frisk[0] = loadImage("w2d.png");
      }
      if (walktimer >= 30 && walktimer <= 39) {
        frisk[0] = loadImage("sd.png");
      }
      if (walktimer == 40) {
        walktimer = 0;
      }
    }
    if (keys[0] && keys[1] == false && keys[2] == false && keys[3] == false) {
      walktimer += 1;
      if (walktimer <= 9) {
        frisk[0] = loadImage("w1u.png");
      }
      if (walktimer >= 10 && walktimer <= 19) {
        frisk[0] = loadImage("su.png");
      }
      if (walktimer >= 20 && walktimer <= 29) {
        frisk[0] = loadImage("w2u.png");
      }
      if (walktimer >= 30 && walktimer <= 39) {
        frisk[0] = loadImage("su.png");
      }
      if (walktimer == 40) {
        walktimer = 0;
      }
    }
    if (keys[3] && keys[2] == false) {
      walktimer += 1;
      if (walktimer <= 9) {
        frisk[0] = loadImage("wr.png");
      }
      if (walktimer >= 10 && walktimer <= 19) {
        frisk[0] = loadImage("sr.png");
      }
      if (walktimer == 20) {
        walktimer = 0;
      }
    }
    if (keys[2] && keys[0] == false && keys[1] == false && keys[3] == false) {
      walktimer += 1;
      if (walktimer <= 9) {
        frisk[0] = loadImage("wl.png");
      }
      if (walktimer >= 10 && walktimer <= 19) {
        frisk[0] = loadImage("sl.png");
      }
      if (walktimer == 20) {
        walktimer = 0;
      }
    }
    if (keys[2] && keys[1]) {
      walktimer += 1;
      if (walktimer <= 9) {
        frisk[0] = loadImage("wl.png");
      }
      if (walktimer >= 10 && walktimer <= 19) {
        frisk[0] = loadImage("sl.png");
      }
      if (walktimer == 20) {
        walktimer = 0;
      }
    }
    if (keys[2] && keys[0]) {
      walktimer += 1;
      if (walktimer <= 9) {
        frisk[0] = loadImage("wl.png");
      }
      if (walktimer >= 10 && walktimer <= 19) {
        frisk[0] = loadImage("sl.png");
      }
      if (walktimer == 20) {
        walktimer = 0;
      }
    }
  }
  if (state == "battle") {
    x = lerp(x, destx, .2);
    y = lerp(y, desty, .2);
    xsize = 28.5;
    ysize = 46.5;
    frisknum = 1;
    fill(0);
    stroke(255);
    strokeWeight(7);
    strokeCap(PROJECT);
    rectMode(CENTER);
    rect(camx, camy+50, 525, 150);
    fill(255);
    rectMode(CORNER);
    if (story == 2) {
      if (songtimer == 0) {
        btl1song.play(1, .015);
      }
      songtimer += 1;
      if (songtimer >= 3360) {
        songtimer = 0;
      }
      imageMode(CENTER);
      pushMatrix();
      translate(camx, camy - 170);
      image(sansbody, 0, 70, 54*2, 48*2);
      image(sanshead, sansx, sansy, 64, 60);
      popMatrix();
      imageMode(CORNER);
      if (sansx <= -1.75) {
        sansmovex = "right";
      }
      if (sansx >= 1.75) {
        sansmovex = "left";
      }
      if (sansy <= 0) {
        sansmovey = "down";
      }
      if (sansy >= 1.75) {
        sansmovey = "up";
      }
      if (sansmovex == "right") {
        sansx += .25/6;
      }
      if (sansmovex == "left") {
        sansx -= .25/6;
      }
      if (sansmovey == "up") {
        sansy -= .25/6;
      }
      if (sansmovey == "down") {
        sansy += .25/6;
      }
      if (bstory < 3) {
        acts[0] = "Lie";
        acts[1] = "Explain";
        acts[2] = "Don't talk";
      } else {
        acts[0] = "Storm off";
        acts[1] = "Say goodbye";
        acts[2] = "Leave";
      }
      if (bstate == "main") {
        if (wait < 10) {
          wait += 1;
        }
        if (bstory == 0) {
          btltext[0] = "Therapist Frank asks you how you're doing with your anger.";
        }
        if (bstory == 1) {
          btltext[0] = "Frank wonders how you're doing in school.";
        }
        if (bstory == 2) {
          btltext[0] = "Frank enquires about Marcus.";
        }
        if (bstory == 3) {
          if (explaincount > liecount && explaincount > silencecount) {
            btltext[0] = "Frank says you're all done and hopes things get better.";
          } else {
            btltext[0] = "Frank thinks that's enough for today.";
          }
        }
        destx = camx - 52;
        desty = 362;
        imageMode(CENTER);
        image(acticon[0], camx, camy+200);
        imageMode(CORNER);
        textSize(30);
        if (counter < btltext[0].length()*2) {
          counter++;
          sanssound.play(1, .015);
        }
        text(btltext[0].substring(0, counter/2), camx -180, camy, 400, 200);
        if (y >= 355) {
          acticon[0] = loadImage("acts.png");
        } else {
          acticon[0] = loadImage("actnots.png");
        }
        if (keys[4] && wait == 10) {
          wait = 0;
          bstate = "act";
        }
      }
      if (bstate == "act") {
        if (wait < 10) {
          wait += 1;
        }
        textSize(30);
        if (actstate == 0) {
          fill(255, 255, 0);
          destx = camx - 240;
          desty = camy - 10;
        } else {
          fill(255);
        }
        text(acts[0], camx - 200, camy + 25);
        if (actstate == 1) {
          fill(255, 255, 0);
          destx = camx - 20;
          desty = camy - 10;
        } else {
          fill(255);
        }
        text(acts[1], camx + 20, camy +25);
        if (actstate == 2) {
          fill(255, 255, 0);
          destx = camx - 240;
          desty = camy + 55;
        } else {
          fill(255);
        }
        text(acts[2], camx - 200, camy + 90);
        if (keyCode == RIGHT && actstate == 0) {
          actstate = 1;
        }
        if (keyCode == DOWN && actstate == 0) {
          actstate = 2;
        }
        if (keyCode == LEFT && actstate == 1) {
          actstate = 0;
        }
        if (keyCode == DOWN && actstate == 1) {
          actstate = 2;
        }
        if (keyCode == UP && actstate == 2) {
          actstate = 0;
        }
        if (keys[4] && actstate == 0 && wait == 10 && bstory == 0) {
          btltext[0] = "You say that you've been controlling your anger easily.";
          counter = 0;
          wait = 0;
          liecount+=1;
          bstate = "talk";
        }
        if (keys[4] && actstate == 0 && wait == 10 && bstory == 1) {
          btltext[0] = "You say everything's going fine.";
          counter = 0;
          wait = 0;
          liecount+=1;
          bstate = "talk";
        }
        if (keys[4] && actstate == 0 && wait == 10 && bstory == 2) {
          btltext[0] = "You mumble about how he doesn't bother you anymore.";
          counter = 0;
          wait = 0;
          liecount+=1;
          bstate = "talk";
        }
        if (keys[4] && actstate == 0 && wait == 10 && bstory == 3) {
          btltext[0] = "You get off the couch angrily and stomp off.";
          counter = 0;
          wait = 0;
          liecount+=1;
          bstate = "talk";
        }
        if (keys[4] && actstate == 1 && wait == 10 && bstory == 0) {
          btltext[0] = "You say that you've been having trouble with it.";
          counter = 0;
          wait = 0;
          explaincount+=1;
          bstate = "talk";
        }
        if (keys[4] && actstate == 1 && wait == 10 && bstory == 1) {
          btltext[0] = "You talk about this kid, Marcus, who's bullying you.";
          counter = 0;
          wait = 0;
          explaincount+=1;
          bstate = "talk";
        }
        if (keys[4] && actstate == 1 && wait == 10 && bstory == 2) {
          btltext[0] = "You mention how he's persistently gotten nastier.";
          counter = 0;
          wait = 0;
          explaincount+=1;
          bstate = "talk";
        }
        if (keys[4] && actstate == 1 && wait == 10 && bstory == 3) {
          btltext[0] = "You smile and say goodbye.";
          counter = 0;
          wait = 0;
          explaincount+=1;
          bstate = "talk";
        }
        if (keys[4] && actstate == 2 && wait == 10 && bstory == 0) {
          btltext[0] = "You don't say anything.";
          counter = 0;
          wait = 0;
          silencecount+=1;
          bstate = "talk";
        }
        if (keys[4] && actstate == 2 && wait == 10 && bstory == 1) {
          btltext[0] = "You don't say anything.";
          counter = 0;
          wait = 0;
          silencecount+=1;
          bstate = "talk";
        }
        if (keys[4] && actstate == 2 && wait == 10 && bstory == 2) {
          btltext[0] = "You don't say anything.";
          counter = 0;
          wait = 0;
          silencecount+=1;
          bstate = "talk";
        }
        if (keys[4] && actstate == 2 && wait == 10 && bstory == 3) {
          btltext[0] = "You get up and leave silently.";
          counter = 0;
          wait = 0;
          silencecount+=1;
          bstate = "talk";
        }
        if (keys[5] && wait == 10) {
          counter = 0;
          wait = 0;
          bstate = "main";
        }
      }
      if (bstate == "talk") {
        x = 1000;
        y = 1000;
        textSize(30);
        if (counter < btltext[0].length()*2) {
          counter++;
          sanssound.play(1, .015);
        }
        rectMode(CORNER);
        text(btltext[0].substring(0, counter/2), camx -180, camy, 400, 200);
        rectMode(CENTER);
        if (counter == btltext[0].length()*2 && keys[4]) {
          if (bstory == 3) {
            counter = 0;
            btl1song.stop();
            songtimer = 0;
            x = camx;
            y = camy - 10;
            frisknum = 0;
            xsize = 38;
            ysize = 62;
            frisk[0] = loadImage("su.png");
            state = "walk";
            story = 3;
          }
          if (bstory == 2) {
            bstory = 3;
          }
          if (bstory == 1) {
            bstory = 2;
          }
          if (bstory == 0) {
            bstory = 1;
          }
          counter = 0;
          bstate = "main";
        }
      }
    }
  }
  pushMatrix();
  translate(x, y);
  image(frisk[frisknum], 0, 0, xsize, ysize);
  popMatrix();
  text(x, x, y - 5);
  text(y, x, y - 25);
  textSize(30);
  fill(255);
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
        sanssound.play(1, .015);
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
  if (state == "drive") {
    background(0);
    if (drivetimer == 0) {
      car.play(1, .015);
    }
    drivetimer += 1;
    if (drivetimer == (60*5) + 20) {
      car.stop();
      if (x >= -347 && y <= 296 && y >= 194) {
        room = "hall";
        state = "walk";
      }
    }
  }
}