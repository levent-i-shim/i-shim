// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
List<double> calculateCostVehicle(double lastValue, double firstValue,
    double cost, double average, int count) {
  final distance = lastValue - firstValue;

  final lastCost = cost / distance;

  // Yeni ortalama maliyeti hesapla (önceki ortalama ve yeni değerle)
  final newAverage = ((average * count) + lastCost) / (count + 1);

  return [lastCost, newAverage];
}
