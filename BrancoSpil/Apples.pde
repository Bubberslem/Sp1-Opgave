class Apples {
  float x;
  float y;
  float speed; //fall speed

  //Apple constructor
  Apples() {
    x = random(width);
    y = 0;
    speed = random(2,4);
  }


  void display() {
    fill(255, 0, 0);
    stroke(0);
    ellipse(x, y, 20, 20);
  }

  void update() {
    y +=speed;
    if (y>height) {
      reset();
    }
  }

  float reset() {
    x = random(width);
    y = 0;
    speed = random(3,7);
    return x;
  }
}
