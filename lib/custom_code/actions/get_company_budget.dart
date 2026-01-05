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

import 'package:cloud_firestore/cloud_firestore.dart';

Future<BudgetStruct> getCompanyBudget(DocumentReference companies) async {
  double monthlyTotal = 0.0;
  double day15Total = 0.0;
  double weeklyTotal = 0.0;
  double dailyTotal = 0.0;

  final now = DateTime.now().toLocal();
  final dayStart = DateTime(now.year, now.month, now.day);
  final dayEnd = dayStart.add(Duration(days: 1));
  final week = dayStart.subtract(Duration(days: 7));
  final day15 = dayStart.subtract(Duration(days: 15));
  final month = dayStart.subtract(Duration(days: 30));

  try {
    final incomesSnapshot = await companies
        .collection("companyIncomes2025")
        .where("date", isGreaterThanOrEqualTo: month)
        .where("isDelete", isEqualTo: false)
        .get();

    for (var doc in incomesSnapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;
      final timestamp = (data["date"] as Timestamp?)?.toDate().toLocal();
      final value = (data["value"])?.toDouble();

      if (timestamp == null || value == null) continue;

      if (timestamp.isAfter(month)) monthlyTotal += value;
      if (timestamp.isAfter(week)) weeklyTotal += value;
      if (timestamp.isAfter(day15)) day15Total += value;
      if (!timestamp.isBefore(dayStart) && timestamp.isBefore(dayEnd)) {
        dailyTotal += value;
      }
      print(value.toString());
    }
  } catch (e) {
    print('Error reading companyIncomes2025: $e');
  }

  try {
    final paymentsSnapshot = await companies
        .collection("companyPayments2025")
        .where("date", isGreaterThanOrEqualTo: month)
        .where("isDelete", isEqualTo: false)
        .get();

    for (var doc in paymentsSnapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;
      final timestamp = (data["date"] as Timestamp?)?.toDate().toLocal();
      final value = (data["value"])?.toDouble();

      if (timestamp == null || value == null) continue;

      if (timestamp.isAfter(month)) monthlyTotal -= value;
      if (timestamp.isAfter(week)) weeklyTotal -= value;
      if (timestamp.isAfter(day15)) day15Total -= value;
      if (!timestamp.isBefore(dayStart) && timestamp.isBefore(dayEnd)) {
        dailyTotal -= value;
      }

      print(value.toString());
    }
  } catch (e) {
    print('Error reading companyPayments2025: $e');
  }

  try {
    final salarySnapshot = await companies
        .collection("companySalary")
        .where("date", isGreaterThanOrEqualTo: month)
        .get();

    for (var doc in salarySnapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;
      final timestamp = (data["date"] as Timestamp?)?.toDate().toLocal();
      final value = (data["value"])?.toDouble();

      if (timestamp == null || value == null) continue;

      if (timestamp.isAfter(month)) monthlyTotal -= value;
      if (timestamp.isAfter(week)) weeklyTotal -= value;
      if (timestamp.isAfter(day15)) day15Total -= value;
      if (!timestamp.isBefore(dayStart) && timestamp.isBefore(dayEnd)) {
        dailyTotal -= value;
      }
    }
  } catch (e) {
    print('Error reading companySalary: $e');
  }

  try {
    final allowencesSnapshot =
        await companies.collection("sentMoneyForAllowence").get();

    for (var doc in allowencesSnapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;
      final timestamp = (data["date"] as Timestamp?)?.toDate().toLocal();
      final value = (data["sentMoney"])?.toDouble();

      if (timestamp == null || value == null) continue;

      if (timestamp.isAfter(month)) monthlyTotal -= value;
      if (timestamp.isAfter(week)) weeklyTotal -= value;
      if (timestamp.isAfter(day15)) day15Total -= value;
      if (!timestamp.isBefore(dayStart) && timestamp.isBefore(dayEnd)) {
        dailyTotal -= value;
      }
    }
  } catch (e) {
    print('Error reading sentMoneyForAllowence: $e');
  }

  return createBudgetStruct(
    monthly: monthlyTotal,
    day15: day15Total,
    week: weeklyTotal,
    day: dailyTotal,
  );
}
