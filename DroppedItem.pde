class DroppedItem extends GameObject
{
  int type;
  Weapon w;
  
  DroppedItem(float x, float  y, int rx, int ry)
  {
    type = GUN;
    w = new ShotGun();
    lives = 1;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    size = 10;
    roomX = rx;
    roomY = ry;
    
  }
  
  void show()
  {
    if(roomX == me.roomX && roomY == me.roomY)
    {
      fill(green);
      circle(location.x, location.y, size*2);
    }
    
  }
  
  void act()
  {
    
    
  }
  
}
