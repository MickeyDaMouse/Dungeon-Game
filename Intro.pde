

void intro()
{
  introGif.show();
  introButton.show();
}

void introClick()
{
  if(introButton.clicked)  mode = GAME;
}
