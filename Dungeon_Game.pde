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

//movements
boolean up, down, left, right, space;

//gifs
AnimatedGIF introGif;//intro gif

//images
PImage map;
color northRoom, eastRoom, southRoom, westRoom;
int mapx,mapy;

//hero
Hero me;

//game objects
ArrayList<GameObject> myObjects;

//darkness
ArrayList<Darkness> darkness = new ArrayList<Darkness>(1000);
float darkSize =  10;
int darkx = 0, darky = 0;

//buttons
Button introButton;

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
  
  introGif = new AnimatedGIF(56,"frame_","_delay-0.06s.gif");
  
  introButton = new Button(magenta,white,width/2,700,150,100,"Start");
  
  map = loadImage("map.png");
  
  myObjects = new ArrayList<GameObject>();
  
  me = new Hero();
  myObjects.add(me);
  //myObjects.add(new Enemy());
  //myObjects.add(new Follower(1,2));
  //myObjects.add(new Follower(2,1));
  
  //loading  enemies
  rx = 0;
  ry = 0;
  while(ry<map.height)
  {
    color roomColor = map.get(rx,ry);
    if(roomColor == red)
    {
      //basic enemy
      myObjects.add(new Follower(rx,ry));
      
    }
    if(roomColor == yellow)
    {
      //advanced enemy
      
      
    }
    if(roomColor == green)
    {
      //weapons + potions
      myObjects.add(new DroppedItem(width/2,height/2,rx,ry));
    }
    if(roomColor == blue)
    {
      //mini bosses
      
    }
    if(roomColor == black)
    {
      //bosses
      
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
