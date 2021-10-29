class Button
{
  //instance  variables
  boolean clicked;
  String txt;
  color fill, text;
  float x, y, w, h;


  //constructor
  Button(color f, color tt, float xx, float yy, float ww, float hh, String t)
  {
    txt = t;
    fill = f;
    text = tt;
    x = xx;
    y = yy;
    w =  ww;
    h =  hh;
  }

  void show()
  {
    strokeWeight(10);
    rectMode(CENTER);
    textAlign(CENTER,CENTER);
    if (mouseX>x-w/2&&mouseX<x+w/2&&mouseY>y-h/2&&mouseY<y+h/2)
    {
      stroke(text);
    } else
    {
      stroke(fill);
    }
    fill(fill);
    rect(x, y, w, h);
    textSize(40);
    fill(text);
    text(txt, x, y);

    if (mousePressed)
    {
      if (mouseX>x-w/2&&mouseX<x+w/2&&mouseY>y-h/2&&mouseY<y+h/2)  clicked = true;
    }
    else
    {
      clicked = false;
    }
  }
}
