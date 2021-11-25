class Particle extends GameObject
{
  PVector location;
  PVector velocity;
  color c;
  int amount;
  int distance;
  
  Particle(PVector loc, color cc, int size)
  {
    location = loc;
    c = cc;
    amount = size/3;
    distance = size;
    velocity = new PVector(10,10);
    velocity.setMag(distance/10);
  }
  
  void show()
  {
    fill(c);
    circle(location.x,location.y,3);
    
  }
  
  void act()
  {
    
    
  }
}
