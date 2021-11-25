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
  
  boolean isCollidingWith (GameObject myObj)
  {
    float d = dist(myObj.location.x, myObj.location.y, location.x, location.y);
    if(inRoomWith(myObj) && d < size + myObj.size)
      return true;
    else
      return false;
    
  }
  
  boolean inRoomWith(GameObject myObj)
  {
    if(roomX == myObj.roomX && roomY == myObj.roomY)
      return true;
    else
      return false;
    
  }
}
