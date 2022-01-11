class DroppedItem extends GameObject
{
  int type;
  Weapon w;
  int heal;
  
  
  DroppedItem(float x, float  y, int rx, int ry, Weapon gun)
  {
    type = GUN;
    heal = 0;
    
    w = gun;

    lives = 1;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    size = 50;
    roomX = rx;
    roomY = ry;
    
  }
  
  DroppedItem(float x, float y, int rx, int ry, int h)
  {
    type = HEALING;
    w = myWeapon;
    heal = h;
    
    lives = 1;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    size = 20;
    roomX = rx;
    roomY = ry;
  }
  
  void show()
  {
    if(roomX == me.roomX && roomY == me.roomY)
    {
      fill(green);
      strokeWeight(0);
      circle(location.x, location.y, size*2);
    }
    
  }
  
  void act()
  {
    
    
  }
  
}
