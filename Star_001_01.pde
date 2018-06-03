// Rupert Russell
// 3 June 2018
// Draw a 12 Pointed star design
// Based on the 10 Pointed star https://github.com/rupertrussell/Islamic_003

float xCenter = 400;
float yCenter = 400;

float scale = 770;

float[] outerX; // store xPoints for the 10 points on the outer circle
float[] outerY; // store yPoints for the 10 points on the outer circle

float[] innerX;
float[] innerY;

float[] innerMostX;
float[] innerMostY;

void setup() {
  size(800, 800); // width x height

  noFill();
  rectMode(CENTER);
  ellipseMode(CENTER);

  outerX = new float[10]; // store x Points for the 10 points on the outer circle
  outerY = new float[10]; // store y Points for the 10 points on the outer circle

  innerX = new float[360]; // store x Points for the 10 points on the outer circle
  innerY = new float[360]; // store y Points for the 10 points on the outer circle

  innerMostX = new float[360]; // store x Points for the 10 points on the outer circle
  innerMostY = new float[360]; // store y Points for the 10 points on the outer circle
  noLoop();
}

void draw() {
  strokeJoin(MITER);
  //  strokeCap(PROJECT);
  background(255);
  translate(xCenter, yCenter);
  calculateNPoints(10, 0.5);

  float innerScale = 0.589;
  calculateNinnerPoints(80, innerScale /2);

  float innerMost = 0.171; 
  calculateNinnerMostPoints(20, innerMost /2);
  drawStar();
}


void calculateNPoints(float numPoints, float scaleFactor) {
  // calculate and store n points around the outer circle
  int counter = 0;
  double step = radians(360/numPoints); 
  float h = 0; 
  float k = 0;
  float r =  scale * scaleFactor ;
  for (float theta=0; theta < 2 * PI; theta += step) {
    float x = h + r * cos(theta);
    float y = k - r * sin(theta); 

    // store the calculated coordinates
    outerX[counter] = x;
    outerY[counter] = y;
    counter ++;
  }
} // end  calculateNPoints


void calculateNinnerPoints(float numPoints, float scaleFactor) {
  // calculate and store n points around the outer circle
  int counter = 0;
  double step = radians(360/numPoints); 
  float h = 0; 
  float k = 0;
  float r =  scale * scaleFactor ;
  for (float theta=0; theta < 2 * PI; theta += step) {
    float x = h + r * cos(theta);
    float y = k - r * sin(theta); 

    // store the calculated coordinates
    innerX[counter] = x;
    innerY[counter] = y;
    counter ++;
  }
} // end  calculateNinnerPoints


void calculateNinnerMostPoints(float numPoints, float scaleFactor) {
  // calculate and store n points around the outer circle
  int counter = 0;
  double step = radians(360/numPoints); 
  float h = 0; 
  float k = 0;
  float r =  scale * scaleFactor ;
  for (float theta=0; theta < 2 * PI; theta += step) {
    float x = h + r * cos(theta);
    float y = k - r * sin(theta); 

    // store the calculated coordinates
    innerMostX[counter] = x;
    innerMostY[counter] = y;
    counter ++;
  }
} // end  calculateNinnerMostPoints

void drawStar() {
  for (int count = 0; count < 6; count ++) {
    drawLines();
    rotate(radians(30));
  }
} // end drawStar


void mousePressed() {
  scale = 100; // scale of bounding square
}

void mouseReleased() {
  scale = 770; // scale of bounding square
}

void drawLines() {

  strokeWeight(3);
  stroke(0);
  line(outerX[5], outerY[5], innerX[51], innerY[51]);
  line(outerX[5], outerY[5], innerX[29], innerY[29]);

  line(outerX[0], outerY[0], innerX[69], innerY[69]);
  line(outerX[0], outerY[0], innerX[11], innerY[11]);

  line(innerX[51], innerY[51], innerMostX[15], innerMostY[15]);
  line(innerX[29], innerY[29], innerMostX[5], innerMostY[5]);

  line(innerX[69], innerY[69], innerMostX[15], innerMostY[15]);
  line(innerX[11], innerY[11], innerMostX[5], innerMostY[5]);
  stroke(100);
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    save("Star_001_01.png"); 
    exit();
  }
}
