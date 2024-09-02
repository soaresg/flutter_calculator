import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_calculator/calculator_controller.dart';
import 'package:flutter_calculator/colors.dart';
import 'package:flutter_calculator/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _theme = '';
  static const events = EventChannel('calculator/channel');

  CalculatorController controller = CalculatorController();
  ThemeColors colors = ThemeColors();

  @override
  void initState() {
    colors.init();
    super.initState();
    events.receiveBroadcastStream().listen(_onEvent);
  }

  void _onEvent(Object? event) {
    setState(() {
      _theme = event == true ? 'dark' : 'light';
      debugPrint('Theme: $_theme');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AnimatedBuilder(
                    animation: controller.input,
                    builder: (_, __) => Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        controller.input.value,
                        style: TextStyle(
                          fontSize: 18,
                          color: colors.textColor,
                        ),
                      ),
                    ),
                  ),
                  AnimatedBuilder(
                    animation: controller.answer,
                    builder: (_, __) => Container(
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        controller.answer.value,
                        style: TextStyle(
                          fontSize: 30,
                          color: colors.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: GridView.builder(
                itemCount: controller.labels.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  bool isOperator =
                      controller.isOperator(controller.labels[index]);
                  bool isFunction =
                      controller.isFunction(controller.labels[index]);

                  if (isFunction) {
                    return CustomButton(
                      color: colors.functionButtonColor,
                      isNumber: false,
                      textColor: colors.buttonTextColor,
                      buttonText: controller.labels[index],
                      buttonTapped: () =>
                          controller.functionButtons(controller.labels[index]),
                    );
                  } else if (controller.labels[index] == '=') {
                    return CustomButton(
                      color: colors.equalButtonColor,
                      isNumber: false,
                      textColor: colors.buttonTextColor,
                      buttonText: controller.labels[index],
                      buttonTapped: () => controller.equalPressed(),
                    );
                  }

                  return CustomButton(
                    color: isOperator
                        ? colors.operatorButtonColor
                        : colors.numberButtonColor,
                    isNumber: !isOperator,
                    textColor: colors.buttonTextColor,
                    buttonText: controller.labels[index],
                    buttonTapped: () =>
                        controller.input.value += controller.labels[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
