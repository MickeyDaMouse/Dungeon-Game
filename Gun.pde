class  SniperRifle extends Weapon
{
  SniperRifle()
  {
    super(100,20,300,30);
  }
  
}

class AutoRifle extends Weapon
{
  AutoRifle()
  {
    super(10,5,80,5);
  }
  
}

class ShotGun extends Weapon
{
  ShotGun()
  {
    super(80,3,50,5);
  }
}

class Rocket extends Weapon
{
  Rocket()
  {
    super(50, 1, 1000, 50);
  }
  
}
