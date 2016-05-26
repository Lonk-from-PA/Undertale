import processing.sound.*;
PImage[] frisk = new PImage[2];
PImage hall, blue, r1, bedroom, sanshead, sansbody, papyrus, fist, kitchen, muffet;
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
float sansx = -2.5;
float sansy, fistx, fisty;
String room, state, bstate, bbstate, sansmovex, sansmovey, evilstate, mainstate;
String text1 = "Come in, have a seat.";
String[] text = new String[20];
String[] acts = new String[4];
String[] btltext = new String[20];
boolean[] keys = new boolean[6];
boolean bybed = false;
boolean mean, gotyog;
SoundFile sanssound, therapy, btl1song, car, home, sleep, attack, chill, megalovania, date, girltext, rain, gun, credits;
void setup() {
  songtimer = 0;
  textnum = 0;
  sanssound = new SoundFile(this, "sanstext.wav");
  therapy = new SoundFile(this, "Undertale OST_ 006 - Uwa!! So Temperate♫ 3.mp3");
  btl1song = new SoundFile(this, "Undertale OST_ 009 - Enemy Approaching.mp3");
  car = new SoundFile(this, "Car Engine Sound Effect.mp3");
  home = new SoundFile(this, "Undertale OST_ 012 - Home.mp3");
  sleep = new SoundFile(this, "Undertale OST_ 101 - Good Night.mp3");
  attack = new SoundFile(this, "attack.mp3");
  chill = new SoundFile(this, "Undertale OST_ 041 - Chill.mp3");
  megalovania = new SoundFile(this, "Undertale OST_ 100 - Megalovania.mp3");
  date = new SoundFile(this, "Undertale OST_ 025 - Dating Start!.mp3");
  rain = new SoundFile(this, "Undertale OST_ 063 - It's Raining Somewhere Else.mp3");
  gun = new SoundFile(this, "45 ACP sound effect.mp3");
  credits = new SoundFile(this, "Undertale OST_ 031 - Waterfall 2.mp3");
  girltext = new SoundFile(this, "Toriel voice.wav");
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
  muffet = loadImage("muffet.png");
  room = "r1";
  state = "open";
  bstate = "main";
  mainstate = "fights";
  story = 1;
  destx = x;
  desty = y;
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
    if (state == "walk") {
      y = desty;
    }
    if (keys[1] == false && keys[2] == false && keys[3] == false && state == "walk") {
      frisk[0] = loadImage("su.png");
      walktimer = 0;
    }
  }
  if (keyCode == DOWN) {
    keys[1] = false;
    if (state == "walk") {
      y = desty;
    }
    if (keys[0] == false && keys[2] == false && keys [3] == false && state == "walk") {
      frisk[0] = loadImage("sd.png");
      walktimer = 0;
    }
  }
  if (keyCode == LEFT) {
    keys[2] = false;
    if (state == "walk") {
      x = destx;
    }
    if (keys[3] == false && state == "walk") {
      frisk[0] = loadImage("sl.png");
      walktimer = 0;
    }
  }
  if (keyCode == RIGHT) {
    keys[3] = false;
    if (state == "walk") {
      x = destx;
    }
    if (keys[2] == false && state == "walk") {
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

void draw() {
  background(0);
  if (state == "open") {
    if (songtimer == 0) {
      megalovania.play(1, 0.1);
    }
    songtimer += 1;
    if (songtimer == 9360) {
      megalovania.stop();
      songtimer = 0;
    }
    if (keys[4]) {
      megalovania.stop();
      state = "talk";
      songtimer = 0;
    }
    textSize(50);
    if (wait == 0) {
      fill(255);
    }
    if (wait >= 60) {
      fill(0);
    }
    if (wait == 120) {
      wait = -1;
    }
    wait += 1;
    text("Press Z", -100, -50);
    textSize(30);
    fill(255);
    text("[Z] - Confirm \n[X] - Cancel \n[Arrow Keys] - Move", -150, 10);
    text("Nolan Manor #18 3rd Hour", -210, 200);
  }
  if (room == "r1" && state == "walk" || room == "r1" && state == "talk") {
    if (songtimer == 0) {
      therapy.play(1, .015);
    }
    songtimer += 1;
    if (songtimer >= 3360) {
      songtimer = 0;
    }
    image(r1, -907, -55, 330*2, 250*2);
    ubound = 62;
    dbound = 311;
    rbound = -344;
    lbound = -857;
    ucambound = 185;
    rcambound = -587;
    lcambound = -587;
    dcambound = 185;
    if (wait < 10) {
      wait += 1;
    }
    if (wait > 10) {
      wait = 0;
    }
    if (destx >= -347 && desty <= 296 && desty >= 194 && keys[3] && state == "walk" && story == 3) {
      songtimer = 0;
      drivetimer = 0;
      therapy.stop();
      state = "drive";
    }
    if (destx >= -347 && desty <= 296 && desty >= 194 && keys[3] && state == "walk" && story == 9) {
      songtimer = 0;
      drivetimer = 0;
      therapy.stop();
      state = "drive";
    }
    if (destx >= -605 && destx <= -566 && desty <= 130 && keys[4] && wait >= 10) {
      textnum = 1;
      state = "talk";
    }
    if (destx >= -488 && destx <= -392 && desty <= 62 && keys[4] && wait >= 10) {
      textnum = 0;
      state = "talk";
    }
    if (desty == 182 && destx <= -539 && destx >= -626 && story == 2 && keys[1]) {
      destx = x;
      desty = y;
      therapy.stop();
      songtimer = 0;
      bstory = 0;
      state = "battle";
    }
    if (desty >= 179 && destx <= -539 && destx >= -626 && story == 8 && keys[1]) {
      lcambound = camx;
      rcambound = camx;
      ucambound = camy;
      dcambound = camy;
      therapy.stop();
      songtimer = 0;
      bstory = 0;
      state = "battle";
    }
    if (keys[0] && state == "walk") {
      if (desty <= ubound || desty <= 272 && desty >= 185 && destx <= -488 && destx >= -692 || desty <= 128 && destx >= -635 && destx <= -539) {
        desty+=0;
        frisk[0] = loadImage("su.png");
      } else {
        desty -= 3;
      }
    }
    if (keys[1] && state == "walk") {
      if (desty >= dbound || desty >=182 && destx <= -488 && destx >= -692 && desty <= 269) {
        desty+=0;
        frisk[0] = loadImage("sd.png");
      } else {
        desty += 3;
      }
    }
    if (keys[2] && state == "walk") {
      if (destx <= lbound || desty >= 185 && desty <= 269 && destx <= -485 && destx >= -692 || desty <= 125 && destx >= -635 && destx <= -536) {
        destx +=0;
        frisk[0] = loadImage("sl.png");
      } else {
        destx -= 3;
      }
    }
    if (keys[3] && state == "walk") {
      if (destx >= rbound || desty >=185 && desty <= 269 && destx <= -494 && destx >= -695 || desty <= 125 && destx >= -638 && destx <= -539) {
        destx+=0;
        frisk[0] = loadImage("sr.png");
      } else {
        destx += 3;
      }
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
    if (wait > 10) {
      wait = 0;
    }
    if (destx >= 961 && desty <= 77 || destx >= 959 && desty <= 80) {
      if (keys[4] && state == "walk" && story == 5 && wait >= 10) {
        songtimer = 0;
        state = "sleep";
      }
      if (keys[4] && state == "walk" && story < 5 && wait >= 10 || keys[4] && state == "walk" && story == 6 && wait >= 10 || keys[4] && state == "walk" && story == 8 && wait >= 10) {
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
      if (keys[4] && state == "walk" && story == 9 && wait >= 10) {
        counter = 0;
        bybed = true;
        state = "talk";
      }
      if (keys[4] && state == "walk" && story == 10 && wait >= 10) {
        songtimer = 0;
        state = "sleep";
      }
      if (keys[4] && state == "walk" && story == 11 && wait >= 10) {
        counter = 0;
        bybed = true;
        state = "talk";
      }
      if (keys[4] && state == "walk" && story == 12 && wait >= 10) {
        songtimer = 0;
        state = "sleep";
      }
      if (keys[4] && state == "walk" && story == 13 && wait >= 10) {
        counter = 0;
        bybed = true;
        state = "talk";
      }
      if (keys[4] && state == "walk" && story >= 14 && wait >= 10) {
        counter = 0;
        bybed = true;
        state = "talk";
      }
    }
    if (desty <= 29 && destx >= 880 && destx <= 928 && keys[4] && state == "walk" && wait >= 10) {
      bybed = false;
      counter = 0;
      state = "talk";
    }
    if (keys[0] && state == "walk") {
      if (desty <= ubound || destx >= 959 && desty <= 80) {
        desty+=0;
        frisk[0] = loadImage("su.png");
      } else {
        desty -= 3;
      }
    }
    if (keys[1] && state == "walk") {
      if (desty >= dbound && destx >= 856 || desty >= dbound && destx <= 820) {
        desty+=0;
        frisk[0] = loadImage("sd.png");
      } else {
        desty += 3;
      }
    }
    if (keys[2] && state == "walk") {
      if (destx <= lbound || destx <= 817 && desty >= 194) {
        destx +=0;
        frisk[0] = loadImage("sl.png");
      } else {
        destx -= 3;
      }
    }
    if (keys[3] && state == "walk") {
      if (destx >= rbound || destx >= 862 && desty >= 194 || destx >= 961 && desty <= 77) {
        destx+=0;
        frisk[0] = loadImage("sr.png");
      } else {
        destx += 3;
      }
    }
    if (desty >= 248 && keys[1]) {
      room = "hall";
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
    if (destx <= -320 && story == 6 && keys[2]) {
      drivetimer = 0;
      state = "drive";
    }
    if (destx <= -320 && story == 8 && keys[2]) {
      songtimer = 0;
      drivetimer = 0;
      state = "drive";
    }
    if (destx <= -320 && story == 11 && keys[2]) {
      songtimer = 0;
      drivetimer = 0;
      state = "drive";
    }
    if (destx <= -320 && story == 13 && keys[2]) {
      songtimer = 0;
      drivetimer = 0;
      state = "drive";
    }
    if (destx <= -320 && story == 15 && keys[2]) {
      songtimer = 0;
      drivetimer = 0;
      state = "drive";
    }
    if (destx >= -20 && destx <= 25 && desty <= 220 && keys[0] && state == "walk") {
      room = "kitchen";
    }
    if (destx >= 394 && destx <= 448 && desty <= 220 && keys[0] && state == "walk") {
      room = "blue";
    }
    if (destx >= 817 && destx <= 865 && desty <= 220 && keys[0]) {
      room = "bedroom";
    }
    if (keys[0] && state == "walk") {
      if (desty <= ubound) {
        desty+=0;
        frisk[0] = loadImage("su.png");
      } else {
        desty -= 3;
      }
    }
    if (keys[1] && state == "walk") {
      if (desty >= dbound) {
        desty+=0;
        frisk[0] = loadImage("sd.png");
      } else {
        desty += 3;
      }
    }
    if (keys[2] && state == "walk") {
      if (destx <= lbound) {
        destx +=0;
        frisk[0] = loadImage("sl.png");
      } else {
        destx -= 3;
      }
    }
    if (keys[3] && state == "walk") {
      if (destx >= rbound) {
        destx+=0;
        frisk[0] = loadImage("sr.png");
      } else {
        destx += 3;
      }
    }
  }
  if (room == "blue" && state == "walk" || room == "blue" && state == "talk" || room == "blue" && state == "battle") {
    if (songtimer == 0) {
      home.play(1, .015);
    }
    songtimer += 1;
    if (wait < 10) {
      wait += 1;
    }
    if (wait > 10) {
      wait = 0;
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
    if (destx <= 393 && desty <=164 && keys[4] && wait >= 10 && state == "walk") {
      bybed = true;
      state = "talk";
    }
    if (destx <= 564 && destx >= 462 && desty <=-31 && keys[4] && wait >= 10 && state == "walk") {
      bybed = false;
      state = "talk";
    }
    if (desty >= 190 && destx >= 406 && destx <= 440 && keys[1] && state == "walk") {
      room = "hall";
    }
    if (keys[0] && state == "walk") {
      if (desty <= ubound || desty <= 135 && destx <= 430) {
        desty+=0;
        frisk[0] = loadImage("su.png");
      } else {
        desty -= 3;
      }
    }
    if (keys[1] && state == "walk") {
      if (desty >= dbound || desty >=95 && destx >= 592) {
        desty+=0;
        frisk[0] = loadImage("sd.png");
      } else {
        desty += 3;
      }
    }
    if (keys[2] && state == "walk") {
      if (destx <= lbound || destx <= 433 && y <= 132) {
        destx +=0;
        frisk[0] = loadImage("sl.png");
      } else {
        destx -= 3;
      }
    }
    if (keys[3] && state == "walk") {
      if (destx >= rbound || destx >= 589 && y >=98) {
        destx+=0;
        frisk[0] = loadImage("sr.png");
      } else {
        destx += 3;
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
      home.play(1, .015);
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
    if (desty >= 173 && destx >= -26 && destx <= 37 && keys[1] && state == "walk") {
      desty = 212;
      room = "hall";
    }
    if (desty <= 32 && destx <= -29 && keys[4] && state == "walk" && wait >= 10) {
      textnum = 0;
      if (story == 7) {
        gotyog = true;
      }
      state = "talk";
    }
    if (desty <= 32 && destx <= 37 && destx >= 7 && keys[4] && state == "walk" && wait >= 10) {
      textnum = 1;
      state = "talk";
    }
    if (desty <= 32 && destx <= 187 && destx >= 82 && keys[4] && state == "walk" && wait >= 10) {
      textnum = 2;
      state = "talk";
    }
    if (desty <= 32 && destx <= 256 && destx >= 217 && keys[4] && state == "walk" && wait >= 10) {
      textnum = 3;
      state = "talk";
    }
    if (keys[0] && state == "walk") {
      if (y <= ubound) {
        desty+=0;
        frisk[0] = loadImage("su.png");
      } else {
        desty -= 3;
      }
    }
    if (keys[1] && state == "walk") {
      if (y >= dbound) {
        desty+=0;
        frisk[0] = loadImage("sd.png");
      } else {
        desty += 3;
      }
    }
    if (keys[2] && state == "walk") {
      if (x <= lbound) {
        destx +=0;
        frisk[0] = loadImage("sl.png");
      } else {
        destx -= 3;
      }
    }
    if (keys[3] && state == "walk") {
      if (x >= rbound) {
        destx+=0;
        frisk[0] = loadImage("sr.png");
      } else {
        destx += 3;
      }
    }
  }
  camera(camx, camy, (height/2) / tan(PI/6), camx, camy, 0, 0, 1, 0);
  if (state == "walk") {
    y = lerp(y, desty, .9);
    x = lerp(x, destx, .9);
    if (desty > y && destx == x) {
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
    if (desty < y && destx == x) {
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
    if (destx > x && desty == y) {
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
    if (destx > x && desty > y || destx > x && desty < y) {
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
    if (destx < x && desty == y) {
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
    if (destx < x && desty > y || destx < x && desty < y) {
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
    rbound = x;
    lbound = x;
    ubound = y;
    dbound = y;
    x = lerp(x, destx, .15);
    y = lerp(y, desty, .15);
    xsize = 28.5;
    ysize = 46.5;
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
        if (wait >10) {
          wait = 0;
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
        if (wait > 10) {
          wait = 0;
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
        if (keys[5]) {
          counter = btltext[0].length()*2;
        }
        if (counter < btltext[0].length()*2) {
          counter++;
          sanssound.play(1, .015);
        }
        rectMode(CORNER);
        text(btltext[0].substring(0, counter/2), camx -180, camy + 20, 400, 200);
        rectMode(CENTER);
        if (counter == btltext[0].length()*2 && keys[4]) {
          if (bstory == 3) {
            counter = 0;
            btl1song.stop();
            songtimer = 0;
            destx = camx;
            desty = camy - 10;
            x = destx;
            y = desty;
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
        btl1song.play(1, .015);
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
          sanssound.play(1, .015);
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
          attack.play(1, .2);
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
        if (keyCode == DOWN && actstate == 1 && bstory == 1 || keyCode == DOWN && actstate == 1 && bstory == 2) {
          actstate = 2;
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
          actstate = 0;
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
        if (keys[5]) {
          counter = btltext[0].length()*3;
        }
        if (counter < btltext[0].length()*2) {
          counter++;
          sanssound.play(1, .015);
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
            desty = camy;
            destx = -320;
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
    if (story == 8) {
      if (songtimer == 0) {
        chill.play(1, .015);
      }
      songtimer += 1;
      if (songtimer >= 55*60) {
        chill.stop();
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
        sansx += .25/12;
      }
      if (sansmovex == "left") {
        sansx -= .25/12;
      }
      if (sansmovey == "up") {
        sansy -= .25/12;
      }
      if (sansmovey == "down") {
        sansy += .25/12;
      }
      if (bstory == 0) {
        acts[0] = "Lie";
        acts[1] = "Explain";
        acts[2] = "Don't talk";
      }
      if (bstory == 1) {
        acts[0] = "Nod";
        acts[1] = "Start to cry";
        acts[2] = "Stay silent";
      }
      if (bstory == 2) {
        acts[0] = "Silence";
        acts[1] = "Cry";
        acts[2] = "Say it won't get better";
      }
      if (bstory == 3) {
        acts[0] = "Silence";
        acts[1] = "Lie";
        acts[2] = "Leave anyway";
      }
      if (bstate == "main") {
        if (wait < 10) {
          wait += 1;
        }
        if (bstory == 0) {
          btltext[0] = "Frank consults you about what happened with Marcus.";
        }
        if (bstory == 1) {
          btltext[0] = "Frank tells you things will get better.";
        }
        if (bstory == 2) {
          if (explaincount == 1) {
            btltext[0] = "Frank sternly says not to cry.";
          } else {
            btltext[0] = "Frank doesn't know what to say.";
          }
        }
        if (bstory == 3) {
          btltext[0] = "Frank seems reluctant to let you leave.";
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
          btltext[0] = "You tell him nothing happened.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 0 && wait == 10 && bstory == 1) {
          btltext[0] = "You nod your head, knowing it won't.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 0 && wait == 10 && bstory == 2) {
          btltext[0] = "You sit there, looking sad.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 0 && wait == 10 && bstory == 3) {
          btltext[0] = "You don't say anything, but soon get up and leave.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 1 && wait == 10 && bstory == 0) {
          btltext[0] = "You tear up and tell Frank what happened.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 1 && wait == 10 && bstory == 1) {
          btltext[0] = "You start to bawl.";
          counter = 0;
          wait = 0;
          explaincount += 1;
          bstate = "talk";
        }
        if (keys[4] && actstate == 1 && wait == 10 && bstory == 2) {
          btltext[0] = "You keep bawling.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 1 && wait == 10 && bstory == 3) {
          btltext[0] = "You say everything's fine, then leave.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 2 && wait == 10 && bstory == 0) {
          btltext[0] = "You don't say anything.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 2 && wait == 10 && bstory == 1) {
          btltext[0] = "You don't say anything.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 2 && wait == 10 && bstory == 2) {
          btltext[0] = "You tell Frank you know things won't get better.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 2 && wait == 10 && bstory == 3) {
          btltext[0] = "You just get up and leave.";
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
          sanssound.play(1, .015);
        }
        if (keys[5]) {
          counter = btltext[0].length()*2;
        }
        rectMode(CORNER);
        text(btltext[0].substring(0, counter/2), camx -180, camy + 20, 400, 200);
        rectMode(CENTER);
        if (counter == btltext[0].length()*2 && keys[4]) {
          if (bstory == 3) {
            counter = 0;
            chill.stop();
            songtimer = 0;
            destx = camx;
            desty = camy - 10;
            x = destx;
            y = desty;
            frisknum = 0;
            xsize = 38;
            ysize = 62;
            frisk[0] = loadImage("su.png");
            state = "walk";
            story = 9;
          } else {
            bstory += 1;
          }
          counter = 0;
          bstate = "main";
        }
      }
    }
    if (story == 11) {
      lcambound = camx;
      rcambound = camx;
      ucambound = camy;
      dcambound = camy;
      if (songtimer == 0) {
        date.play(1, .015);
      }
      songtimer += 1;
      if (songtimer >= date.duration()*60) {
        date.stop();
        songtimer = 0;
      }
      imageMode(CENTER);
      pushMatrix();
      translate(camx, camy - 120);
      image(muffet, 0, 0, 212, 204);
      popMatrix();
      imageMode(CORNER);
      if (bstory == 0) {
        acts[0] = "Say hi";
        acts[1] = "Walk away";
        acts[2] = "Break eye contact";
      }
      if (bstory == 1) {
        acts[0] = "What's up?";
        acts[1] = "Leave";
        acts[2] = "Look at the ground";
      }
      if (bstory == 2) {
        acts[0] = "Lie";
        acts[1] = "Explain";
        acts[2] = "Say \"Yeah\"";
      }
      if (bstory == 3) {
        acts[0] = "Oh";
        acts[1] = "Explain";
        acts[2] = "Run away";
      }
      if (bstate == "main") {
        if (wait < 10) {
          wait += 1;
        }
        if (wait >10) {
          wait = 0;
        }
        if (bstory == 0) {
          btltext[0] = "Your girlfriend, Tiffany, approaches.";
        }
        if (bstory == 1) {
          btltext[0] = "Tiffany shyly looks at the ground.";
        }
        if (bstory == 2) {
          btltext[0] = "Hey, I heard about what happened.";
        }
        if (bstory == 3) {
          btltext[0] = "I just don't really want to be a part of it all.";
        }
        destx = camx - 52;
        desty = camy + 175;
        imageMode(CENTER);
        image(acticon[0], camx, camy+196);
        imageMode(CORNER);
        textSize(30);
        if (counter < btltext[0].length()*2) {
          counter++;
          girltext.play(1, .015);
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
        if (wait > 10) {
          wait = 0;
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
          btltext[0] = "You shout, \"HI!\" aross the hallway.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 0 && wait == 10 && bstory == 1) {
          btltext[0] = "You ask her why she looks sad.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 0 && wait == 10 && bstory == 2) {
          btltext[0] = "You say nothing actually happened.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 0 && wait == 10 && bstory == 3) {
          btltext[0] = "You manage to get out an \"Oh\" before she leaves.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 1 && wait == 10 && bstory == 0) {
          btltext[0] = "You walk away, but she comes up to you.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 1 && wait == 10 && bstory == 1) {
          btltext[0] = "You start walking away, but she grabs your arm.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 1 && wait == 10 && bstory == 2) {
          btltext[0] = "You tell her about Marcus.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 1 && wait == 10 && bstory == 3) {
          btltext[0] = "You try to say nothing will happen, but she leaves.";
          counter = 0;
          wait = 0;
          explaincount+=1;
          bstate = "talk";
        }
        if (keys[4] && actstate == 2 && wait == 10 && bstory == 0) {
          btltext[0] = "You look away, but she runs up to you.";
          counter = 0;
          wait = 0;
          silencecount+=1;
          bstate = "talk";
        }
        if (keys[4] && actstate == 2 && wait == 10 && bstory == 1) {
          btltext[0] = "You look down with her.";
          counter = 0;
          wait = 0;
          silencecount+=1;
          bstate = "talk";
        }
        if (keys[4] && actstate == 2 && wait == 10 && bstory == 2) {
          btltext[0] = "You just say \"Yeah.\"";
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
        if (keys[5]) {
          counter = btltext[0].length()*2;
        }
        if (counter < btltext[0].length()*2) {
          counter++;
          girltext.play(1, .015);
        }
        rectMode(CORNER);
        text(btltext[0].substring(0, counter/2), camx -180, camy + 20, 400, 200);
        rectMode(CENTER);
        if (counter == btltext[0].length()*2 && keys[4]) {
          if (bstory == 3) {
            counter = 0;
            date.stop();
            drivetimer = 0;
            desty = 258;
            destx = -330;
            x = destx;
            y = desty;
            frisknum = 0;
            xsize = 38;
            ysize = 62;
            frisk[0] = loadImage("sr.png");
            story = 12;
            wait = 0;
            state = "drive";
          }
          if (bstory == 2) {
            bstory = 3;
          }
          if (bstory == 1) {
            date.stop();
            date = new SoundFile(this, "Undertale OST_ 041 - Chill.mp3");
            songtimer = 0;
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
    if (story == 13) {
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
      image(papyrus, 0, 45, 74*2, 103*2);
      popMatrix();
      imageMode(CORNER);
      if (bstory == 0) {
        acts[0] = "Walk past";
        acts[1] = "Confront";
        acts[2] = "Run away";
        acts[3] = "Scowl";
      }
      if (bstory == 1) {
        acts[0] = "Lie";
        acts[1] = "Stay silent";
        acts[2] = "Run away";
        acts[3] = "Call out";
      }
      if (bstory == 2) {
        acts[0] = "Shout back";
        acts[1] = "Silence";
        acts[2] = "Run away";
        acts[3] = "Call out";
      }
      if (bstory == 3) {
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
          btltext[0] = "Marcus is waiting outside your first hour.";
        }
        if (bstory == 1 && silencecount == 1) {
          btltext[0] = "He spots you, and runs up to you.";
          x = 7000;
          if (keys[4] && wait >= 10) {
            counter = 0;
            wait = 0;
            silencecount = 0;
          }
        }
        if (bstory > 1 && silencecount == 1) {
          btltext[0] = "He easily catches up to you.";
          x = 7000;
          if (keys[4] && wait >= 10) {
            counter = 0;
            wait = 0;
            silencecount = 0;
          }
        }
        if (bstory == 1 && silencecount == 0) {
          btltext[0] = "So, I heard you lost your girlfriend.";
        }
        if (bstory == 2 && silencecount == 0) {
          btltext[0] = "Random people start shouting mean things at you.";
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
          sanssound.play(1, .015);
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
          attack.play(1, .2);
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
            story = 14;
            state = "drive";
          }
          if (bstory < 3) {
            bstory += 1;
            mean = true;
          }
        }
        x = 700000;
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
        if (keyCode == DOWN && actstate == 1) {
          actstate = 3;
        }
        if (keyCode == UP && actstate == 2) {
          actstate = 0;
        }
        if (keyCode == RIGHT && actstate == 2) {
          actstate = 3;
        }
        if (keyCode == UP && actstate == 3) {
          actstate = 1;
        }
        if (keyCode == LEFT && actstate == 3) {
          actstate = 2;
        }
        if (keys[4] && actstate == 0 && wait == 10 && bstory == 0) {
          btltext[0] = "You try to walk into your class, but he notices you.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 0 && wait == 10 && bstory == 1) {
          btltext[0] = "You tell him she didn't leave you.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 0 && wait == 10 && bstory == 2) {
          btltext[0] = "You shout things at the people around you.";
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
          btltext[0] = "You look toward the ground.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 1 && wait == 10 && bstory == 2) {
          btltext[0] = "You hang your head down and tear up a little.";
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
          btltext[0] = "You make a nasty face.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 3 && wait == 10 && bstory == 1) {
          btltext[0] = "You call out, but it only draws people in.";
          counter = 0;
          wait = 0;
          bstate = "talk";
        }
        if (keys[4] && actstate == 3 && wait == 10 && bstory == 2) {
          btltext[0] = "You call for help, but no one comes.";
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
        if (keys[5]) {
          counter = btltext[0].length()*3;
        }
        if (counter < btltext[0].length()*2) {
          counter++;
          sanssound.play(1, .015);
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
            desty = camy;
            destx = -320;
            story = 14;
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
    if (story == 15) {
      mainstate = "fights";
      if (songtimer == 0 && bstate == "main") {
        rain.play(.85, .02);
      }
      songtimer += 1;
      if (songtimer >= 170*60 && bstate == "main") {
        rain.stop();
        songtimer = 0;
      }
      imageMode(CENTER);
      pushMatrix();
      translate(camx, camy - 170);
      image(papyrus, 0, 45, 74*2, 103*2);
      popMatrix();
      imageMode(CORNER);
      if (bstate == "main") {
        if (wait < 10) {
          wait += 1;
        }
        if (bstory == 0) {
          btltext[0] = "You can't deal with it any more.";
        }
        imageMode(CENTER);
        image(acticon[1], camx, camy + 200);
        imageMode(CORNER);
        textSize(30);
        if (counter < btltext[0].length()*2) {
          counter++;
          sanssound.play(1, .015);
        }
        text(btltext[0].substring(0, counter/2), camx -180, camy + 20, 400, 200);
        if (mainstate == "fights") {
          acticon[1] = loadImage("fights.png");
          destx = camx - 53;
          desty = camy + 178;
        }
        if (keys[4] && wait == 10 && mainstate == "fights") {
          wait = 0;
          fighttimer = 0;
          bstate = "fight";
        }
      }
      if (bstate == "fight") {
        rain.stop();
        background(0);
        frisk[frisknum] = loadImage("blank.png");
        destx = camx;
        desty = camy + 300;
        if (fighttimer == 0) {
          gun.play(1, .15);
        }
        fighttimer += 1;
        if (fighttimer == 7*60) {
          songtimer = 0;
          state = "credits";
        }
      }
    }
  }
  pushMatrix();
  translate(x, y);
  image(frisk[frisknum], 0, 0, xsize, ysize);
  popMatrix();
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
    if (keys[5]) {
      counter = text1.length()*3;
    }
    if (story == 1) {
      fill(255);
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015);
      }
      text(text1.substring(0, counter/3), camx -180, camy + 115, 300, 200);
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
        sanssound.play(1, .015);
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
        sanssound.play(1, .015);
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
    if (story == 9 && bybed == true && room == "bedroom") {
      fill(255);
      text1 = "You're too worked up to go to bed.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015);
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
    if (story == 9 && bybed == false && room == "bedroom") {
      fill(255);
      text1 = "You play some Mario to relieve stress.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015);
      }
      text(text1.substring(0, counter/3), camx -180, camy + 105, 350, 200);
      if (counter/3 == text1.length()) {
        if (keys[4]) {
          wait = 0;
          counter = 0;
          story = 10;
          state = "walk";
        }
      }
    }
    if (story == 10 && bybed == false && room == "bedroom") {
      fill(255);
      text1 = "Now you should go to bed.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015);
      }
      text(text1.substring(0, counter/3), camx -180, camy + 105, 350, 200);
      if (counter/3 == text1.length()) {
        if (keys[4]) {
          wait = 0;
          counter = 0;
          story = 10;
          state = "walk";
        }
      }
    }
    if (story == 12 && bybed == false && room == "bedroom") {
      fill(255);
      text1 = "You don't feel up for doing anything anymore.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015);
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
        sanssound.play(1, .015);
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
        sanssound.play(1, .015);
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
        sanssound.play(1, .015);
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
        sanssound.play(1, .015);
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
        sanssound.play(1, .015);
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
        sanssound.play(1, .015);
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
        sanssound.play(1, .015);
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
        sanssound.play(1, .015);
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
    if (story == 8 && bybed == false && room == "bedroom") {
      fill(255);
      text1 = "No. You need to go to the therapist.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015);
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
    if (story == 8 && bybed == true && room == "bedroom") {
      fill(255);
      text1 = "Nonono. You need to go to the therapist.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015);
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
    if (story == 11 && bybed == false && room == "bedroom") {
      fill(255);
      text1 = "You should go to school, even if you're sad.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015);
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
    if (story == 11 && bybed == true && room == "bedroom") {
      fill(255);
      text1 = "You should go to school, even if you're sad.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015);
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
    if (story == 13 && bybed == true && room == "bedroom") {
      fill(255);
      text1 = "You might as well go to school.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015);
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
    if (story == 13 && bybed == false && room == "bedroom") {
      fill(255);
      text1 = "You might as well go to school.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015);
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
    if (story == 14 && bybed == false && room == "bedroom") {
      fill(255);
      text1 = "You can't play games right now. You need to show them.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015);
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
    if (story == 15 && bybed == false && room == "bedroom") {
      fill(255);
      text1 = "Your heart crusts over in anger.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015);
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
    if (story == 14 && bybed == true && room == "bedroom") {
      fill(255);
      text1 = "You grab the pistol you've been keeping under your bed.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015);
      }
      text(text1.substring(0, counter/3), camx -180, camy + 105, 350, 200);
      if (counter/3 == text1.length()) {
        if (keys[4]) {
          wait = 0;
          counter = 0;
          songtimer = 0;
          state = "sleep";
        }
      }
    }
    if (story == 15 && bybed == true && room == "bedroom") {
      fill(255);
      text1 = "Your eyes fill with rage.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015);
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
        sanssound.play(1, .015);
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
        sanssound.play(1, .015);
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
        sanssound.play(1, .015);
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
        sanssound.play(1, .015);
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
    if (story == 2 && textnum == 1 && room == "r1") {
      fill(255);
      text1 = "Come in, have a seat.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015);
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
    if (story == 3 && textnum == 1 && room == "r1") {
      fill(255);
      text1 = "Have a good day!";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015);
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
    if (story == 8 && textnum == 1 && room == "r1") {
      fill(255);
      text1 = "Have a seat...";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015);
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
    if (story == 9 && textnum == 1 && room == "r1") {
      fill(255);
      text1 = ".........................................................";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015);
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
    if (textnum == 0 && room == "r1" && story > 1) {
      fill(255);
      text1 = "There's a bunch of psychiatric encyclopedias.";
      if (counter < text1.length()*3) {
        counter++;
        sanssound.play(1, .015);
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
  }
  if (state == "drive") {
    home.stop();
    therapy.stop();
    background(0);
    if (wait < 10) {
      wait += 1;
    }
    if (drivetimer == 0) {
      car.play(1, .015);
    }
    drivetimer += 1;
    if (drivetimer == (60*5) + 20 || keys[5] && wait >= 10) {
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
        destx = -320;
        desty = 259;
        x = destx;
        y = desty;
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
      if (story == 8) {
        room = "r1";
        state = "walk";
      }
      if (story == 9) {
        room = "hall";
        state = "walk";
      }
      if (story == 11) {
        songtimer = 0;
        bstory = 0;
        state = "battle";
      }
      if (story == 12) {
        songtimer = 0;
        room = "hall";
        destx = -320;
        desty = 259;
        x = destx;
        y = desty;
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
      if (story == 13) {
        songtimer = 0;
        bstory = 0;
        state = "battle";
      }
      if (story == 14) {
        songtimer = 0;
        room = "hall";
        destx = -320;
        desty = 259;
        x = destx;
        y = desty;
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
      if (story == 15) {
        songtimer = 0;
        bstory = 0;
        state = "battle";
      }
    }
  }
  if (state == "sleep") {
    home.stop();
    if (songtimer == 0) {
      sleep.play(1, .015);
    }
    songtimer += 1;
    if (songtimer == 600) {
      songtimer = 0;
      sleep.stop();
      state = "walk";
    }
    image(bedroom, 680, -150, 480, 480);
    background(0);
    if (story == 5) {
      story = 6;
    }
    if (story == 7) {
      story = 8;
    }
    if (story == 10) {
      story = 11;
    }
    if (story == 12) {
      story = 13;
    }
    if (story == 14) {
      story = 15;
    }
  }
  if (state == "credits") {
    if (songtimer == 0) {
      credits.play(1, 0.15);
    }
    songtimer += 1 ;
    frisk[frisknum] = loadImage("blank.png");
    if (songtimer < 55*60) {
      y -= 1;
    }
    fill(255);
    rectMode(CENTER);
    textAlign(CENTER);
    textSize(20);
    text("CREDITS\n\nNolan Manor                   Producer\nNolan Manor                Co-Producer\nNolan Manor                   Director\nNolan Manor            Lead Programmer\nNicole Merner         Nothing Actually", x, y + 300, 480, 500);
    text("WORKS CITED", x, y + 500, 480, 200);
    fill(255, 255, 0);
    text("Sorry, the indentations are wrong, but I can't do anything about that, so I've printed out a copy.", x, y + 550, 480, 200);
    fill(255);
    text("Car Engine Sound Effect. Dir. FX Sounds. YouTube. YouTube, 4 Jan. 2014. Web. 14 May 2016. <https://www.youtube.com/watch?v=f5Z13dTcmro>.", x, y + 750, 460, 300);
    text("Ccooldean. Papyrus and Sans's House. Digital image. The Spriters Resource. N.p., n.d. Web. 18 May 2016. <http://www.spriters-resource.com/pc_computer/undertale/sheet/77169/>.", x, y + 750 + 150, 460, 300);
    text("Esteban64ds. Home and New Home. Digital image. The Spriters Resource. N.p., n.d. Web. 4 May 2016. <http://www.spriters-resource.com/pc_computer/undertale/sheet/76337/>.", x, y + 900 + 150, 460, 300);
    text("Fox, Toby. UNDERTALE Soundtrack. Perf. Stephanie MacIntire. Toby Fox. BandCamp, 2015. MP3.", x, y + 1050 + 150, 460, 300);
    text("Fillerthefreak. Battle Icons. Digital image. The Spriters Resource. N.p., n.d. Web. 10 May 2016. <http://www.spriters-resource.com/pc_computer/undertale/sheet/76661/>.", x, y + 1150 + 150, 460, 300);
    text("The Herp Derpinator. Attack Effects. Digital image. The Spriters Resource. N.p., n.d. Web. 19 May 2016. <http://www.spriters-resource.com/pc_computer/undertale/sheet/77983/>.", x, y + 1300 + 150, 460, 300);
    text("The Herp Derpinator. Muffet. Digital image. The Spriters Resource. N.p., n.d. Web. 23 May 2016. <http://www.spriters-resource.com/pc_computer/undertale/sheet/77091/>.", x, y + 1450 + 150, 460, 300);
    text("UnderFail. Frisk. Digital image. The Spriters Resource. N.p., n.d. Web. 10 May 2016. <http://www.spriters-resource.com/pc_computer/undertale/sheet/75941/>.", x, y + 1600 + 150, 460, 300);
    text("UnderFail. Papyrus. Digital image. The Spriters Resource. N.p., n.d. Web. 19 May 2016. <http://www.spriters-resource.com/pc_computer/undertale/sheet/76014/>.", x, y + 1750 + 150, 460, 300);
    text("UnderFail. Sans. Digital image. The Spriters Resource. N.p., n.d. Web. 14 May 2016. <http://www.spriters-resource.com/pc_computer/undertale/sheet/76011/>.", x, y + 1900 + 150, 460, 300);
    text("UnderFail. Sans. Digital image. The Spriters Resource. N.p., n.d. Web. 14 May 2016. <http://www.spriters-resource.com/pc_computer/undertale/sheet/76017/>.", x, y + 2050 + 150, 460, 300);
    text("\"Undertale Sounds.\" MediaFire. N.p., 17 Oct. 2015. Web. 12 May 2016. <http://www.mediafire.com/download/56ckqkl9csddame/undertale+sounds.zip>.", x, y + 2200 + 150, 460, 300);
    text("Wakamatsu, Harry. DTM-Mono. N.p.: n.p., 16 Nov. 2015. OTF.", x, y + 2350 + 150, 460, 300);
    text(".45 ACP Sound Effect. Dir. Jojikiba. YouTube. YouTube, 13 June 2012. Web. 25 May 2016. <https://www.youtube.com/watch?v=2MWza2mpzVc>.", x, y + 2650, 460, 300);
    fill(255, 0, 0);
    text("What have you done?", x, y + 3150, 460, 300);
  }
}