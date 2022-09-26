import 'dart:math';

import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/src/foundation/key.dart';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;

  late double _bmi;

  String Getbmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String GetResult() {
    if (_bmi >= 25)
      return "Overweight";
    else if (_bmi >= 18.5)
      return "Normal";
    else
      return "Underweight";
  }

  String GetInterpretation() {
    if (_bmi >= 25)
      return "Your BMI is high! ";
    else if (_bmi >= 18.5)
      return "Your BMI is normal";
    else
      return "Your BMI is low";
  }
}
