class Logic {
  double? firstOperand;
  String? operator;

  String writeNumber(String originalValue, String ch) {
    if (originalValue == "0") {
      print(ch);
      return ch;
    }
    print(originalValue + ch);
    return originalValue + ch;
  }

  String clear() {
    firstOperand = null;
    operator = null;
    print("0");
    return "0";
  }

  String clearOneDigit(String originalValue) {
    if (originalValue.length <= 1) {
      print("0");
      return "0";
    }
    print(originalValue.substring(0, originalValue.length - 1));
    return originalValue.substring(0, originalValue.length - 1);
  }

  void setOperation(String currentDisplay, String op) {
    firstOperand = double.tryParse(currentDisplay);
    operator = op;
  }

  String calculate(String currentDisplay) {
    if (firstOperand == null || operator == null) return currentDisplay;

    double secondOperand = double.tryParse(currentDisplay) ?? 0;
    double result = 0;

    switch (operator) {
      case '+':
      print('+');
        result = firstOperand! + secondOperand;
        break;
      case '-':
        result = firstOperand! - secondOperand;
        break;
      case '×':
        result = firstOperand! * secondOperand;
        break;
      case '÷':
        result = (secondOperand != 0) ? (firstOperand! / secondOperand) : 0;
        break;
    }

    firstOperand = null;
    operator = null;

    print(result % 1 == 0 ? result.toInt().toString() : result.toString());
    return result % 1 == 0 ? result.toInt().toString() : result.toString();
  }
}