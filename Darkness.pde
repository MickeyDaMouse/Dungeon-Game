class Darkness
{
  float opacity;
  float x,y,size;
  
  Darkness(float xx, float yy, float s)
  {
    size = s;
    x = xx;
    y = yy;
    opacity = 0;
  }
  
  void show()
  {
    float d = dist(x,y,me.location.x,me.location.y);
    opacity = map(d,0,200,0,100);
    fill(black, opacity);
    noStroke();
    square(x,y,size);
    
  }
  
}
