import saito.objloader.*;

OBJModel model, hand ;

float rotX, rotY;

void setup()
{
  size(800, 600, P3D);
  frameRate(30);
  model = new OBJModel(this, "doll4.obj", "absolute", TRIANGLE_FAN);
  model.enableDebug();

  hand = new OBJModel(this, "hand3.obj", "absolute", TRIANGLE_FAN);
  hand.enableDebug();

  model.scale(0.04);
  model.translateToCenter();

  hand.scale(9);
  hand.translateToCenter();

  pointLight(255, 128, 128, width /2, height, 200);

  stroke(255);
  noStroke();
}

void draw()
{
  background(129);
  //  lights();
  pointLight(255, 128, 128, width /4, height, 200);
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(rotY);
  rotateY(rotX);

  pushMatrix();
  hand.translateToCenter();

  rotateY(radians(-90));
  hand.translate(new PVector(-215, -70 + frameCount % 10 - 5, -83));    
  hand.draw();
  popMatrix();

  model.draw();

  popMatrix();
}

void mouseDragged()
{
  rotX += (mouseX - pmouseX) * 0.01;
  rotY -= (mouseY - pmouseY) * 0.01;
}

boolean bTexture = true;
boolean bStroke = false;

void keyPressed()
{
  if (key == 't') {
    if (!bTexture) {
      model.enableTexture();
      bTexture = true;
    } 
    else {
      model.disableTexture();
      bTexture = false;
    }
  }

  if (key == 's') {
    if (!bStroke) {
      stroke(255);
      bStroke = true;
    } 
    else {
      noStroke();
      bStroke = false;
    }
  }

  else if (key=='1')
    model.shapeMode(POINTS);
  else if (key=='2')
    model.shapeMode(LINES);
  else if (key=='3')
    model.shapeMode(TRIANGLES);
  else if (key=='4')
    model.shapeMode(TRIANGLE_FAN);
}


