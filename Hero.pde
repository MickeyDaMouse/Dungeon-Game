class Hero extends GameObject
{

  float speed;
  AnimatedGIF currentAction;


  Hero()
  {
    super();
    size = 20;
    speed = 5;
    roomX = 1;
    roomY = 1;
    location = new PVector(width/2,height/2);
    
    lives = 100;
    
    myWeapon = new AutoRifle();
    
    currentAction = manDOWN;
  }


  void show()
  {
    /*
    fill(magenta);
    noStroke();
    circle(location.x, location.y, size*2);
    */
    
    currentAction.show(location.x,location.y,size/0.6,size*4);
    
    fill(black);
    textSize(10);
    text(lives,location.x,location.y);
  }

  void act()
  {
    super.act();
    
    myWeapon.update();
    if(space) myWeapon.shoot();

    if (up)
    {
      if (location.y>100+size)  velocity.y = -speed;
      else  velocity.y = 0;
    }
    if (down)
    {
      if (location.y<800-size)  velocity.y = speed;
      else velocity.y = 0;
    }
    if (left)
    {
      if (location.x>100+size)  velocity.x = -speed;
      else velocity.x = 0;
    }
    if (right)
    {
      if (location.x<800-size)  velocity.x = speed;
      else  velocity.x = 0;
    }
    if (velocity.mag() > speed)  velocity.setMag(speed);    
    if (!up && !down) velocity.y = velocity.y*0.8;
    if (!left && !right) velocity.x = velocity.x*0.8;
    
    //check action gif
    if(abs(velocity.y) > abs(velocity.x))
    {
      if(velocity.y>0)  currentAction = manDOWN;
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
      location = new PVector(width/2, height-(110+size));
    }
    //east/right
    if (eastRoom != #FFFFFF && location.x >= width-(100+size) && location.y  >= height/2-50 && location.y <= height/2+50)
    {
      roomX++;
      location = new PVector(110+size, height/2);
    }
    //south/down
    if (southRoom != #FFFFFF && location.y >= height-(100+size) && location.x  >= width/2-50 && location.x <= width/2+50)
    {
      roomY++;
      location = new PVector(width/2, 110+size);
    }
    //west/left
    if (westRoom != #FFFFFF && location.x <= 100+size && location.y  >= height/2-50 && location.y <= height/2+50)
    {
      roomX--;
      location = new PVector(width-(110+size), height/2);
    }
    
    //checking collisions
    int i=0;
    while(i<myObjects.size())
    {
      GameObject myObj = myObjects.get(i);
      if(myObj instanceof EnemyBullet && isCollidingWith(myObj))
      {
        lives -= myObj.damage;
        myObj.lives = 0;
      }
      if(myObj instanceof DroppedItem && isCollidingWith(myObj))
      {
        DroppedItem item = (DroppedItem) myObj;
        if(item.type == GUN)
        {
          myWeapon = item.w;
          item.lives = 0;
        }
        
      }
      
      i++;
    }
  }
}
