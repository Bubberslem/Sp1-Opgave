class Branco {
  float x, y;

  Branco(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }

  void display() {
    // Body
    stroke(0);
    fill(129, 84, 30);
    rect(x, y, 100, 40);

    // Legs
    line(x + 50, y + 20, x + 70, y + 50);
    line(x + 40, y + 20, x + 30, y + 50);
    line(x - 30, y + 20, x - 30, y + 50);
    line(x - 35, y + 20, x - 40, y + 50);
    line(x + 50, y - 20, x + 70, y - 30);

    // Ears
    circle(x - 80, y - 30, 40);
    circle(x - 30, y - 30, 40);

    // Head
    fill(129, 84, 30);
    ellipse(x - 50, y - 5, 80, 60);

    // Eyes
    fill(255);
    ellipse(x - 70, y - 5, 20, 20);
    ellipse(x - 40, y - 5, 20, 20);
    fill(x, 0, y);
    ellipse(x - 70, y - 5, 10, 10);
    ellipse(x - 40, y - 5, 10, 10);

    // Nose
    fill(125, 0, 0);
    ellipse(x - 55, y + 5, 15, 15);

    // Mouth
    fill(180, 0, 0);
    arc(x - 55, y + 15, 15, 15, 0, PI);
  }
  void move(float step) {
    x+=step;
   x= constrain(x,80,width-60);
  }
}
