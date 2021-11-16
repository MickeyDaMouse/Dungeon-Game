class Weapon
{
  
  int shotTimer;
  int threshold;
  int bulletSpeed;
  int flyDistance;
  int damage;
  
  Weapon()
  {
    shotTimer = 0;
    threshold = 30;
    bulletSpeed = 5;
    flyDistance = 500;
  }
  
  Weapon(int thr, int bs, int fd, int d)
  {
    shotTimer =  0;
    threshold = thr;
    bulletSpeed = bs;
    flyDistance = fd;
    damage = d;
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
      myObjects.add(new Bullet(aimVector,red,5, flyDistance, damage));
      shotTimer = 0;
    }
    
  }
  
}
