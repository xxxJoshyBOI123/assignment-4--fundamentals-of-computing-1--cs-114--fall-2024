int[][] board = new int[3][3];
boolean gameOver = false; 
String message = "Computer's turn... Press 0-8 to play";

void setup() {
  size(500, 500);
  textSize(64);
  textAlign(CENTER, CENTER);
  noLoop();
  resetBoard();
  computerTurn();
}

void draw() {
  background(255);
  drawGrid();
  drawMarks();
  fill(0);
  textSize(20);
  text(message, width / 2, height - 20);
}

void drawMarks() {
  textAlign(CENTER, CENTER);
  textSize(64);
  for(int row = 0; row < 3; row++) {
    for(int col = 0; col < 3; col++) {
      float x = col * width / 3 + width / 6;
      float y = row * height / 3 + height / 6;
      if (board[row][col] == 1) { 
        ellipse(x, y, width / 6, height / 6); // draws the O
      } else if (board[row][col] == 2) {
        line(x - width / 12, y - height / 12, x + width / 12, y + height / 12); // draws the X
        line(x - width / 12, y + height / 12, x + width / 12, y - height / 12);
      }
    }
  }
}

void keyPressed() {
  if (gameOver) { 
    println("Game has ended... Press R to restart");
    if (key == 'r' || key == 'R') {
      resetBoard();
      gameOver = false;
      message = "Computer's turn Press 0-8 to play";
      computerTurn();
      redraw(); // updates the display
    }
    return;
  }
  
  if (key >= '0' && key <= '8') { // if the right number key (0-8) is pressed
    int num = key - '0';
    int row = num / 3;
    int col = num % 3;
    if (board[row][col] == 0) {
      board[row][col] = 1;
      println("You played position " + num + ".");
      if (checkWin(1)) { // checks if user wins
        println("User wins");
        message = "User wins";
        gameOver = true;
        redraw();
        return;
      } else if (isBoardFull()) { // checks for a draw
        println("No one wins");
        message = "No one wins";
        gameOver = true;
        redraw();
        return;
      }
      computerTurn();
    } else {
      println("Invalid move... Square already filled");
    }
    redraw();
  }
}
void computerTurn() {
  for(int row = 0; row < 3; row++) {
    for(int col = 0; col < 3; col++) {
      if (board[row][col] == 0) {
        board[row][col] = 2;
        println("Computer played.");
        if (checkWin(2)) { // checks if computer wins
          println("Computer wins");
          message = "Computer wins";
          gameOver = true;
        } else if (isBoardFull()) { // check for a draw
          println("No one wins");
          message = "No one wins";
        } else {
          message  = "Your turn... Press 0-8";
        }
        return;
      }
    }
  }
}

boolean checkWin(int player) {
  for(int row = 0; row < 3; row++) {
    if (board[row][0] == player && board[row][1] == player && board[row][2] == player) return true; // row
    if (board[0][row] == player && board[1][row] == player && board[2][row] == player) return true; // col
  }
  if (board[0][0] == player && board[1][1] == player && board[2][2] == player) return true; // diagonal
  if (board[0][2] == player && board[1][1] == player && board[2][0] == player) return true; // diagonal
  return false; // no win found
}

boolean isBoardFull() { // checks if any squares are empty
  for(int row = 0; row < 3; row++) {
    for(int col = 0; col < 3; col++) {
      if (board[row][col] == 0) return false; // board is full
    }
  }
  return true;
 }
 
void resetBoard() {
  for(int row = 0; row < 3; row++) {
    for(int col = 0; col < 3; col++) {
      board[row][col] = 0;
    }
  }
  gameOver = false;
  message = "Computer's turn... Press 0-8 to play";
  redraw();
  println("Computer's turn...Press 0-8 to play");
}
        
