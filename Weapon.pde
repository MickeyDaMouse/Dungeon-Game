class Weapon
{
  
  int shotTimer;
  int threshold;
  int bulletSpeed;
  int flyDistance;
  
  Weapon()
  {
    shotTimer = 0;
    threshold = 30;
    bulletSpeed = 5;
    flyDistance = 500;
  }
  
  Weapon(int thr, int bs, int fd)
  {
    shotTimer =  0;
    threshold = thr;
    bulletSpeed = bs;
    flyDistance = fd;
  }
  
  void update()
  {
    shotTimer ++;
    
  }
  
  void shoot()
  {
    if(shotTimer >= threshold)
    {
      PVector aimVector = new PVector(mouseX - me.location.x, mouseY - me.location.y);
      aimVector.setMag(bulletSpeed);
      myObjects.add(new Bullet(aimVector,red,10, flyDistance));
      shotTimer = 0;
    }
    
  }
  
}
