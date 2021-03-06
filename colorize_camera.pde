


//video objects
PGraphics buffer;
CameraCapture cam;
PixelBlockArray pixel_blocks;

//audio objects
Minim minim = new Minim( this );
AudioOutput out = minim.getLineOut();
int [] scaleR = {0, 4, 7, 11};
int [] scaleG = {2, 6, 9};
int [] scaleB = {0, 2, 4, 6, 7, 9, 11}; 

BleeperBlooper red = new BleeperBlooper(.5, 0, scaleR, 0.25);
BleeperBlooper green = new BleeperBlooper(.25, 0, scaleG, 0.25);
BleeperBlooper blue = new BleeperBlooper(0, 0, scaleB, 0.25);


void setup() {
//  frameRate();
  size(640, 480); 
  buffer = createGraphics(width, height);
  cam = new CameraCapture(this);
  pixel_blocks = new PixelBlockArray(width / 4, height / 4);
}

void draw() {
  background(255);
  cam.read();
  buffer.set(0, 0, cam.toImage());
  set(0, 0, cam.toImage());
  pixel_blocks.display();
}

void stop()
{
  // always close Minim audio classes when you are finished with them
  out.close();
  minim.stop();
 
  super.stop();
}

