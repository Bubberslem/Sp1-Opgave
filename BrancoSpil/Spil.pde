Branco branco;
Apples apple;
ArrayList<Integer> scores = new ArrayList<Integer>();
int currentScore = 0;
int highScore = 0;
int lives = 3;
boolean gameOver = false;

void setup() {
  size(800, 800);
  smooth();
  ellipseMode(CENTER);
  rectMode(CENTER);

  // Draws Branco
  branco = new Branco(width / 2, height / 1.16);
  apple = new Apples();
}

void draw() {
  if (!gameOver) {
    background(0, 125, 0);
    branco.display();
    apple.display();
    apple.update();

    if (apple.y > branco.y - 20 && apple.y < branco.y + 20 && apple.x > branco.x - 90 && apple.x < branco.x + 70) {
      currentScore++;  // If Branco catches the apple, increase score
      apple.reset();  // Reset apple to the top
    }
    if (apple.y + 10 > height) {
      lives--;
      apple.reset();
    }
    fill(255);
    textSize(20);
    text("Score: " + currentScore, 10, 30);
    text("Lives: " + lives, 10, 60);

    // When lives reach 0, store the score in ArrayList and start a new round
    if (lives <= 0) {
      gameOver = true;
      scores.add(currentScore); // Store the current score in the ArrayList
      if (currentScore > highScore) { // Update high score
        highScore = currentScore;
      }
      noLoop();
      background(255);
      fill(0);
      textSize(40);
      text("Game Over", width / 4, height / 2);
      textSize(20);
      text("Press R to Restart", width / 4, height / 2 + 40);

      // Show current score and high score
      textSize(20);
      text("Current Score: " + currentScore, width / 4, height / 2 + 80);
      text("High Score: " + highScore, width / 4, height / 2 + 100);

      // Show all previous scores
      textSize(20);
      for (int i = 0; i < scores.size(); i++) {
        text("Round " + (i + 1) + ": " + scores.get(i), width / 4, height / 2 + 120 + (i * 20));
      }
    }
  }
}

void keyPressed() {
  if (!gameOver) {
    if (keyCode == RIGHT) {
      branco.move(10);
    } else if (keyCode == LEFT) {
      branco.move(-10);
    }
  }
  if (gameOver && key == 'r') {
    restartGame();
  }
}

void restartGame() {
  currentScore = 0;
  lives = 3;
  apple.reset();
  gameOver = false;
  loop(); // Start the draw loop again
}
