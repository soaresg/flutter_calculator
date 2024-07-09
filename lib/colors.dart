import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeColors {
  final bool isDarkTheme =
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark;

  late Color background;
  late Color textColor;
  late Color buttonTextColor;
  late Color numberButtonColor;
  late Color operatorButtonColor;
  late Color functionButtonColor;
  late Color equalButtonColor;

  void init() {
    background = isDarkTheme ? Colors.white12 : Colors.white;
    textColor = isDarkTheme ? Colors.white : Colors.black87;
    buttonTextColor = isDarkTheme ? Colors.white : Colors.black87;
    numberButtonColor = isDarkTheme
        ? const Color.fromRGBO(250, 230, 250, 1)
        : const Color.fromRGBO(250, 230, 250, 1);
    operatorButtonColor = isDarkTheme
        ? const Color.fromRGBO(255, 212, 250, 1)
        : const Color.fromRGBO(255, 212, 250, 1);
    functionButtonColor = isDarkTheme
        ? const Color.fromRGBO(204, 204, 255, 1)
        : const Color.fromRGBO(204, 204, 255, 1);
    equalButtonColor = Colors.purple;
  }
}
