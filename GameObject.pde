class GameObject
{
  
  //instance variables
  int roomX, roomY;
  int lives;
  PVector location;
  PVector velocity;
  int size;
  
  int damage;
  
  
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
