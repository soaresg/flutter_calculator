import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController {
  ValueNotifier<String> input = ValueNotifier('');
  ValueNotifier<String> answer = ValueNotifier('0');
  List<String> labels = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+') {
      return true;
    }
    return false;
  }

  bool isFunction(String x) {
    if (x == 'C' || x == '+/-' || x == '%' || x == 'DEL') {
      return true;
    }
    return false;
  }

  void functionButtons(String x) {
    if (x == 'C') {
      input.value = '';
      answer.value = '0';
    } else if (x == '+/-') {
    } else if (x == '%') {
      input.value += x;
    } else if (x == 'DEL') {
      input.value = input.value.substring(0, input.value.length - 1);
    }
  }

  void equalPressed() {
    String finalInput = input.value.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalInput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    answer.value = eval.toString();
  }
}
