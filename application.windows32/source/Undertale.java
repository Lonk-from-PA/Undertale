import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Undertale extends PApplet {


PImage[] frisk = new PImage[2];
PImage hall, blue, r1, bedroom, sanshead, sansbody, papyrus, fist, kitchen;
PImage[] acticon = new PImage[2];
PFont font;
int walktimer = 0;
int story, counter, frisknum, songtimer, actstate, wait, bstory;
int liecount, explaincount, silencecount, drivetimer, textnum, fighttimer;
float camx = 0;
float camy = height/2;
float x = -338;
float y = height/2 + 210;
float papsize = 2;
float destx, desty, songtime;
float lcambound, rcambound, ucambound, dcambound;
float lbound, rbound, ubound, dbound;
float xsize = 38;
float ysize = 62;
float sansx = -2.5f;
float sansy, fistx, fisty;
String room, state, bstate, bbstate, sansmovex, sansmovey, evilstate, mainstate;
String text1 = "Come in, have a seat.";
String[] text = new String[20];
String[] acts = new String[4];
String[] btltext = new String[20];
boolean[] keys = new boolean[6];
boolean bybed = false;
boolean mean, gotyog;
SoundFile sanssound, therapy, btl1song, car, home, sleep, attack;
public void setup() {
  songtimer = 0;
  textnum = 0;
  sanssound = new SoundFile(this, "sanstext.wav");
  therapy = new SoundFile(this, "Undertale OST_ 006 - Uwa!! So Temperate\u266b 3.mp3");
  btl1song = new SoundFile(this, "Undertale OST_ 009 - Enemy Approaching.mp3");
  car = new SoundFile(this, "Car Engine Sound Effect.mp3");
  home = new SoundFile(this, "Undertale OST_ 012 - Home.mp3");
  sleep = new SoundFile(this, "Undertale OST_ 101 - Good Night.mp3");
  attack = new SoundFile(this, "attack.mp3");
  font = loadFont("DeterminationMono-48.vlw"); 
  textFont(font, 20);
  background(0);
  keys[0] = false;
  keys[1] = false;
  keys[2] = false;
  keys[3] = false;
  keys[4] = false;
  keys[5] = false;
  
  frisk[0] = loadImage("sl.png");
  frisk[1] = loadImage("btl.png");
  acticon[0] = loadImage("actnots.png");
  acticon[1] = loadImage("fights.png");
  hall = loadImage("hall.png");
  blue = loadImage("blue.png");
  r1 = loadImage("r1.png");
  bedroom = loadImage("bedroom.png");
  sanshead = loadImage("sanshead.png");
  sansbody = loadImage("sansbody.png");
  papyrus = loadImage("papyrus.png");
  fist = loadImage("fist1.png");
  kitchen = loadImage("kitchen.png");
  room = "r1";
  state = "talk";
  bstate = "main";
  mainstate = "fights";
  story = 1;
}

public void keyPressed() {
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

public void keyReleased() {
  if (keyCode == UP) {
    keys[0] = false;
    if (keys[1] == false && state == "walk") {
      frisk[0] = loadImage("su.png");
      walktimer = 0;
    }
  }
  if (keyCode == DOWN) {
    keys[1] = false;
    if (keys[0] == false && state == "walk") {
      frisk[0] = loadImage("sd.png");
      walktimer = 0;
    }
  }
  if (keyCode == LEFT) {
    keys[2] = false;
    if (keys[0] == false && state == "walk") {
      frisk[0] = loadImage("sl.png");
      walktimer = 0;
    }
  }
  if (keyCode == RIGHT) {
    keys[3] = false;
    if (keys[0] == false && state == "walk") {
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
    story += 1;
  }
  if (key == '1') {
    room = "blue";
  }
}

public void draw() {
  background(0);
  if (room == "r1" && state == "walk" || room == "r1" && state == "talk") {
    if (songtimer == 0) {
      therapy.play(1, .015f);
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
  if (room == "bedroom" && state == "walk" || room == "bedroom" && state == "talk") {
    if (songtimer == 0) {
      home.play();
    }
    songtimer += 1;
    if (songtimer >= (123*60) - 10) {
      home.stop();
      songtimer = 0;
    }
    image(bedroom, 680, -150, 480, 480);
    lcambound = 680 + 240;
    rcambound = 680 + 240;
    ucambound = -150 + 240;
    dcambound = -150 + 240;
    dbound = 182;
    ubound = 29;
    lbound = 771;
    rbound = 1024;
    if (wait < 10) {
      wait += 1;
    }
    if (x >= 961 && y <= 77 || x >= 959 && y <= 80) {
      if (keys[4] && state == "walk" && story == 5 && wait >= 10) {
        songtimer = 0;
        state = "sleep";
      }
      if (keys[4] && state == "walk" && story < 5 && wait >= 10 || keys[4] && state == "walk" && story == 6 && wait >= 10) {
        counter = 0;
        bybed = true;
        state = "talk";
      }
      if (keys[4] && state == "walk" && story == 7 && wait >= 10 && gotyog == false) {
        counter = 0;
        bybed = true;
        state = "talk";
      }
      if (keys[4] && state == "walk" && story == 7 && wait >= 10 && gotyog == true) {
        songtimer = 0;
        state = "sleep";
      }
    }
    if (y <= 29 && x >= 880 && x <= 928 && keys[4] && state == "walk" && wait >= 10) {
      bybed = false;
      counter = 0;
      state = "talk";
    }
    if (keys[0] && state == "walk") {
      if (y <= ubound || x >= 959 && y <= 80) {
        y+=0;
      } else {
        y -= 3;
      }
    }
    if (keys[1] && state == "walk") {
      if (y >= dbound && x >= 856 || y >= dbound && x <= 820) {
        y+=0;
      } else {
        y += 3;
      }
    }
    if (keys[2] && state == "walk") {
      if (x <= lbound || x <= 817 && y >= 194) {
        x +=0;
      } else {
        x -= 3;
      }
    }
    if (keys[3] && state == "walk") {
      if (x >= rbound || x >= 862 && y >= 194 || x >= 961 && y <= 77) {
        x+=0;
      } else {
        x += 3;
      }
    }
    if (y >= 248 && keys[1]) {
      room = "hall";
    }
  }
  if (room == "hall" && state == "walk" || room == "hall" && state == "talk") {
    if (songtimer == 0) {
      home.play(1, .015f);
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
    if (x <= -320 && story == 6) {
      drivetimer = 0;
      state = "drive";
    }
    if (x >= -20 && x <= 25 && y <= 220 && keys[0] && state == "walk") {
      room = "kitchen";
    }
    if (x >= 394 && x <= 448 && y <= 220 && keys[0] && state == "walk") {
      room = "blue";
    }
    if (x >= 817 && x <= 865 && y <= 220 && keys[0]) {
      room = "bedroom";
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
      home.play(1, .015f);
    }
    songtimer += 1;
    if (wait < 10) {
      wait += 1;
    }
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
    if (x <= 393 && y <=164 && keys[4] && wait >= 10 && state == "walk") {
      bybed = true;
      state = "talk";
    }
    if (x <= 564 && x >= 462 && y <=-31 && keys[4] && wait >= 10 && state == "walk") {
      bybed = false;
      state = "talk";
    }
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
  if (room == "kitchen" && state == "walk" || room == "kitchen" && state == "talk") {
    if (songtimer == 0) {
      home.play(1, .015f);
    }
    songtimer += 1;
    if (wait < 10) {
      wait += 1;
    }
    if (songtimer >= 123*60) {
      songtimer = 0;
    }
    image(kitchen, -135, -165, 239*2, 233*2);
    lbound = -86;
    rbound = 256;
    ubound = 32;
    dbound = 173;
    lcambound = 97;
    rcambound = 97;
    ucambound = 59;
    dcambound = 59;
    if (y >= 173 && x >= -26 && x <= 37 && keys[1] && state == "walk") {
      y = 212;
      room = "hall";
    }
    if (y <= 32 && x <= -29 && keys[4] && state == "walk" && wait >= 10) {
      textnum = 0;
      if (story == 7) {
        gotyog = true;
      }
      state = "talk";
    }
    if (y <= 32 && x <= 37 && x >= 7 && keys[4] && state == "walk" && wait >= 10) {
      textnum = 1;
      state = "talk";
    }
    if (y <= 32 && x <= 187 && x >= 82 && keys[4] && state == "walk" && wait >= 10) {
      textnum = 2;
      state = "talk";
    }
    if (y <= 32 && x <= 256 && x >= 217 && keys[4] && state == "walk" && wait >= 10) {
      textnum = 3;
      state = "talk";
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
    if (keys[3] && keys[0] == false && keys[1] == false && keys[2] == false) {
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
    if (keys[3] && keys[0] || keys[3] && keys[1]) {
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
    ucambound = camy;
    dcambound = camy;
    rcambound = camx;
    lcambound = camx;
    x = lerp(x, destx, .15f);
    y = lerp(y, desty, .15f);
    xsize = 28.5f;
    ysize = 46.5f;
    frisknum = 1;
    fill(0);
    stroke(255);
    strokeWeight(7);
    strokeCap(PROJECT);
    rectMode(CENTER);
    rect(camx, camy+70, 525, 150);
    fill(255);
    rectMode(CORNER);
    if (story == 2) {
      if (songtimer == 0) {
        btl1song.play(1, .015f);
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
      if (sansx <= -1.75f) {
        sansmovex = "right";
      }
      if (sansx >= 1.75f) {
        sansmovex = "left";
      }
      if (sansy <= 0) {
        sansmovey = "down";
      }
      if (sansy >= 1.75f) {
        sansmovey = "up";
      }
      if (sansmovex == "right") {
        sansx += .25f/6;
      }
      if (sansmovex == "left") {
        sansx -= .25f/6;
      }
      if (sansmovey == "up") {
        sansy -= .25f/6;
      }
      if (sansmovey == "down") {
        sansy += .25f/6;
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
          sanssound.play(1, .015f);
        }
        text(btltext[0].substring(0, counter/2), camx -180, camy + 20, 420, 200);
        if (y >= 170) {
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
          desty = camy + 10;
        } else {
          fill(255);
        }
        text(acts[0], camx - 200, camy + 45);
        if (actstate == 1) {
          fill(255, 255, 0);
          destx = camx - 20;
          desty = camy + 10;
        } else {
          fill(255);
        }
        text(acts[1], camx + 20, camy + 45);
        if (actstate == 2) {
          fill(255, 255, 0);
          destx = camx - 240;
          desty = camy + 75;
        } else {
          fill(255);
        }
        text(acts[2], camx - 200, camy + 110);
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
          sanssound.play(1, .015f);
        }
        rectMode(CORNER);
        text(btltext[0].substring(0, counter/2), camx -180, camy + 20, 400, 200);
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
    if (story == 6) {
      if (songtimer == 0) {
        btl1song.play(1, .015f);
      }
      songtimer += 1;
      if (songtimer >= 3360) {
        songtimer = 0;
      }
      imageMode(CENTER);
      pushMatrix();
      translate(camx, camy - 170);
      image(papyrus, 0, 45, 74*2, 103*2);
      popMatrix();
      imageMode(CORNER);
      if (bstory == 0) {
        acts[0] = "Smile";
        acts[1] = "Confront";
        acts[2] = "Run away";
        acts[3] = "Scowl";
      } else  if (bstory < 3) {
        acts[0] = "Mock him";
        acts[1] = "Stay silent";
        acts[2] = "Run away";
        acts[3] = "";
      } else {
        acts[0] = "Run away";
        acts[1] = "Run away";
        acts[2] = "Run away";
        acts[3] = "Run away";
      }
      if (bstate == "main") {
        if (wait < 10) {
          wait += 1;
        }
        if (bstory == 0) {
          btltext[0] = "You arrive at school and Marcus spots you.";
        }
        if (bstory >= 1 && silencecount == 1) {
          btltext[0] = "He easily catches up to you.";
          x = 7000;
          if (keys[4] && wait >= 10) {
            counter = 0;
            wait = 0;
            silencecount = 0;
          }
        }
        if (bstory == 1 && silencecount == 0) {
          btltext[0] = "Marcus starts mocking you.";
        }
        if (bstory == 2 && silencecount == 0) {
          btltext[0] = "People start crowding the two of you.";
        }
        if (bstory == 3 && silencecount == 0) {
          if (mean == true) {
            btltext[0] = "Marcus scowls and turns away.";
          } else {
            btltext[0] = "Marcus looks over at his friend.";
          }
        }
        imageMode(CENTER);
        if (silencecount != 1) {
          image(acticon[0], camx + 122, camy + 200);
          image(acticon[1], camx - 122, camy + 200);
        }
        imageMode(CORNER);
        textSize(30);
        if (counter < btltext[0].length()*2) {
          counter++;
          sanssound.play(1, .015f);
        }
        text(btltext[0].substring(0, counter/2), camx -180, camy + 20, 400, 200);
        if (keys[3] && mainstate == "fights") {
          mainstate = "acts";
        }
        if (keys[2] && mainstate == "acts") {
          mainstate = "fights";
        }
        if (mainstate == "acts") {
          acticon[0] = loadImage("acts.png");
          acticon[1] = loadImage("fightnots.png");
          destx = camx + 70;
          desty = camy + 178;
        }
        if (mainstate == "fights") {
          acticon[0] = loadImage("actnots.png");
          acticon[1] = loadImage("fights.png");
          destx = camx - 175;
          desty = camy + 178;
        }
        if (keys[4] && wait == 10 && mainstate == "acts" && silencecount != 1) {
          wait = 0;
          bstate = "act";
        }
        if (keys[4] && wait == 10 && mainstate == "fights" && silencecount != 1) {
          wait = 0;
          fighttimer = 0;
          bstate = "fight";
        }
      }
      if (bstate == "fight") {
        if (fighttimer == 0) {
          fistx = random(camx - 40, camx + 40);
          fisty = random(camy - 200, camy - 100);
          attack.play(1, .2f);
        }
        fighttimer += 1;
        if (fighttimer <= 20) {
          fist = loadImage("fist1.png");
        } else {
          fist = loadImage("fist2.png");
        }
        imageMode(CENTER);
        if (fighttimer <=30) {
          image(fist, fistx, fisty);
        }
        if (fighttimer <= 30) {
          papyrus = loadImage("papyrus1.png");
        } else {
          papyrus = loadImage("papyrus.png");
        }
        imageMode(CORNER);
        if (fighttimer == 60) {
          counter = 0;
          bstate = "main";
          if (bstory == 3) {
            counter = 0;
            btl1song.stop();
            songtimer = 0;
            drivetimer = 0;
            frisknum = 0;
            xsize = 38;
            ysize = 62;
            frisk[0] = loadImage("sr.png");
            state = "drive";
            story = 7;
          }
          if (bstory < 3) {
            bstory += 1;
          }
          if (bstory == 2) {
            mean = true;
          }
        }
        x = 7000;
      }
      if (bstate == "act") {
        if (wait < 10) {
          wait += 1;
        }
        textSize(30);
        if (actstate == 0) {
          fill(255, 255, 0);
          destx = camx - 240;
          desty = camy + 10;
        } else {
          fill(255);
        }
        text(acts[0], camx - 200, camy + 45);
        if (actstate == 1) {
          fill(255, 255, 0);
          destx = camx - 20;
          desty = camy + 10;
        } else {
          fill(255);
        }
        text(acts[1], camx + 20, camy +45);
        if (actstate == 2) {
          fill(255, 255, 0);
          destx = camx - 240;
          desty = camy + 75;
        } else {
          fill(255);
        }
        text(acts[2], camx - 200, camy + 110);
        if (actstate == 3) {
          fill(255, 255, 0);
          destx = camx - 20;
          desty = camy + 75;
        } else {
          fill(255);
        }
        text(acts[3], camx + 20, camy + 110);
        fill(255);
        if (keyCode == RIGHT && actstate == 0) {
          actstate = 1;
        }
        if (keyCode == DOWN && actstate == 0) {
          actstate = 2;
        }
        if (keyCode == LEFT && actstate == 1) {
          actstate = 0;
        }
        if (keyCode == DOWN && actstate == 1 && bstory != 1 && bstory != 2) {
          actstate = 3;
        }
        if (keyCode == UP && actstate == 2) {
          actstate = 0;
        }
        if (keyCode == RIGHT && actstate == 2 && bstory != 1 && bstory != 2) {
          actstate = 3;
        }
        if (keyCode == UP && actstate == 3) {
          actstate = 1;
        }
        if (keyCode == LEFT && actstate == 3) {
          actstate = 2;
        }
        if (keys[4] && actstate == 0 && wait == 10 && bstory == 0) {
          btltext[0] = "You smile at Marcus hoping he won't come up to you.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 0 && wait == 10 && bstory == 1) {
          btltext[0] = "You start to make fun of random things about him.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 0 && wait == 10 && bstory == 2) {
          btltext[0] = "You make fun of what he's wearing at the moment.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 1 && wait == 10 && bstory == 0) {
          btltext[0] = "You walk towards him angrily.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 1 && wait == 10 && bstory == 1) {
          btltext[0] = "You cower towards the lockers.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 1 && wait == 10 && bstory == 2) {
          btltext[0] = "You hang your head down.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 2 && wait == 10 && bstory == 0) {
          btltext[0] = "You start running in the opposite direction.";
          counter = 0;
          wait = 0;
          silencecount += 1;
          bstate = "talk";
        }
        if (keys[4] && actstate == 2 && wait == 10 && bstory == 1) {
          btltext[0] = "You start running in the opposite direction.";
          counter = 0;
          wait = 0;
          silencecount += 1;
          bstate = "talk";
        }
        if (keys[4] && actstate == 2 && wait == 10 && bstory == 2) {
          btltext[0] = "You start running in the opposite direction.";
          counter = 0;
          wait = 0;
          silencecount += 1;
          bstate = "talk";
        }
        if (keys[4] && actstate == 3 && wait == 10 && bstory == 0) {
          btltext[0] = "You make an angry face at Marcus.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && wait == 10 && bstory == 3) {
          btltext[0] = "You make a run for it.";
          counter = 0;
          wait = 0;
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
          sanssound.play(1, .015f);
        }
        rectMode(CORNER);
        text(btltext[0].substring(0, counter/2), camx -180, camy + 20, 400, 200);
        rectMode(CENTER);
        if (counter == btltext[0].length()*2 && keys[4]) {
          if (bstory == 3) {
            counter = 0;
            btl1song.stop();
            songtimer = 0;
            drivetimer = 0;
            frisknum = 0;
            xsize = 38;
            ysize = 62;
            frisk[0] = loadImage("sr.png");
            state = "drive";
            y = camy;
            x = -320;
            story = 7;
          }
          if (bstory == 2) {
            wait = 0;
            bstory = 3;
          }
          if (bstory == 1) {
            wait = 0;
            bstory = 2;
          }
          if (bstory == 0) {
            wait = 0;
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
    textSize(30);
    if (story == 1) {
      fill(255);
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015f);
      }
      text(text1.substring(0, counter/3), camx -180, camy + 115, 300, 75);
      if (counter/3 == text1.length()) {
        if (keys[4]) {
          state = "walk";
          story = 2;
          counter = 0;
        }
      }
    }
    if (story == 3 && bybed == false && room == "bedroom") {
      fill(255);
      text1 = "You play some GTA.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015f);
      }
      text(text1.substring(0, counter/3), camx -180, camy + 105, 350, 200);
      if (counter/3 == text1.length()) {
        if (keys[4]) {
          story = 4;
          counter = 0;
        }
      }
    }
    if (story == 3 && bybed == true && room == "bedroom") {
      fill(255);
      text1 = "You don't feel very tired right now.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015f);
      }
      text(text1.substring(0, counter/3), camx -180, camy + 105, 350, 200);
      if (counter/3 == text1.length()) {
        if (keys[4]) {
          wait = 0;
          counter = 0;
          state = "walk";
        }
      }
    }
    if (textnum == 0 && room == "kitchen") {
      fill(255);
      text1 = "You grab a chocolate-flavored yogurt.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015f);
      }
      text(text1.substring(0, counter/3), camx -180, camy + 105, 350, 200);
      if (counter/3 == text1.length()) {
        if (keys[4]) {
          wait = 0;
          counter = 0;
          state = "walk";
        }
      }
    }
    if (textnum == 1 && room == "kitchen") {
      fill(255);
      text1 = "You wash your hands.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015f);
      }
      text(text1.substring(0, counter/3), camx -180, camy + 105, 350, 200);
      if (counter/3 == text1.length()) {
        if (keys[4]) {
          wait = 0;
          counter = 0;
          state = "walk";
        }
      }
    }
    if (textnum == 2 && room == "kitchen") {
      fill(255);
      text1 = "You grab two pots, wonder why you did, then put them back.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015f);
      }
      text(text1.substring(0, counter/3), camx -180, camy + 105, 350, 200);
      if (counter/3 == text1.length()) {
        if (keys[4]) {
          wait = 0;
          counter = 0;
          state = "walk";
        }
      }
    }
    if (textnum == 3 && room == "kitchen") {
      fill(255);
      text1 = "Silly, you don't know how to cook.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015f);
      }
      text(text1.substring(0, counter/3), camx -180, camy + 105, 350, 200);
      if (counter/3 == text1.length()) {
        if (keys[4]) {
          wait = 0;
          counter = 0;
          state = "walk";
        }
      }
    }
    if (bybed == true && room == "blue") {
      fill(255);
      text1 = "Your sister would kill you if you read her diary.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015f);
      }
      text(text1.substring(0, counter/3), camx -180, camy + 105, 350, 200);
      if (counter/3 == text1.length()) {
        if (keys[4]) {
          wait = 0;
          counter = 0;
          state = "walk";
        }
      }
    }
    if (bybed == false && room == "blue") {
      fill(255);
      text1 = "It's a bunch of teenage romance novels.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015f);
      }
      text(text1.substring(0, counter/3), camx -180, camy + 105, 350, 200);
      if (counter/3 == text1.length()) {
        if (keys[4]) {
          wait = 0;
          counter = 0;
          state = "walk";
        }
      }
    }
    if (story == 6 && bybed == true && room == "bedroom") {
      fill(255);
      text1 = "You can't sleep right now. You need to go to school.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015f);
      }
      text(text1.substring(0, counter/3), camx -180, camy + 105, 350, 200);
      if (counter/3 == text1.length()) {
        if (keys[4]) {
          wait = 0;
          counter = 0;
          state = "walk";
        }
      }
    }
    if (story == 6 && bybed == false && room == "bedroom") {
      fill(255);
      text1 = "Don't play games right now. You need to go to school.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015f);
      }
      text(text1.substring(0, counter/3), camx -180, camy + 105, 350, 200);
      if (counter/3 == text1.length()) {
        if (keys[4]) {
          wait = 0;
          counter = 0;
          state = "walk";
        }
      }
    }
    if (story == 7 && room == "bedroom" && gotyog == false) {
      fill(255);
      text1 = "Your stomach starts to gurgle.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015f);
      }
      text(text1.substring(0, counter/3), camx -180, camy + 105, 350, 200);
      if (counter/3 == text1.length()) {
        if (keys[4]) {
          wait = 0;
          counter = 0;
          state = "walk";
        }
      }
    }
    if (story == 7 && room == "bedroom" && gotyog == true) {
      fill(255);
      text1 = "You play some Call of Duty, but losing makes you angry.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015f);
      }
      text(text1.substring(0, counter/3), camx -180, camy + 105, 360, 200);
      if (counter/3 == text1.length()) {
        if (keys[4]) {
          wait = 0;
          counter = 0;
          state = "walk";
        }
      }
    }
    if (story == 4) {
      fill(255);
      text1 = "You notice how the character uses his gun.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015f);
      }
      text(text1.substring(0, counter/3), camx -180, camy + 105, 350, 200);
      if (counter/3 == text1.length()) {
        if (keys[4]) {
          wait = 0;
          counter = 0;
          story = 5;
          state = "walk";
        }
      }
    }
    if (story == 5) {
      fill(255);
      text1 = "You should go to bed.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015f);
      }
      text(text1.substring(0, counter/3), camx -180, camy + 100, 350, 200);
      if (counter/3 == text1.length()) {
        if (keys[4]) {
          wait = 0;
          state = "walk";
          counter = 0;
        }
      }
    }
  }
  if (state == "drive") {
    home.stop();
    therapy.stop();
    background(0);
    if (drivetimer == 0) {
      car.play(1, .015f);
    }
    drivetimer += 1;
    if (drivetimer == (60*5) + 20 || keys[4]) {
      car.stop();
      if (story == 3) {
        room = "hall";
        state = "walk";
      }
      if (story == 6) {
        songtimer = 0;
        bstory = 0;
        state = "battle";
      }
      if (story == 7) {
        songtimer = 0;
        room = "hall";
        x = -320;
        lcambound = 0;
        rcambound = 850;
        ucambound = height/2;
        dcambound = height/2;
        lbound = -320;
        rbound = 1090;
        ubound = 220;
        dbound = 300;        
        state = "walk";
      }
    }
  }
  if (state == "sleep") {
    home.stop();
    if (songtimer == 0) {
      sleep.play(1, .015f);
    }
    songtimer += 1;
    if (songtimer == 10*60) {
      songtimer = 0;
      sleep.stop();
      state = "walk";
    }
    image(bedroom, 680, -150, 480, 480);
    background(0);
    story = 6;
  }
  println(destx);
  println(desty);
}
  public void settings() {  size(640, 480, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Undertale" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
