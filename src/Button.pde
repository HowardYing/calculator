class Button {
  //Class Variables
  int x, y, w, h; //Button location and size
  color t1, t2; //Color for button body and text
  int numVal; //Text in the button
  String opVal, spVal; // Specifies the value of the button
  Boolean over; //Hover detection variable
  Boolean isNumber = false;
  Boolean isOperator = false;
  Boolean isSpecial = false;

  //Positioning constructor
  Button(int x, int y) {
    this.x = x;
    this.y = y;
    over = false;
  }

  //Constructor for NUMBER buttons
  Button asNumber(int numVal, int w, int h) {
    this.numVal=numVal;
    isNumber = true;
    this.w = w;
    this.h = h;
    return this;
  }

  //Constructor for OPERATOR buttons
  Button asOperator(String opVal, int w, int h) {
    this.opVal = opVal;
    isOperator = true;
    this.w = w;
    this.h = h;
    return this;
  }

  //Constructor for SPECIAL buttons
  Button asSpecial(String spVal, int w, int h) {
    //Set special button color or shape here
    this.spVal = spVal;
    isSpecial = true;
    this.w = w;
    this.h = h;
    return this;
  }

  //Display button
  void display() {
    //Display Number Buttons
    if (isNumber) {
      if (over) {
        fill(230);
      } else {
        fill(255);
      }
      noStroke();
      rect(x, y, w, h);
      fill(0);
      textSize(16);
      text(numVal, x+20, y+26);

      //Display Operator Buttons
    } else if (isOperator) {
      if (opVal != "±") {
        if (over) {
          fill(10, 181, 207);
        } else {
          fill(9, 202, 234);
        }
      } else {
        if (over) {
          fill(230);
        } else {
          fill(255);
        }
      }
      noStroke();
      rect(x, y, w, h);
      fill(0);
      textSize(16);
      if (opVal == "-") {
        text(opVal, x+22, y+26);
      } else if (opVal == "√") {
        text(opVal, x+18, y+26);
      } else if (opVal == "x²") {
        text(opVal, x+18, y+26);
      } else if (opVal == "cos()") {
        text(opVal, x+7, y+26);
      } else if (opVal == "sin()") {
        text(opVal, x+9, y+26);
      } else if (opVal == "tan()") {
        text(opVal, x+9, y+26);
      } else {
        text(opVal, x+20, y+26);
      }

      //Display Special Buttons
    } else if (isSpecial) {
      if (over) {
        fill(230);
      } else {
        fill(255);
      }
      noStroke();
      rect(x, y, w, h);
      fill(0);
      textSize(16);
      if (spVal != ".") {
        text(spVal, x+20, y+26);
      } else {
        text(spVal, x+22, y+26);
      }
    }
  }

  //Hover logic
  void hover(int xpos, int ypos) {
    over = xpos > x && xpos < x+w && ypos > y && ypos < y+h;
  }
}