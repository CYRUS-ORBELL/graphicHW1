class Slider{
    float x, y, sliderWidth;
    float minValue, maxValue;
    float value;

    boolean dragging = false;

    Slider(float x, float y, float sliderWidth,
         float minValue, float maxValue) {
        this.x = x;
        this.y = y;
        this.sliderWidth = sliderWidth;
        this.minValue = minValue;
        this.maxValue = maxValue;

        value = minValue;
    }

    void display(){
        stroke(150);
        strokeWeight(6);
        line(x, y, x + sliderWidth, y);

        float knobX = map(value, minValue, maxValue, x, x + sliderWidth);

        noStroke();
        fill(50, 120, 255);
        ellipse(knobX, y, 20, 20);

        fill(0);
        textSize(20);
        textAlign(CENTER);
        text(round(value), x + sliderWidth / 2, y - 25);
    }

    float currentYear(){
        return value;
    }


    void mousePressed() {
    float knobX = map(value, minValue, maxValue,
                      x, x + sliderWidth);

    if (dist(mouseX, mouseY, knobX, y) < 20) {
      dragging = true;
    }
  }

  void mouseDragged() {
    if (dragging) {
      float newX = constrain(mouseX, x, x + sliderWidth);

      value = map(newX, x, x + sliderWidth,
                  minValue, maxValue);
    }
  }

  void mouseReleased() {
    dragging = false;
  }

}

