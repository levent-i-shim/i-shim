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
Future<BudgetStruct> getYesterdayWorkplaceBudget(
    DocumentReference workplace) async {
  double dailyTotal = 0.0;

  final now = DateTime.now().toLocal();
  final yesterdayStart =
      DateTime(now.year, now.month, now.day).subtract(Duration(days: 1));
  final yesterdayEnd = DateTime(now.year, now.month, now.day);

  try {
    final incomesSnapshot = await workplace
        .collection("workPlaceIncomes2025")
        .where("date", isGreaterThanOrEqualTo: yesterdayStart)
        .where("date", isLessThan: yesterdayEnd)
        .where("isDelete", isEqualTo: false)
        .get();

    for (var doc in incomesSnapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;
      final value = (data["value"])?.toDouble();
      if (value != null) {
        dailyTotal += value;
      }
    }
  } catch (e) {
    print('Error reading companyIncomes2025 (yesterday): $e');
  }

  try {
    final paymentsSnapshot = await workplace
        .collection("workPlacePayments2025")
        .where("date", isGreaterThanOrEqualTo: yesterdayStart)
        .where("date", isLessThan: yesterdayEnd)
        .where("isDelete", isEqualTo: false)
        .get();

    for (var doc in paymentsSnapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;
      final value = (data["value"])?.toDouble();
      if (value != null) {
        dailyTotal -= value;
      }
    }
  } catch (e) {
    print('Error reading companyPayments2025 (yesterday): $e');
  }

  try {
    final allowencesSnapshot = await workplace
        .collection("sentMoneyForAllowenceWorkPlace")
        .where("date", isGreaterThanOrEqualTo: yesterdayStart)
        .where("date", isLessThan: yesterdayEnd)
        .get();

    for (var doc in allowencesSnapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;
      final value = (data["sentMoney"])?.toDouble();
      if (value != null) {
        dailyTotal -= value;
      }
    }
  } catch (e) {
    print('Error reading sentMoneyForAllowence (yesterday): $e');
  }

  try {
    final salarySnapshot = await workplace
        .collection("workPlaceSalary")
        .where("date", isGreaterThanOrEqualTo: yesterdayStart)
        .where("date", isLessThan: yesterdayEnd)
        .get();

    for (var doc in salarySnapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;
      final value = (data["value"])?.toDouble();
      if (value != null) {
        dailyTotal -= value;
      }
    }
  } catch (e) {
    print('Error reading companySalary (yesterday): $e');
  }

  return createBudgetStruct(
    monthly: 0.0,
    day15: 0.0,
    week: 0.0,
    day: dailyTotal.ceil().toDouble(),
  );
}
