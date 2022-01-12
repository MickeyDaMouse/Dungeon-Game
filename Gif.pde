class AnimatedGIF
{
  //instance variables
  int numFrames;
  PImage[] images;
  int currentFrame;
  int rate;
  
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
    rate = 1;
  }
  
  AnimatedGIF(int n, int r, String prefix, String suffix)
  {
    numFrames = n;
    images = new PImage[numFrames];
    int i=0;
    while(i<numFrames)
    {
      if(i<10)    images[i] = loadImage(prefix+"0"+i+suffix);
      if(i>=10 && i<100)    images[i] = loadImage(prefix+i+suffix);
      i++;
    }
    currentFrame = 0;
    rate = r;
  }
  
  //behaviour functions
  void show()
  {
    image(images[currentFrame],width/2,height/2,width,height);
    currentFrame++;
    if(currentFrame == numFrames)  currentFrame = 0;
  }
  
  void show(float x, float y, float w, float h)
  {
    pushMatrix();
    
    imageMode(CENTER);
    if(currentFrame >= images.length) currentFrame = 0;
    image(images[currentFrame], x, y, w, h);
    if(frameCount % rate == 0) currentFrame ++;
    
    popMatrix();
    
  }
  
}
