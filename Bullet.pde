class Bullet extends GameObject
{
  int timer;
  PVector nudge;
  color bc;
  
  Bullet(PVector aim, color c, int s, int t, int d)
  {
    timer = t;
    lives = 1;
    velocity = aim;
    location = me.location.copy();
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
