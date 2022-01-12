//Dungeon Crawl
//Mickey Zhao
//Oct 21st

//modes
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
int mode;

//dropped items
final int AMMO = 0;
final int MONEY = 1;
final int GUN = 2;
final int HEALING = 3;

//colors
color red = #FF0000;
color yellow = #FFFF00;
color green = #00FF00;
color blue  = #0000FF;
color magenta = #FF00FF;
color white = #FFFFFF;
color black = #000000;
color pink = #FFC0CB;
color shieldColor = #99FFFF;

//movements
boolean up, down, left, right, space;

//gifs
AnimatedGIF introGif;//intro gif
AnimatedGIF manUP;
AnimatedGIF manDOWN;
AnimatedGIF manLEFT;
AnimatedGIF manRIGHT;

AnimatedGIF ghost;
AnimatedGIF healing;
AnimatedGIF normalBoss;
AnimatedGIF rageBoss;

//images
PImage map;
color northRoom, eastRoom, southRoom, westRoom;
int mapx,mapy;

PImage follower;
PImage turret;
PImage sniper;
PImage shotgun;
PImage rocket;

PImage explode;

//hero
Hero me;

//boss
Enemy boss;

//game objects
ArrayList<GameObject> myObjects;

//darkness
ArrayList<Darkness> darkness = new ArrayList<Darkness>(1000);
float darkSize =  10;
int darkx = 0, darky = 0;

//buttons
Button introButton;
Button heroButton;
Button pauseButton;
Button hpButton;
Button speedButton;
Button damageButton;

//weapon
Weapon myWeapon;

//loading rooms
int rx;
int ry;

void setup()
{
  size(900,900);
  mode = INTRO;
  rectMode(CENTER);
  imageMode(CENTER);
  
  //loading  gifs
  introGif = new AnimatedGIF(56,"frame_","_delay-0.06s.gif");
  manUP = new AnimatedGIF(4,10,"up_",".png");
  manDOWN = new AnimatedGIF(4,10,"down_",".png");
  manLEFT = new AnimatedGIF(4,10,"left_",".png");
  manRIGHT = new AnimatedGIF(4,10,"right_",".png");
  
  ghost = new AnimatedGIF(6, 10, "ghost_", ".gif");
  healing = new AnimatedGIF(4, 10, "helth_", ".png");
  normalBoss = new AnimatedGIF(9, 10, "boss_normal_", ".gif");
  rageBoss = new AnimatedGIF(9, 10, "boss_rage_", ".gif");
  
  //buttons
  introButton = new Button(magenta,white,width/2,700,150,100,"Start",10,60);
  heroButton = new Button(magenta, green, width-200,50,75,25,"Hero",2,20);
  pauseButton = new Button(white, black, width/2+260, height/2-260, 50,50,"x",2,50);
  hpButton = new Button(green,yellow,width/2-250,height/2-150,40,40,"+",4,50);
  speedButton = new Button(blue,yellow,width/2-250,height/2,40,40,"+",4,50);
  damageButton = new Button(red,yellow,width/2-250,height/2+150,40,40,"+",4,50);
  
  //locading images
  map = loadImage("map.png");
  follower = loadImage("Follower.jpeg");
  turret = loadImage("Turret.jpeg");
  sniper = loadImage("Sniper.jpeg");
  shotgun = loadImage("Shotgun.jpeg");
  rocket = loadImage("Rocket.jpg");
  
  explode = loadImage("Explode.jpeg");
  
  myObjects = new ArrayList<GameObject>();
  
  me = new Hero();
  myObjects.add(me);
  //myObjects.add(new Enemy());
  //myObjects.add(new Follower(1,2));
  //myObjects.add(new Follower(2,1));
  
  boss = new Boss(8,8);
  myObjects.add(boss);
  
  //loading  enemies
  rx = 0;
  ry = 0;
  while(ry<map.height)
  {
    color roomColor = map.get(rx,ry);
    if(roomColor == red)
    {
      //basic enemy
      for(int i=0; i<rx+ry; i++)
      {
        myObjects.add(new Follower(rx,ry));
      }
      
      //myObjects.add(new Miniboss(rx, ry));
      //myObjects.add(new Boss(rx, ry));
      
    }
    if(roomColor == yellow)
    {
      //advanced enemy
      myObjects.add(new Turret(rx,ry, 200,200));
      myObjects.add(new Turret(rx,ry, 200,height-200));
      myObjects.add(new Turret(rx,ry, width-200,200));
      myObjects.add(new Turret(rx,ry, width-200,height-200));
      
    }
    if(roomColor == green)
    {
      //weapons + potions
      if(rx == 1 && ry == 1)
        myObjects.add(new DroppedItem(width/2,height/2,rx,ry, new AutoRifle()));
      else
      {
        float chance = random(0,100);
        if(chance >= 50)
          myObjects.add(new DroppedItem(width/2,height/2,rx,ry, new SniperRifle()));
        else
          myObjects.add(new DroppedItem(width/2,height/2,rx,ry, new ShotGun()));
          
        //print(chance + "    ");
      }
    }
    if(roomColor == blue)
    {
      //mini bosses
      myObjects.add(new Miniboss(rx, ry));
    }
    if(roomColor == black)
    {
      //space
    }
    
    rx++;
    if(rx == map.width)
    {
      rx = 0;
      ry++;
      
    }
  }
  
  
  //test
  //darkness.add(new Darkness(me.location.x,me.location.y,100));
  //myObjects.add(new Message(new PVector(width/2,height/2), "test"));
}


void draw()
{
  if (mode == INTRO)
  {
    intro();
  }
  if (mode == GAME)
  {
    game();
  }
  if (mode ==  PAUSE)
  {
    pause();
  }
  if (mode == GAMEOVER)
  {
    gameover();
  }
}
