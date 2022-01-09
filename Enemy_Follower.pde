class Follower extends Enemy
{
  Follower(int x, int y)
  {
    super(100,30,x,y);
    xp = 1;
  }
  
  void show()
  {
    if( roomX == me.roomX && roomY == me.roomY)
    {
      fill(yellow);
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

    velocity = new PVector(me.location.x - location.x, me.location.y-location.y);
    velocity.setMag(3);
    
    if(dist(location.x,location.y,me.location.x,me.location.y) < size + me.size && me.shield == false)
    {
      me.lives -= 15;
      me.shield = true;
      lives = 0;
    }
  }
  
}
