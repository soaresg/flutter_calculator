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
    numberButtonColor = Colors.transparent;
    operatorButtonColor = isDarkTheme
        ? Colors.white.withOpacity(0.1)
        : Colors.black.withOpacity(0.1);
    functionButtonColor = isDarkTheme
        ? Colors.white.withOpacity(0.1)
        : Colors.black.withOpacity(0.1);
    equalButtonColor = Colors.purple.withOpacity(isDarkTheme ? 0.5 : 0.1);
  }
}
