class Miniboss extends Enemy
{
  boolean shield = false;
  int shieldTimer = 0;
  int shotTimer = 0;
  int summonTimer = 0;
  
  Miniboss(int x, int y)
  {
    super(500, 70, x, y, width/2, height/2);
    
    xp = 10;
  }
  
  void show()
  {
    if(shield)
    {
      fill(shieldColor);
      circle(location.x, location.y, size*2);
    }
    
    ghost.show(location.x,location.y, size*2+30, size*2+30);
      //fill(pink);
      
    //strokeWeight(0);
    //circle(location.x, location.y, size*2);
    fill(black); 
    textSize(20);
    text(lives,location.x,location.y);
  }
  
  void act()
  {
    super.act();

    if(lives > 250)  //normal mode
    {
      velocity = new PVector(me.location.x - location.x, me.location.y-location.y);
      velocity.setMag(2);
      
      if(shotTimer > 60)
      {
        PVector aimVector = new PVector(me.location.x  - location.x, me.location.y - location.y);
        aimVector.setMag(5);
        myObjects.add(new EnemyBullet(location,aimVector,red, 5, 10));
 
        shotTimer = 0;
      }
      else
      {
        shotTimer ++;
      }
    }
    
    else  // rage mode
    {
      velocity = new PVector(me.location.x - location.x, me.location.y-location.y);
      velocity.setMag(4);
      
      if(shotTimer > 2)
      {
        PVector aimVector = new PVector(me.location.x  - location.x, me.location.y - location.y);
        aimVector.setMag(10);
        myObjects.add(new EnemyBullet(location,aimVector,red, 5, 10));
 
        shotTimer = 0;
      }
      else
      {
        shotTimer ++;
      }
      
      if(summonTimer > 120)
      {
        float random = random(0,2);
        if(random < 1)
          myObjects.add(new Follower(roomX, roomY));
        else
          myObjects.add(new Turret(roomX, roomY, int(location.x), int(location.y)));
        summonTimer = 0;
      }
      else
      {
        summonTimer ++;
      }
    }
    
    
    if(dist(location.x,location.y,me.location.x,me.location.y) < size + me.size && me.shield == false)
    {
      me.lives -= 15;
      me.shield = true;
      if(shield == false)
      {
        lives -= 10;
        shield = true;
      }
    }
    
    if(shield)
    {
      shieldTimer ++;
      if(shieldTimer == 120)
      {
        shield = false;
        shieldTimer = 0;
      }
      
    }
  }
}
