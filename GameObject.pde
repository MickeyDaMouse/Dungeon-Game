class GameObject
{
  
  //instance variables
  int lives;
  PVector location;
  PVector velocity;
  int size;
  
  
  //constructor
  GameObject()
  {
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    lives = 1;
  }
  
  void show()
  {
    
  }
  
  void act()
  {
    location.add(velocity);
    
  }
  
}
