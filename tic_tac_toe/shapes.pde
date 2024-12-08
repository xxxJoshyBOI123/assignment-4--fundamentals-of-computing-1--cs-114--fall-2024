void drawO (float x, float y) {
  noFill();
  stroke(0);
  strokeWeight(4);
  ellipse(x, y, width / 6, height / 6);
}

void drawX (float x, float y) {
  stroke(0);
  strokeWeight(4);
  float offset = width / 12;
  line(x - offset, y - offset, x + offset, y + offset);
  stroke(10);
  line(x - offset, y + offset, x + offset, y - offset);
}
