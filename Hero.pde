class Hero extends GameObject
{

  float speed;
  int maxLives;
  int xp;
  float speedMultiplier;
  float damageMultiplier;
  boolean shield;
  int shieldTimer;
   
  AnimatedGIF currentAction;


  Hero()
  {
    super();
    size = 40;
    speed = 5;
    roomX = 1;
    roomY = 1;
    location = new PVector(width/2,height/2);
    
    lives = 150;
    
    //character upgrades
    xp = 0;
    maxLives = 150;
    speedMultiplier = 1.0;
    damageMultiplier = 1.0;
    
    shield = false;
    
    myWeapon = new Rocket();
    
    currentAction = manDOWN;
  }


  void show()
  {
    
    //fill(magenta);
    //noStroke();
    //circle(location.x, location.y, size*2);
    
    if(shield)
    {
      fill(blue);
      circle(location.x, location.y, size*2);
    }
    
    currentAction.show(location.x,location.y,size,size*2);
    
    //fill(black);
    //textSize(10);
    //text(lives,location.x,location.y);
    
    noStroke();
    fill(127,255,0);
    rectMode(CORNER);
    
    //health bar
    float w = map(lives,0,maxLives,0,50);
    rect(location.x-25,location.y-(size+5),w,10);
    fill(red);
    rect(location.x-25+w,location.y-(size+5),50-w,10);
    
    //health
    textSize(12);
    fill(red);
    text(lives+"/"+maxLives,location.x,location.y-55);
  }

  void act()
  {
    super.act();
    
    //set to max live
    if(lives > maxLives)
    {
      lives = maxLives;
    }
    
    myWeapon.update();
    if(space) myWeapon.shoot();

  //moving
    if (up)
    {
      if (location.y>100+size)  velocity.y = -speed*speedMultiplier;
      else  velocity.y = 0;
    }
    if (down)
    {
      if (location.y<800-size)  velocity.y = speed*speedMultiplier;
      else velocity.y = 0;
    }
    if (left)
    {
      if (location.x>100+size)  velocity.x = -speed*speedMultiplier;
      else velocity.x = 0;
    }
    if (right)
    {
      if (location.x<800-size)  velocity.x = speed*speedMultiplier;
      else  velocity.x = 0;
    }
    if (velocity.mag() > speed*speedMultiplier)  velocity.setMag(speed*speedMultiplier);    
    if (!up && !down) velocity.y = velocity.y*0.8;
    if (!left && !right) velocity.x = velocity.x*0.8;
    
    //check action gif
    if(abs(velocity.y) >= abs(velocity.x))
    {
      if(velocity.y>=0)  currentAction = manDOWN;
      else  currentAction = manUP;
    }
    else
    {
      if(velocity.x > 0)  currentAction = manRIGHT;
      else  currentAction = manLEFT;
      
    }

    //check exits
    //north/up
    if (northRoom != #FFFFFF && location.y <= 100+size && location.x >= width/2-50 && location.x <= width/2+50)
    {
      roomY--;
      location = new PVector(width/2, height-(101+size));
    }
    //east/right
    if (eastRoom != #FFFFFF && location.x >= width-(100+size) && location.y  >= height/2-50 && location.y <= height/2+50)
    {
      roomX++;
      location = new PVector(101+size, height/2);
    }
    //south/down
    if (southRoom != #FFFFFF && location.y >= height-(100+size) && location.x  >= width/2-50 && location.x <= width/2+50)
    {
      roomY++;
      location = new PVector(width/2, 101+size);
    }
    //west/left
    if (westRoom != #FFFFFF && location.x <= 100+size && location.y  >= height/2-50 && location.y <= height/2+50)
    {
      roomX--;
      location = new PVector(width-(101+size), height/2);
    }
    
    //checking collisions
    int i=0;
    while(i<myObjects.size())
    {
      GameObject myObj = myObjects.get(i);
      if(myObj instanceof EnemyBullet && isCollidingWith(myObj))
      {
        if(shield == false)
        {
          lives -= myObj.damage;
          shield  = true;
          myObj.lives = 0;
        }
        
      }
      if(myObj instanceof DroppedItem && isCollidingWith(myObj))
      {
        DroppedItem item = (DroppedItem) myObj;
        if(item.type == GUN)
        {
          myWeapon = item.w;
          item.lives = 0;
        }
        if(item.type == HEALING)
        {
          lives += item.heal;
          if(lives >= maxLives)
            lives = maxLives;
          item.lives = 0;
        }
        
      }
      
      i++;
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
    
    if(me.lives <= 0)
    {
      mode = GAMEOVER;
    }
    
  }
}
