#define PROCESSING_LIGHT_SHADER

uniform mat4 modelview;
uniform mat4 transform;
uniform mat3 normalMatrix;

uniform vec4 lightPosition;

attribute vec4 vertex;//world
attribute vec4 color;
attribute vec3 normal; //normal of each surface will be  //automatically parsed in

varying vec4 vertColor;

void main() {
  gl_Position = transform * vertex;    
  vec3 ecVertex = vec3( modelview * vertex);  //world coor to eye
  vec3 ecNormal = normalize(normalMatrix * normal);
  //vertex in eye coordinate(0,0,0)
  //convertion needed to change 
  //word coordinate to vertex coordinate
  //normalize means transformation in uni-vector i.e. easyNormal

  vec3 direction = normalize(lightPosition.xyz - ecVertex);    
  //reduction means getting the vector of light source to the //destination

  vec3 ecView = normalize(-ecVertex);

  vec3 h = normalize(direction + ecView);
  float specular = pow(max(dot(h,ecNormal), 0.0), 5.0);
  //shineness coef;

  float ambient = 1.0;
  float intensity = max(0.0, dot(direction, ecNormal));
  //0.0 or a bigger number in dotted product

  
  //vertColor = vec4(intensity, intensity, intensity, 1) * color;
  vertColor = (vec4(intensity, intensity, intensity, 1) + vec4(0, 0, 0, 1) + vec4(0,0, specular,1)) * color;
  //vertColor = vec4(1, 1, 1, 1);
  //vertColor 
  //intensity * color             
}