import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.color,
    required this.isNumber,
    required this.textColor,
    required this.buttonText,
    required this.buttonTapped,
  });

  final Color color;
  final bool isNumber;
  final Color textColor;
  final String buttonText;
  final Function()? buttonTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(.2),
        child: ClipRRect(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              border: Border.all(
                  color: isNumber
                      ? textColor.withOpacity(0.2)
                      : Colors.transparent),
              color: color,
            ),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
