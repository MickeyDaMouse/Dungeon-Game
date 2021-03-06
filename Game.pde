void game()
{
  drawRoom();
  drawGameObjects();
  drawDarkness();
  drawMap();
  
  heroButton.show();
  
  textSize(30);
  fill(red);
  text("fps: "+int(frameRate),width/2,10);
  
  if(me.lives <= 0)
    mode = GAMEOVER;
}


void drawRoom()
{
  //draw corner
  background(180);
  stroke(0);
  strokeWeight(5);
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
  fill(255);
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
    if(myObj.roomX == me.roomX && myObj.roomY == me.roomY)
    {
      myObj.show();
      myObj.act();
    }
    if (myObj.lives <= 0)
    {
      if(myObj instanceof Enemy)
      {
        float chance = random(0,100);
        if(chance <=10)
        {
          myObjects.add(new DroppedItem(myObj.location.x, myObj.location.y, myObj.roomX, myObj.roomY, 20));
        }
        if(myObj instanceof Miniboss)   
        {
          chance = random(0,100);
          if(chance <= 30)
            myObjects.add(new DroppedItem(myObj.location.x, myObj.location.y, myObj.roomX, myObj.roomY, new Rocket()));
        }
      }
      myObjects.remove(i);
    } else {
      i++;
    }
    
  }
}

void drawDarkness()
{
  while(darkx<=width+darkSize)
  {
    while(darky<=height+darkSize)
    {
      darkness.add(new Darkness(darkx,darky,darkSize));
      //print (darkx + ",   " + darky + ".");
      
      darky += darkSize;
    }
    darky = 0;
    darkx += darkSize;
  }
  
  int i=0;
  while(i<darkness.size())
  {
    darkness.get(i).show();
    i++;
  }
}

void drawMap()
{
  while(mapy<map.height)
  {
    color c = map.get(mapx,mapy);
    if(mapx == me.roomX && mapy == me.roomY)  fill(magenta);
    else  fill(c);
    square(30+mapx*10,30+mapy*10,10);
    mapx++;
    if(mapx >= map.width)
    {
      mapx=0;
      mapy++;
    }
  }
  mapx = 0;
  mapy = 0;
  
}

void gameClick()
{
  if(heroButton.clicked == true)
  {
    mode = PAUSE;
  }
}
