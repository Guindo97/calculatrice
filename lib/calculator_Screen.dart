import 'package:flutter/material.dart';
import 'calculator_logic.dart';
import 'app_color.dart';
import 'calculator_buton.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorLogic _calculator = CalculatorLogic();

  void _onButtonPressed(String value) {
    setState(() {
      _calculator.buttonPressed(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Écran d'affichage
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(24),
              child: Text(
                _calculator.output,
                style: const TextStyle(fontSize: 80, color: Colors.white),
              ),
            ),
          ),
          // Boutons
          _buildButtonRow(["AC", "±", "%", "÷"], AppColors.buttonLight),
          _buildButtonRow(["7", "8", "9", "×"]),
          _buildButtonRow(["4", "5", "6", "-"]),
          _buildButtonRow(["1", "2", "3", "+"]),
          _buildButtonRow(["0", ".", "="], AppColors.buttonDark, true),
        ],
      ),
    );
  }

  Widget _buildButtonRow(List<String> values, [Color color = AppColors.buttonDark, bool isZero = false]) {
    return Row(
      children: values.map((value) {
        return CalculatorButton(
          text: value,
          color: ["÷", "×", "-", "+", "="].contains(value) ? AppColors.buttonOrange : color,
          textColor: ["÷", "×", "-", "+", "="].contains(value) ? Colors.white : Colors.black,
          onPressed: () => _onButtonPressed(value),
        );
      }).toList(),
    );
  }
}
