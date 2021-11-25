class EnemyBullet extends GameObject
{
  int timer;
  PVector nudge;
  color bc;
  
  EnemyBullet(PVector loc, PVector aim, color c, int s, int d)
  {
    lives = 1;
    velocity = aim;
    location = loc.copy();
    bc = c;
    size = s;
    damage = d;
    
    roomX = me.roomX;
    roomY = me.roomY;
    
  }
  
  void show()
  {
    noStroke();
    fill(bc);
    circle(location.x,location.y,size*2);
    
  }
  
  void act()
  {
    super.act();
    
    if(location.x<100+size/2 || location.x > width-(100+size/2) || location.y < 100+size/2 || location.y > height-(100+size/2))  
    {
      lives = 0;
    }
    
    timer --;
    if(timer == 0)
    {
      lives = 0;
      
    }
    
  }
  
}
