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

import 'package:cloud_firestore/cloud_firestore.dart';
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

Future<BudgetStruct> getWorkPlaceBudget(DocumentReference workPlace) async {
  double monthlyTotal = 0.0;
  double day15Total = 0.0;
  double weeklyTotal = 0.0;
  double dailyTotal = 0.0;

  final now = DateTime.now();
  final dayStart = DateTime(now.year, now.month, now.day);
  final dayEnd = dayStart.add(Duration(days: 1));
  final weekStart = dayStart.subtract(Duration(days: 7));
  final day15Start = dayStart.subtract(Duration(days: 15));
  final monthStart = dayStart.subtract(Duration(days: 30));

  try {
    final incomesSnapshot = await workPlace
        .collection("workPlaceIncomes2025")
        .where("date", isGreaterThanOrEqualTo: monthStart)
        .where("isDelete", isEqualTo: false)
        .get();

    for (var doc in incomesSnapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;
      final timestamp = (data["date"] as Timestamp?)?.toDate();
      final value = (data["value"])?.toDouble();
      if (timestamp == null || value == null) continue;

      if (timestamp.isAfter(monthStart)) monthlyTotal += value;
      if (timestamp.isAfter(weekStart)) weeklyTotal += value;
      if (timestamp.isAfter(day15Start)) day15Total += value;
      if (!timestamp.isBefore(dayStart) && timestamp.isBefore(dayEnd)) {
        dailyTotal += value;
      }
    }
  } catch (e) {
    print('Error reading workPlaceIncomes2025: $e');
  }

  try {
    final paymentsSnapshot = await workPlace
        .collection("workPlacePayments2025")
        .where("date", isGreaterThanOrEqualTo: monthStart)
        .where("isDelete", isEqualTo: false)
        .get();

    for (var doc in paymentsSnapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;
      final timestamp = (data["date"] as Timestamp?)?.toDate();
      final value = (data["value"])?.toDouble();
      if (timestamp == null || value == null) continue;

      if (timestamp.isAfter(monthStart)) monthlyTotal -= value;
      if (timestamp.isAfter(weekStart)) weeklyTotal -= value;
      if (timestamp.isAfter(day15Start)) day15Total -= value;
      if (!timestamp.isBefore(dayStart) && timestamp.isBefore(dayEnd)) {
        dailyTotal -= value;
      }
    }
  } catch (e) {
    print('Error reading workPlacePayments2025: $e');
  }

  try {
    final salarySnapshot = await workPlace
        .collection("workPlaceSalary")
        .where("date", isGreaterThanOrEqualTo: monthStart)
        .get();

    for (var doc in salarySnapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;
      final timestamp = (data["date"] as Timestamp?)?.toDate();
      final value = (data["value"])?.toDouble();
      if (timestamp == null || value == null) continue;

      if (timestamp.isAfter(monthStart)) monthlyTotal -= value;
      if (timestamp.isAfter(weekStart)) weeklyTotal -= value;
      if (timestamp.isAfter(day15Start)) day15Total -= value;
      if (!timestamp.isBefore(dayStart) && timestamp.isBefore(dayEnd)) {
        dailyTotal -= value;
      }
    }
  } catch (e) {
    print('Error reading workPlaceSalary: $e');
  }

  try {
    final allowencesSnapshot =
        await workPlace.collection("sentMoneyForAllowenceWorkPlace").get();

    for (var doc in allowencesSnapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;
      final timestamp = (data["date"] as Timestamp?)?.toDate();
      final value = (data["sentMoney"])?.toDouble();
      if (timestamp == null || value == null) continue;

      if (timestamp.isAfter(monthStart)) monthlyTotal -= value;
      if (timestamp.isAfter(weekStart)) weeklyTotal -= value;
      if (timestamp.isAfter(day15Start)) day15Total -= value;
      if (!timestamp.isBefore(dayStart) && timestamp.isBefore(dayEnd)) {
        dailyTotal -= value;
      }
    }
  } catch (e) {
    print('Error reading sentMoneyForAllowenceWorkPlace: $e');
  }

  return createBudgetStruct(
    monthly: monthlyTotal,
    day15: day15Total,
    week: weeklyTotal,
    day: dailyTotal,
  );
}
