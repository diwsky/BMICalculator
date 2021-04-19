import 'dart:math';

import 'package:flutter/cupertino.dart';

class CalculatorBrain {
  final int height;
  final int weight;

  CalculatorBrain({@required this.height, @required this.weight});

  double _bmi;

  String getBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getStatusText() {
    if (_bmi >= 25) {
      return 'overweight';
    } else if (_bmi > 18.5) {
      return 'normal';
    } else {
      return 'underweight';
    }
  }

  String getDescText() {
    if (_bmi >= 25) {
      return 'Gendut lo!';
    } else if (_bmi > 18.5) {
      return 'Mantap!!!';
    } else {
      return 'Kurang makan!';
    }
  }
}
