void game()
{
  drawRoom();
  drawGameObjects();
  
  
}


void drawRoom()
{
  //draw corner
  background(180);
  stroke(0);
  //strokeWeight(5);
  line(0, 0, width, height);
  line(width, 0, 0, height);
  
  //draw exits
  northRoom = map.get(me.roomX,me.roomY-1);
  eastRoom = map.get(me.roomX+1,me.roomY);
  southRoom = map.get(me.roomX,me.roomY+1);
  westRoom = map.get(me.roomX-1,me.roomY);
  
  noStroke();
  fill(black);
  if(northRoom != #FFFFFF)  ellipse(width/2, 100,100,100);
  if(eastRoom != #FFFFFF)  ellipse(width-100,height/2,100,100);
  if(southRoom != #FFFFFF)  ellipse(width/2,height-100,100,100);
  if(westRoom != #FFFFFF)   ellipse(100,height/2,100,100);

  //draw room
  fill(210);
  stroke(0);
  strokeWeight(5);
  rectMode(CENTER);
  rect(width/2, height/2, 700, 700);
  

}

void drawGameObjects()
{
  int i=0;
  while (i<myObjects.size())
  {
    GameObject myObj = myObjects.get(i);
    myObj.show();
    myObj.act();


    if (myObj.lives <= 0)
    {
      myObjects.remove(i);
    } else {
      i++;
    }
  }
}

void drawMap()
{
  
}

void gameClick()
{
}
