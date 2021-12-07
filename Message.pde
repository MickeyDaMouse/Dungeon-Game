class Message extends GameObject
{
  String txt;
  int timer;
  
  Message(PVector loc, String t, int rx, int ry)
  {
    timer = 0;
    
    location = loc;
    txt  = t;
    roomX = rx;
    roomY = ry;
    lives = 1;
    
    velocity = new PVector(0,-1);
  }
  
  void show()
  {    
    textSize(20);
    fill(black);
    text(txt,location.x,location.y);
    
  }
  
  void act()
  {
    super.act();
    
    if(timer < 120)
    {
      timer ++;
    }
    else
    {
      lives = 0;
    }
  }
  
  
  
  
  
  
  
}
