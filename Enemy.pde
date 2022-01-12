class Enemy  extends GameObject
{
  
  int xp;
  
  Enemy(int hp, int s, int x, int y,int locx, int locy)
  {
    location = new PVector(locx, locy);
    velocity = new PVector(0,0);
    size = s;
    lives = hp;
    roomX = x;
    roomY = y;
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
    
    int i=0;
    while(i<myObjects.size())
    {
      GameObject obj = myObjects.get(i);
      if(obj instanceof Bullet)
      {
        
        if(isCollidingWith(obj))
        {
          if(myWeapon instanceof Rocket)
          {
            image(explode, width/2, height/2, width, height);
            int j=0;
            while(j<myObjects.size())
            {
              GameObject o = myObjects.get(j);
              if(o instanceof Enemy && o.roomX == me.roomX && o.roomY == me.roomY)
              {
                o.lives -= 15*me.damageMultiplier;
              }
              j++;
            }
          }
          
          lives = lives - obj.damage;
          obj.lives = 0;
          if(lives <= 0)
          {
            if(boss.lives <= 0)
            {
              mode = GAMEOVER;
            }
            
          }
          
         
        }
      }
      
      i++;
    }
    
    if(lives <= 0)
    {
      myObjects.add(new Message(location, "+" + xp, roomX, roomY));
      me.xp += xp;
    }
    
    
  }
  
}
