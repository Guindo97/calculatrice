class CalculatorLogic {
  String _output = "0";
  String _operator = "";
  double? _firstOperand;
  bool _shouldReset = false;

  String get output => _output;

  void buttonPressed(String value) {
    if (value == "AC") {
      _clear();
    } else if (value == "±") {
      _toggleSign();
    } else if (value == "%") {
      _percentage();
    } else if (value == "=") {
      _calculate();
    } else if (_isOperator(value)) {
      _setOperator(value);
    } else {
      _addDigit(value);
    }
  }

  void _clear() {
    _output = "0";
    _operator = "";
    _firstOperand = null;
    _shouldReset = false;
  }

  void _toggleSign() {
    if (_output != "0") {
      _output = (double.parse(_output) * -1).toString();
    }
  }

  void _percentage() {
    _output = (double.parse(_output) / 100).toString();
  }

  void _setOperator(String newOperator) {
    _firstOperand = double.tryParse(_output);
    _operator = newOperator;
    _shouldReset = true;
  }

  void _calculate() {
    if (_firstOperand == null || _operator.isEmpty) return;
    double secondOperand = double.parse(_output);
    double result = _firstOperand!;

    switch (_operator) {
      case "+":
        result += secondOperand;
        break;
      case "-":
        result -= secondOperand;
        break;
      case "×":
        result *= secondOperand;
        break;
      case "÷":
        result = secondOperand != 0 ? result / secondOperand : double.infinity;
        break;
    }

    _output = result.toString();
    _operator = "";
    _firstOperand = null;
    _shouldReset = true;
  }

  void _addDigit(String digit) {
    if (_shouldReset) {
      _output = digit;
      _shouldReset = false;
    } else {
      if (_output == "0" && digit != ".") {
        _output = digit;
      } else {
        _output += digit;
      }
    }
  }

  bool _isOperator(String value) => ["+", "-", "×", "÷"].contains(value);
}
