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
Future<double> calculateDailySalary(double monthlySalary,
    DocumentReference companyRef, DocumentReference authUser) async {
  final now = DateTime.now();
  final year = now.year;
  final month = now.month;
  final day = now.day;

  // Dün tarihi (yesterday)
  final yesterday = DateTime(year, month, day - 1);

  // Ay içindeki gün sayısı
  final daysInMonth = DateTime(year, month + 1, 0).day;

  if (daysInMonth == 0) return 0.0;

  // Firestore sorgusunda DateTime kullanırken Timestamp olarak dönüştürmeli
  final startOfYesterday = Timestamp.fromDate(
      DateTime(yesterday.year, yesterday.month, yesterday.day, 0, 0, 0));
  final startOfToday = Timestamp.fromDate(
      DateTime(yesterday.year, yesterday.month, yesterday.day + 1, 0, 0, 0));

  // workerShifts koleksiyonundan dün onaylı vardiyeleri çek
  final shiftsSnap = await companyRef
      .collection("workerShifts")
      .where("isAccept", isEqualTo: true)
      .where("date", isGreaterThanOrEqualTo: startOfYesterday)
      .where("userRef", isEqualTo: authUser)
      .where("date", isLessThan: startOfToday)
      .get();

  // shiftsSnap içindeki totalValue alanlarını topla
  double totalExtraValue = 0.0;
  for (final doc in shiftsSnap.docs) {
    final data = doc.data();
    final double totalValue = (data['totalValue'] ?? 0).toDouble();
    totalExtraValue += totalValue;
  }

  // Günlük maaş + toplam mesai değeri
  final dailySalary = monthlySalary / daysInMonth;

  return dailySalary + totalExtraValue;
}
