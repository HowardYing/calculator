// Instantiate the button class
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
Button[] spButtons = new Button[1];

String displayValue = "0";
String valToCompute = ""; // String value to left of operator
String valToCompute2 = ""; // String value to right of operator
float valToComputeI = 0; // Float value to left of operator
float valToComputeI2 = 0; // Float value to right of operator
float result = 0;
char opValue = ' ';
boolean firstNum; // Where does the imput go? Right or left of the operator?

void setup() {
  background(255);
  size(250, 280);
  //frameRate(rate);

  //Populate Number Buttons
  numButtons[0] = new Button(50, 240).asNumber(0, 50, 40);
  numButtons[1] = new Button(0, 200).asNumber(1, 50, 40);
  numButtons[2] = new Button(50, 200).asNumber(2, 50, 40);
  numButtons[3] = new Button(100, 200).asNumber(3, 50, 40);
  numButtons[4] = new Button(0, 160).asNumber(4, 50, 40);
  numButtons[5] = new Button(50, 160).asNumber(5, 50, 40);
  numButtons[6] = new Button(100, 160).asNumber(6, 50, 40);
  numButtons[7] = new Button(0, 120).asNumber(7, 50, 40);
  numButtons[8] = new Button(50, 120).asNumber(8, 50, 40);
  numButtons[9] = new Button(100, 120).asNumber(9, 50, 40);

  //Populate Operator Buttons
  opButtons[0] = new Button(200, 200).asOperator("=", 50, 120);
  opButtons[1] = new Button(150, 240).asOperator("+", 50, 40);
  opButtons[2] = new Button(150, 200).asOperator("-", 50, 40);
  opButtons[3] = new Button(150, 160).asOperator("×", 50, 40);
  opButtons[4] = new Button(150, 120).asOperator("÷", 50, 40);
  opButtons[5] = new Button(200, 120).asOperator("C", 50, 80);
  opButtons[6] = new Button(0, 240).asOperator("±", 50, 40);
  opButtons[7] = new Button(0, 80).asOperator("x²", 50, 40);
  opButtons[8] = new Button(50, 80).asOperator("√", 50, 40);
  opButtons[9] = new Button(150, 80).asOperator("sin()", 50, 40);
  opButtons[10] = new Button(100, 80).asOperator("cos()", 50, 40);
  opButtons[11] = new Button(200, 80).asOperator("tan()", 50, 40);

  //Populate Special Buttons
  spButtons[0] = new Button(100, 240).asSpecial(".", 50, 40);

  //Set initial value of first num to true
  firstNum = true;
}

void draw() {
  for (int i=0; i<numButtons.length; i+=1) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }

  for (int i=0; i<opButtons.length; i+=1) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }

  for (int i=0; i<spButtons.length; i++) {
    spButtons[i].display();
    spButtons[i].hover(mouseX, mouseY);
  }

  updateDisplay();
}

void mousePressed() {
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].hover(mouseX, mouseY);
    if (numButtons[i].over) {
      if (firstNum) {
        println(i + " " + numButtons[i].numVal);
        valToCompute += int(numButtons[i].numVal);
        displayValue = valToCompute;
      } else {
        valToCompute2 += int(numButtons[i].numVal);
        displayValue = valToCompute2;
      }
    }
  }

  for (int i=0; i<spButtons.length; i++) {
    spButtons[i].hover(mouseX, mouseY);
    if (spButtons[i].over) {
      if (spButtons[i].spVal == ".") {
        //concantenate the values clicked on (?)
        if (spButtons[i].over && firstNum == true) {
          valToCompute += spButtons[i].spVal;
          displayValue = valToCompute;
        } else if (spButtons[i].over && firstNum == false) {
          valToCompute2 += spButtons[i].spVal;
          displayValue = valToCompute2;
        }
      }
    }
  }

  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].hover(mouseX, mouseY);
    if (opButtons[i].over) {
      if (opButtons[i].opVal == "+") {
        if (result != 0) {
          opValue = '+';
          valToCompute2 = "";
          firstNum = false;
          displayValue = "+";
        } else {
          opValue = '+';
          firstNum = false;
          displayValue = "+";
        }
      } else if (opButtons[i].opVal == "=") {
        //Perform Calculation
        firstNum = true;
        performCalculation();
      } else if (opButtons[i].opVal == "-") {
        if (result !=0) {
          opValue = '-';
          valToCompute2 = "";
          firstNum = false; 
          displayValue = "-";
        } else {
          opValue = '-';
          firstNum = false;
          displayValue = "-";
        }
      } else if (opButtons[i].opVal == "×") {
        if (result !=0) {
          opValue = '×';
          valToCompute2 = "";
          firstNum = false;
          displayValue = "×";
        } else {
          opValue = '×';
          firstNum = false;
          displayValue = "×";
        }
      } else if (opButtons[i].opVal == "÷") {
        if (result !=0) {
          opValue = '÷';
          valToCompute2 = "";
          firstNum = false;
          displayValue = "÷";
        } else {
          opValue = '÷';
          firstNum = false;
          displayValue = "÷";
        }
      } else if (opButtons[i].opVal == "C") {
        displayValue = "0";
        opValue = 'C';
        valToCompute = "";
        valToCompute2 = "";
        valToComputeI = 0;
        valToComputeI2 = 0;
        result = 0;
        firstNum = true;
      } else if (opButtons[i].opVal == "±") {
        opValue = 'n';
        performCalculation();
      } else if (opButtons[i].opVal == "x²") {
        opValue = 's';
        performCalculation();
      } else if (opButtons[i].opVal == "√") {
        opValue = 'r';
        performCalculation();
      } else if (opButtons[i].opVal == "sin()") {
        opValue = 'p';
        performCalculation();
      } else if (opButtons[i].opVal == "cos()") {
        opValue = 'e';
        performCalculation();
      } else if (opButtons[i].opVal == "tan()") {
        opValue = 't';
        performCalculation();
      }
    }
  }
}

void keyPressed() {
  println(keyCode);
  //if (key == CODED) {
  //  if (keyCode == ) {
      
  //  }
 }


  void performCalculation() {
    // Convert strings to floats
    valToComputeI = float(valToCompute);
    valToComputeI2 = float(valToCompute2);

    // Perform calculation
    if (opValue == '+') {
      result = valToComputeI+valToComputeI2;
      displayValue = str(result);
    } else if (opValue == '-') {
      result = valToComputeI-valToComputeI2;
      displayValue = str(result);
    } else if (opValue == '×') {
      result = valToComputeI*valToComputeI2;
      displayValue = str(result);
    } else if (opValue == '÷') {
      result = valToComputeI/valToComputeI2;
      if (result != 0) {
        displayValue = str(result);
      } else {
        displayValue = "D:";
      }
    } else if (opValue == 'n') {
      if (firstNum) {
        valToComputeI = valToComputeI*-1;
        displayValue = str(valToComputeI);
      } else {
        valToComputeI2 = valToComputeI2*-1;
        displayValue = str(valToComputeI);
      }
    } else if (opValue == 's') {
      if (firstNum) {
        valToComputeI = sq(valToComputeI);
        displayValue = str(valToComputeI);
      } else {
        valToComputeI2 = sq(valToComputeI2);
        displayValue = str(valToComputeI);
      }
    } else if (opValue == 'r') {
      if (firstNum) {
        valToComputeI = sqrt(valToComputeI);
        displayValue = str(valToComputeI);
      } else {
        valToComputeI2 = sqrt(valToComputeI2);
        displayValue = str(valToComputeI);
      }
    } else if (opValue == 'p') {
      if (firstNum) {
        valToComputeI = sin(valToComputeI);
        displayValue = str(valToComputeI);
      } else {
        valToComputeI2 = sin(valToComputeI2);
        displayValue = str(valToComputeI);
      }
    } else if (opValue == 'e') {
      if (firstNum) {
        valToComputeI = cos(valToComputeI);
        displayValue = str(valToComputeI);
      } else {
        valToComputeI2 = cos(valToComputeI2);
        displayValue = str(valToComputeI);
      }
    } else if (opValue == 't') {
      if (firstNum) {
        valToComputeI = tan(valToComputeI);
        displayValue = str(valToComputeI);
      } else {
        valToComputeI2 = tan(valToComputeI2);
        displayValue = str(valToComputeI);
      }
    }

    // Let = work multiple times
    if (firstNum) {
      valToCompute = displayValue;
    } else {
      valToCompute = displayValue;
      valToCompute2 = "";
    }
  }

  void updateDisplay() {
    noStroke();
    fill(200);
    rect(0, 0, 250, 80);
    fill(0);
    textSize(18);
    text(displayValue, 2, 16); //TODO: Add offsets for Text in the display
  }