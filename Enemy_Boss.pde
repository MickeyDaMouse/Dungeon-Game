class Boss extends Enemy
{
  boolean shield = false;
  int shieldTimer = 0;
  int shotTimer = 0;
  int summonTimer = 0;
  int abilityTimer = 0;
  
  Boss(int x, int y)
  {
    super(2500, 100, x, y, width/2, height/2);
    
    xp = 999;
  }
  
  void show()
  {
    if(shield)
      fill(blue);
    else
      fill(red);
      
    if(lives > 2000)
    {
      
    }
    else if(lives > 1000)
    {
      
    }
    else
    {
      
    }
    strokeWeight(0);
    circle(location.x, location.y, size*2);
    fill(black); 
    textSize(30);
    text(lives,location.x,location.y);
  }
  
  void act()
  {
    super.act();

    if(lives > 2000)  //normal mode ==============================================================================================================================================================================================
    {
      velocity = new PVector(me.location.x - location.x, me.location.y-location.y);
      
      if(shield)
        velocity.setMag(0);
      else
        velocity.setMag(2);
      
      if(shotTimer > 30)
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
    
    else if(lives > 1000) // rage mode  ========================================================================================================================================================================================
    {
      velocity = new PVector(me.location.x - location.x, me.location.y-location.y);
      
      if(shield)
        velocity.setMag(0);
      else
        velocity.setMag(4);
      
      //shooting
      if(shotTimer > 2)
      {
        PVector aimVector = new PVector(me.location.x  - location.x, me.location.y - location.y);
        aimVector.setMag(10);
        myObjects.add(new EnemyBullet(location,aimVector,red, 10, 10));
 
        shotTimer = 0;
      }
      else
      {
        shotTimer ++;
      }
      
      //summoning
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
      
      //ability
      if(abilityTimer > 180)
      {
        PVector aimVector = new PVector(width/2 - width/2, 0 - height/2);
        aimVector.setMag(4);
        myObjects.add(new EnemyBullet(location, aimVector, green, 30, 30));
        aimVector = new PVector(width - width/2, 0 - height/2);
        aimVector.setMag(4);
        myObjects.add(new EnemyBullet(location, aimVector, green, 30, 30));
        aimVector = new PVector(width - width/2, height/2 - height/2);
        aimVector.setMag(4);
        myObjects.add(new EnemyBullet(location, aimVector, green, 30, 30));
        aimVector = new PVector(width - width/2, height - height/2);
        aimVector.setMag(4);
        myObjects.add(new EnemyBullet(location, aimVector, green, 30, 30));
        aimVector = new PVector(width/2 - width/2, height - height/2);
        aimVector.setMag(4);
        myObjects.add(new EnemyBullet(location, aimVector, green, 30, 30));
        aimVector = new PVector(0 - width/2, height - height/2);
        aimVector.setMag(4);
        myObjects.add(new EnemyBullet(location, aimVector, green, 30, 30));
        aimVector = new PVector(0 - width/2, height/2 - height/2);
        aimVector.setMag(4);
        myObjects.add(new EnemyBullet(location, aimVector, green, 30, 30));
        aimVector = new PVector(0 - width/2, 0 - height/2);
        aimVector.setMag(4);
        myObjects.add(new EnemyBullet(location, aimVector, green, 30, 30));
        
        abilityTimer = 0;
      }
      else
        abilityTimer++;
    }
    
    else //FINAL MODE =========================================================================================================================================================================================================
    {
      velocity = new PVector(me.location.x - location.x, me.location.y-location.y);
      
      if(shield)
        velocity.setMag(0);
      else
        velocity.setMag(8);
      
      if(shotTimer > 1)
      {
        PVector aimVector = new PVector(me.location.x  - location.x, me.location.y - location.y);
        aimVector.setMag(25);
        myObjects.add(new EnemyBullet(location,aimVector,red, 5, 10));
 
        shotTimer = 0;
      }
      else
      {
        shotTimer ++;
      }
      
      if(summonTimer > 120)
      {
        float random = random(0,50);
        if(random < 20)
          myObjects.add(new Follower(roomX, roomY));
        else if(random < 40)
          myObjects.add(new Turret(roomX, roomY, int(location.x), int(location.y)));
        else
          myObjects.add(new Miniboss(roomX, roomY));
        summonTimer = 0;
      }
      else
      {
        summonTimer ++;
      }
      
      //ability
      if(abilityTimer > 120)
      {
        PVector aimVector = new PVector(width/2 - width/2, 0 - height/2);
        aimVector.setMag(4);
        myObjects.add(new EnemyBullet(location, aimVector, green, 30, 40));
        aimVector = new PVector(width - width/2, 0 - height/2);
        aimVector.setMag(4);
        myObjects.add(new EnemyBullet(location, aimVector, green, 30, 40));
        aimVector = new PVector(width - width/2, height/2 - height/2);
        aimVector.setMag(4);
        myObjects.add(new EnemyBullet(location, aimVector, green, 30, 40));
        aimVector = new PVector(width - width/2, height - height/2);
        aimVector.setMag(4);
        myObjects.add(new EnemyBullet(location, aimVector, green, 30, 40));
        aimVector = new PVector(width/2 - width/2, height - height/2);
        aimVector.setMag(4);
        myObjects.add(new EnemyBullet(location, aimVector, green, 30, 40));
        aimVector = new PVector(0 - width/2, height - height/2);
        aimVector.setMag(4);
        myObjects.add(new EnemyBullet(location, aimVector, green, 30, 40));
        aimVector = new PVector(0 - width/2, height/2 - height/2);
        aimVector.setMag(4);
        myObjects.add(new EnemyBullet(location, aimVector, green, 30, 40));
        aimVector = new PVector(0 - width/2, 0 - height/2);
        aimVector.setMag(4);
        myObjects.add(new EnemyBullet(location, aimVector, green, 30, 40));
        
        abilityTimer = 0;
      }
      else
        abilityTimer++;
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
      if(shieldTimer == 180)
      {
        shield = false;
        shieldTimer = 0;
      }
      
    }
  }
}
