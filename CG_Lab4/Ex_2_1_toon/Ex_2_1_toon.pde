PShader toon;

void setup() {
  size(640, 360, P3D);
  noStroke();
  fill(204);

  toon = loadShader("frag.glsl", "vert.glsl");
  toon.set("fraction", 1.0);
}

void draw() {
  shader(toon);
  background(0); 
  float dirY = (mouseY / float(height) - 0.5) * 2;
  float dirX = (mouseX / float(width) - 0.5) * 2;
  directionalLight(204, 204, 204, -dirX, -dirY, -1);
  //camera(0,0,0,width/2,height/2,0,0,1,0);

  /*pushMatrix();
   stroke(255, 255, 150);
   noFill();
   sphere(120);
   popMatrix();*/
  stroke(255);
  strokeWeight(2);
  pushMatrix();
  translate(width/2, height/2, -1);
  sphere(120);
  noStroke();
  strokeWeight(0);
  translate(0,0,1);
  //rotateY(mouseX * PI);
  sphere(120);
  popMatrix();
}

