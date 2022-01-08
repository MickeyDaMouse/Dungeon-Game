class Miniboss extends Enemy
{
  boolean shield = false;
  int shieldTimer = 0;
  Miniboss(int x, int y)
  {
    super(500, 70, x, y, width/2, height/2);
    xp = 10;
    
  }
  
  void show()
  {
    if(shield)
      fill(blue);
    else
      fill(pink);
    strokeWeight(0);
    circle(location.x, location.y, size*2);
    fill(black); 
    textSize(20);
    text(lives,location.x,location.y);
  }
  
  void act()
  {
    super.act();

    velocity = new PVector(me.location.x - location.x, me.location.y-location.y);
    velocity.setMag(2);
    
    if(dist(location.x,location.y,me.location.x,me.location.y) < size + me.size)
    {
      me.lives -= 15;
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
