class AnimatedGIF
{
  //instance variables
  int numFrames;
  PImage[] images;
  int currentFrame;
  
  //constructors
  AnimatedGIF(int nf, String pre, String post)
  {
    numFrames = nf;
    images = new PImage[numFrames];
    int i=0;
    while(i<numFrames)
    {
      if(i<10)    images[i] = loadImage(pre+"0"+i+post);
      if(i>=10 && i<100)    images[i] = loadImage(pre+i+post);
      i++;
    }
    currentFrame = 0;
    
  }
  
  //behaviour functions
  void show()
  {
    image(images[currentFrame],0,0,width,height);
    currentFrame++;
    if(currentFrame == numFrames)  currentFrame = 0;
  }
  
}
