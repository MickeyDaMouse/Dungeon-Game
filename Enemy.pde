class Enemy  extends GameObject
{
  Enemy()
  {
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    size = 30;
    lives = 100;
    roomX = 1;
    roomY = 1;
  }
  
  Enemy(int hp, int s, int x, int y)
  {
    location = new PVector(random(300,width-300),random(300,height-300));
    velocity = new PVector(0,0);
    size = s;
    lives = hp;
    roomX = x;
    roomY = y;
  }
  
  void show()
  {
    if( roomX == me.roomX && roomY == me.roomY)
    {
      fill(green);
      circle(location.x,location.y,size*2);
      fill(black);
      textSize(10);
      text(lives,location.x,location.y);
    }
  }
  
  void act()
  {
    super.act();
    
    int i=0;
    while(i<myObjects.size())
    {
      GameObject obj = myObjects.get(i);
      if(obj instanceof Bullet)
      {
        if(isCollidingWith(obj))
        {
          lives = lives - obj.damage;
          obj.lives = 0;
        }
      }
      
      i++;
    }
    
  }
  
}
