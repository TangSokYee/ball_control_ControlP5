import controlP5.*; //<>// //<>//
ControlP5 cp5;

float x;
float y;
float easing = 0.05;
int frame = 0;

int Slider;
int Slider2;

float angle;
float angle2;

color circle = color(87);

boolean visible;

boolean Toggle;

Textlabel myTextA;
Textlabel myTextB;

void setup() {
  size(640, 360); 
  noStroke();

  cp5 = new ControlP5(this);
  cp5.addSlider("Slider").setPosition(20,20).setSize(200,20); //slider is created
  cp5.addButton("Button").setValue(0).setPosition(20,60).setSize(100,40); //button is created
  
  cp5.addSlider("Slider2").setPosition(20,20).setSize(200, 20).moveTo("Page2"); //second tab is created
  
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {visible = true;}}, '1'); //for new ellipse to appear
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {visible = false;}},'2'); //for new ellipse to disappear
  
  cp5.addToggle("Toggle").setPosition(20,120).setSize(50,20); //toggle is created
  
  myTextA = new Textlabel(cp5,"NEVER STOPS",410,320,400,200).setFont(createFont("Arial",20));
  //myTextA = cp5.addTextlabel("label").setText("NEVER STOPS").setPosition(410,320).setColorValue(#AFA796).setFont(createFont("Arial",20)); //text is created (UI)
  myTextB = new Textlabel(cp5,"DREAM",100,100,400,200).setFont(createFont("Arial",50));

}




void draw() { 
  myTextA.draw(this);
  myTextB.draw(this);
  
  println(mouseX,mouseY);
  
  float targetX = mouseX;
  float dx = targetX - x; 
  x += dx * easing; //moving with mouseX with distance
  
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing; //moving with mouseY with distance
  
  
if (mouseX > 320) { //position of mouseX
    background(51); 
  } else {
    background(#B4B6B9);
  }
  
  
if (mousePressed == true) { // If the mouse is pressed
   if (mouseButton == LEFT) { //mouse left click
     background(#486467);
     cursor(HAND); //draw cursor as hand
  } else if (mouseButton == RIGHT) { //mouse right click
     background(#474F64);
     cursor(CROSS); //draw cursor as cross
  }  
  
}


if (frame > 10800) { //if frame is more than 3 min
   noLoop();  
 } else { //otherwise
   fill(#AFA796); 
   ellipse(x/2, y, 80, 80); //first appeared ball
 }  
   frame++; 
 
 
if (keyPressed == false) { // If the key is not pressed
     float r = random (255);  //color changed randomly
   if (keyCode == UP) { //when users press 'up',function is happening
     fill(#AA8D8D);
     ellipse(x/1.5, y, 66, 66); //third ball
     fill(#AF8473); 
     ellipse(x, y, 33, 33); //second ball
     fill(#B4B6B9);  
     text("DREAM", 230,340 ); //text "dream"
     fill(51);
     myTextA.draw(this); //text "never stops"
  } else if (keyCode == DOWN) { //when users press'down',function is happening
     fill(#718093); //color changed
     ellipse(x/2, y, 80, 80);// first appeared ball 
     fill(200); //color changed
     ellipse(x, y, 66, 66); //second ball
     fill(150); //color changed
     ellipse(x/1.5, y, 33, 33); //third ball
     fill(#7A9391); //color changed
     ellipse(x/1.5, y/2, 33, 33); //forth ball
     fill(#6E7683); //color changed
     ellipse(x/1.5, y/1.5, 66, 66); //5th ball
     fill(r);  //color changed randomly
     ellipse(x/2, y/1.5, 66, 66); //5th ball
     fill(51);
     text("DREAM", 230,340); //text "dream"
     fill(51);
     myTextA.draw(this); //text "never stops"
 } else { //when keys are pressed other than key "up" and "down"
     angle --; //anticlockwise
     angle2 ++; //clockwise
 }
}
 
       
   for (int i=0; i<20; i++) { //slider1 (UI)
     pushMatrix();
     angle = angle + Slider; //when click on slider, angle happens
     float c = angle; 
     translate(320, 180); //move from 0 to 320; move from 80 to 260
     rotate(c); //rotate according to angle
     fill(#AFA796); //color same as first appeared ball
     ellipse(0, 80, 400, 4); //line ends round 
     popMatrix();
  }
   for (int i=0; i<20; i++) { //slider2 (UI)
     
     pushMatrix();
     angle2 = angle2 + Slider2; //when click on slider2, angle happens
     float d = angle2; 
     translate(320, 180); //move from 0 to 320; move from 80 to 260
     rotate(d); //rotate according to angle
     fill(#CECCCC); //lightgrey
     ellipse(0, 80, 200, 4); //line ends round 
     popMatrix();
  }

   
   fill(cp5.isMouseOver(cp5.getController("Button")) ? circle:color(155)); // when mouse over(UI) on "button", colour change from light grey to dark grey
   ellipse(320, 180, 80, 80);
   

   if (visible){ //when key "1"(UI) is pressed, this function is happening 
     fill(50); //dark grey
     ellipse(320,180,50,50); //new ellipse
}

   if (Toggle){ //when toggle(UI) is pressed,this function is happening
     fill(210,210,191); 
     ellipse(320,180,40,40); //second new ellipse 
   }  
 }