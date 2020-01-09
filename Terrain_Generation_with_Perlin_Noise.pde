//Global Variables
int rows,cols;
int scl = 20;
int w = 2500;
int h = 1600;
float[][] terrain;
float fly = 0;

void setup() {
  size(600,600,P3D);
  cols = w/scl;
  rows = h/scl;
  //frameRate(10);
  terrain = new float[cols][rows];
  
}

void draw() {
  //Flying speed
  fly -= 0.07;
  
  //Move camera down while flying
  float yOff = fly;
  
  for (int y = 0; y < rows; y++)
  {
    float xOff = 0;
    
      for (int x = 0; x < cols; x++)
      {
        //Store z extrusion
        terrain[x][y] = map(noise(xOff,yOff), 0, 1, -50, 50);
        xOff += 0.2; 
      }
    yOff += 0.2;
  } 
  
  
  background(0);
  stroke(255);
  strokeWeight(0.5);
  fill(0,100,255);
  
  //Translate left point to middle
  translate(width/2, height/2);
  //Rotate in X plane
  rotateX(PI/3);
  //Translate to center
  translate(-w/2, -h/2);
  
  for (int y = 0; y < rows-1; y++)
  {
    beginShape(TRIANGLE_STRIP);
      for (int x = 0; x < cols; x++)
      {
        vertex(x*scl, y*scl, terrain[x][y]);
        vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      }
    endShape();
  }
}
