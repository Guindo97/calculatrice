import 'package:flutter/material.dart';
import '../app_color.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;

  const CalculatorButton({
    super.key,
    required this.text,
    this.color = AppColors.buttonDark,
    this.textColor = AppColors.textWhite,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            padding: const EdgeInsets.all(20),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(fontSize: 30, color: textColor),
          ),
        ),
      ),
    );
  }
}
