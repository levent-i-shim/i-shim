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

Future<CompanyBudgetStruct> getYesterdayCompanyFinancials(
    DocumentReference companies, String companyName) async {
  double totalIncome = 0.0;
  double totalSalary = 0.0;
  double totalExpanditury = 0.0;
  double totalPayment = 0.0;

  final now = DateTime.now().toLocal();
  final yesterdayStart =
      DateTime(now.year, now.month, now.day).subtract(Duration(days: 1));
  final yesterdayEnd = DateTime(now.year, now.month, now.day);

  try {
    final incomesSnapshot = await companies
        .collection("companyIncomes2025")
        .where("date", isGreaterThanOrEqualTo: yesterdayStart)
        .where("date", isLessThan: yesterdayEnd)
        .where("isDelete", isEqualTo: false)
        .get();

    for (var doc in incomesSnapshot.docs) {
      final value = (doc.data()["value"])?.toDouble();
      if (value != null) totalIncome += value;
    }
  } catch (e) {
    print('Error reading companyIncomes2025: $e');
  }

  try {
    final salarySnapshot = await companies
        .collection("companySalary")
        .where("date", isGreaterThanOrEqualTo: yesterdayStart)
        .where("date", isLessThan: yesterdayEnd)
        .get();

    for (var doc in salarySnapshot.docs) {
      final value = (doc.data()["value"])?.toDouble();
      if (value != null) totalSalary += value;
    }
  } catch (e) {
    print('Error reading companySalary: $e');
  }

  try {
    final paymentsSnapshot = await companies
        .collection("companyPayments2025")
        .where("date", isGreaterThanOrEqualTo: yesterdayStart)
        .where("date", isLessThan: yesterdayEnd)
        .where("isDelete", isEqualTo: false)
        .get();

    for (var doc in paymentsSnapshot.docs) {
      final value = (doc.data()["value"])?.toDouble();
      if (value != null) totalPayment += value;
    }
  } catch (e) {
    print('Error reading companyPayments2025: $e');
  }

  try {
    final allowencesSnapshot = await companies
        .collection("sentMoneyForAllowence")
        .where("date", isGreaterThanOrEqualTo: yesterdayStart)
        .where("date", isLessThan: yesterdayEnd)
        .get();

    for (var doc in allowencesSnapshot.docs) {
      final value = (doc.data()["sentMoney"])?.toDouble();
      if (value != null) totalExpanditury += value;
    }
  } catch (e) {
    print('Error reading sentMoneyForAllowence: $e');
  }

  return createCompanyBudgetStruct(
      totalIncome: totalIncome,
      totalSalary: totalSalary,
      totalExpanditury: totalExpanditury,
      totalPayment: totalPayment,
      companyName: companyName,
      companyRef: companies);
}
