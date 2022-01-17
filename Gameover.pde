

void gameover()
{
  if(me.lives <= 0)
  {
    background(red);
    textSize(100);
    fill(black);
    text("You Lost!!", width/2, height/2);
    textSize(40);
    text("Click To Reset and Restart", width/2, height/2+200);
  }
  else
  {
    //background(green);
    win.show();
    textSize(100);
    fill(green);
    text("Congradulations!", width/2, height/2-150);
    text("You WON!!", width/2, height/2);
    textSize(40);
    text("Click To Reset and Restart", width/2, height/2+200);
  }
}


void gameoverClick()
{
  
  setup();
  mode = INTRO;
}
