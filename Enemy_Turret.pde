class Turret extends Enemy
{
  
  int shotTimer;

  
  Turret(int x, int y, int locx, int locy)
  {
    super(100,30,x,y, locx, locy);
    shotTimer = 0;
    
    xp = 1;
  }
  
  void show()
  {
    if( roomX == me.roomX && roomY == me.roomY)
    {
      fill(blue);
      strokeWeight(0);
      circle(location.x,location.y,size*2);
      fill(black);
      textSize(10);
      text(lives,location.x,location.y);
    }
    
  }
  
  void act()
  {
    super.act();
    
    if(shotTimer >= 180)
    {
      PVector aimVector = new PVector(me.location.x  - location.x, me.location.y - location.y);
      aimVector.setMag(8);
      myObjects.add(new EnemyBullet(location,aimVector,blue,20, 15));
 
      shotTimer = 0;
    }
    else
    {
      shotTimer ++;
    }
    
    
  }
  
}
