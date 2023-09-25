class MainStore {
  late double firstNumber;
  late double secondNumber;
  late String operator;
  late double resultNumber;

  void setFirstNumber(double number) => firstNumber = number;
  void setSecondNumber(double number) => secondNumber = number;
  void setOperator(String op) => operator = op;

  double getFirstNumber() => firstNumber;
  double getSecondNumber() => secondNumber;
  String getOperator() => operator;
  double getresultNumber() => resultNumber;

  void makeOperation() {
    switch (operator) {
      case '+':
        resultNumber = firstNumber + secondNumber;
        break;
      case '-':
        resultNumber = firstNumber - secondNumber;
        break;
      case 'x':
        resultNumber = firstNumber * secondNumber;
        break;
      case '/':
        resultNumber = firstNumber / secondNumber;
        break;
    }
  }
}
