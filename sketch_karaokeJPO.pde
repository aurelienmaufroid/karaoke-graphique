PImage img, images;
int taille, tailleTemps, n=0, x, y, a;

//import sound library
import processing.sound.*;
AudioIn entree;
Amplitude volume;
//SoundFile sample;


void setup(){
  fullScreen();
  //size(1200, 722);
  loadPixels();
  frameRate(15);
  
  //preparation of the sound recording
  entree = new AudioIn(this, 0);
  entree.start();
  volume = new Amplitude(this);
  volume.input(entree);
  //volume.input(sample);
  
  images=loadImage("1.png");
  //Load and play a soundfile and loop it
  //sample = new SoundFile(this, "son01.wav");
  //sample.loop();
  
  
  
  image(images, 0, 0, width, height);
}

void draw(){
  
  //sound analysis
  float niveau = volume.analyze();
  float taille = map(niveau, 0, 1, 1, 200);
  float tailleTemps = map(niveau, 0, 1, 1, 500);
  
  if(int(tailleTemps ) <= 5){
    n = int(random(1, 758));
  }
  
  //print(int(taille) + " ");

  img = loadImage(n+".png");
  img.resize(width, height);
  //image(img, 0, 0);

  img.loadPixels();
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int loc = x + y*img.width;

      // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);

      // Image Processing would go here
      // If we were to change the RGB values, we would do it here,
      // before setting the pixel in the display window.
      // Set the display pixel to the image pixel
      pixels[loc] =  color(img.pixels[loc]*int(taille));
    }
  }
  updatePixels();
  
  //save image
  if(a==15){
    saveFrame("output/sticker###.jpg");
    a=0;
  }else{
    a++;
  }
  
  
}
