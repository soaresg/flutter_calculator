import 'package:flutter/material.dart';
import 'package:flutter_calculator/calculator_controller.dart';
import 'package:flutter_calculator/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalculatorController controller = CalculatorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      backgroundColor: Colors.white38,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                AnimatedBuilder(
                  animation: controller.input,
                  builder: (_, __) => Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      controller.input.value,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
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
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
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
                    color: Colors.indigo.shade400,
                    textColor: Colors.white,
                    buttonText: controller.labels[index],
                    buttonTapped: () =>
                        controller.functionButtons(controller.labels[index]),
                  );
                } else if (controller.labels[index] == '=') {
                  return CustomButton(
                    color: Colors.amberAccent.shade200,
                    textColor: Colors.white,
                    buttonText: controller.labels[index],
                    buttonTapped: () => controller.equalPressed(),
                  );
                }

                return CustomButton(
                  color: isOperator ? Colors.indigo.shade200 : Colors.indigo,
                  textColor: Colors.white,
                  buttonText: controller.labels[index],
                  buttonTapped: () =>
                      controller.input.value += controller.labels[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
