

void pause()
{
  noStroke();
  fill(pink);
  rect(width/2,height/2,600,600);
  
  pauseButton.show();
  hpButton.show();
  speedButton.show();
  damageButton.show();
  
  stroke(5);
  textSize(40);
  fill(black);
  text("You Have " + me.xp + "XP", width/2-50,200);
  text("MaxHP: " + me.maxLives, hpButton.x + 200, hpButton.y);
  text("Speed: " + me.speedMultiplier + "x", speedButton.x + 200, speedButton.y);
  text("Damage: " + me.damageMultiplier + "x", damageButton.x + 200, damageButton.y);
  
  manDOWN.show(width/2+200,height/2 - 100,150,375);
  
}


void pauseClick()
{
  if(pauseButton.clicked == true)
  {
    mode = GAME;
  }
  if(hpButton.clicked == true)
  {
    if(me.xp > 0)
    {
      me.xp--;
      me.maxLives += 50;
      me.lives += 50;
      
    }
  }
  if(speedButton.clicked == true)
  {
    if(me.xp > 0)
    {
      me.xp--;
      me.speedMultiplier += 0.1;
      
    }
  }
  if(damageButton.clicked == true)
  {
    if(me.xp > 0)
    {
      me.xp--;
      me.damageMultiplier += 0.1;
      
    }
  }
  
}
