//detecting keyoard actions
void  keyPressed()
{
  if (key == 'w') up =  true;
  if (key == 's') down = true; 
  if (key == 'a') left = true;
  if (key == 'd') right = true;
  if (keyCode == ' ')  space = true;
}

void keyReleased()
{
  if (key == 'w') up = false;
  if (key == 's') down = false;
  if (key == 'a') left = false;
  if (key == 'd') right = false;
  if (key == ' ')  space = false;
}


//detecting mouse 
void mouseReleased()
{
  if (mode == INTRO)
  {
    introClick();
  } else if (mode == GAME)
  {
    gameClick();
  } else if (mode == PAUSE)
  {
    pauseClick();
  } else if (mode == GAMEOVER)
  {
    gameoverClick();
  }
}
