float getMouseX(){
  return float(mouseX) / width;
}

float getMouseY(){
  return float(mouseY) / height;
}

class Node {
  float x_coor, y_coor;
  color fillColor = color(0, 0, 255);
  color highlight = color(0, 0, 0);
  Node(float x, float y){
    this.x_coor = x;
    this.y_coor = y;
  }
  void draw(){
    stroke(highlight);
    fill(fillColor);
    ellipse(x_coor * width, y_coor * height, r/2 * width, r/2 * height);
  }
  void update(){
    if (this.mouseOver()){
      highlight = color(0, 255, 0);
    }
    else {
      highlight = color(0, 0, 0);
    }
  }
  boolean mouseOver(){
    float mX = getMouseX();
    float mY = getMouseY();
    return r/2 > sqrt(pow(mX - x_coor,2) + pow(mY - y_coor,2));
    //return mX > x_coor - r/2 && mX < x_coor + r/2 && mY > y_coor - r/2 && mY < y_coor + r/2;
  }
}

class startNode extends Node {
  startNode(float x, float y){
    super(x, y);
    this.fillColor = color(255, 0, 0);
  }
}

class Button {
  float x_coor, y_coor, len, hei;
  String label;
  Button(String lab, float x, float y, float l, float h){
    label = lab;
    x_coor = width * x;
    y_coor = height * y;
    len = l;
    hei = h;
  }
  void draw(){
    if (this.mouseOver()){fill(150,150,150);}
    else {fill(100,100,100);}
    rect(x_coor, y_coor, len, hei);
    textSize(hei * 4/5);
    fill(255, 255, 255);
    text(label, x_coor + len * 1/10, y_coor + hei * 1/10);
  }
  boolean mouseOver(){
    return mouseX / width > x_coor && mouseX / width < x_coor + len && mouseY / height > y_coor && mouseY / height < y_coor + hei;
  }
}

/*class AdjustVariable {
  float x_coor, y_coor;
  String varName;
  Button downButton, upButton;
  Button(String name, float x, float y){
    this.x_coor = x;
    this.y_coor = y;
    this.varName = name;
    this.downButton = Button(...);
    this.upButton = Button(...);
  }
  void draw(int value){
    downButton.draw()
    upButton.draw()
    // Draw some text in the middle showing variable name and value
  }
}*/
