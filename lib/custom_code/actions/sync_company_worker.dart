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

Future<void> syncCompanyWorker(List<DocumentReference> companies) async {
  final appState = FFAppState();
  final now = DateTime.now();
  final lastUpdate = appState.localDbLastUpdatedAt;
  appState.localDbLastUpdatedAt = now;

  for (final company in companies) {
    final allWorkersQuery = company
        .collection("companyWorkers")
        .where("isDelete", isEqualTo: false);

    final allWorkers = lastUpdate == null
        ? await allWorkersQuery.get()
        : await allWorkersQuery
            .where("updatedAt", isGreaterThanOrEqualTo: lastUpdate)
            .get();

    for (var worker in allWorkers.docs) {
      final data = worker.data();
      final DocumentReference? userRef = data['userRef'];
      final userId = userRef?.id;
      final DocumentReference? workPlaceRef = data['workPlace'];
      final workplaceId = workPlaceRef?.id;

      if (userId == null) continue;

      final hasWorker = await _hasCompanyWorker(userId);

      if (hasWorker) {
        await SQLiteManager.instance.updateCompanyWorker(
          departmentName: data["departmenName"],
          roleName: data["roleName"],
          speechExist: 0,
          unitName: data["unitName"],
          userId: userId,
          userName: data["userName"],
          workplaceId: workplaceId,
        );
      } else {
        await SQLiteManager.instance.addCompanyWorker(
          companyId: company.id,
          companyWorkerId: worker.id,
          departmentName: data["departmenName"],
          roleName: data["roleName"],
          unitName: data["unitName"],
          userId: userId,
          speechExist: 0,
          userName: data["userName"],
          workplaceId: workplaceId,
        );
      }
    }
  }
}

Future<bool> _hasCompanyWorker(String userId) async {
  final db = await SQLiteManager.instance.database;
  final result = await db.query(
    'companyWorkers',
    where: 'userId = ?',
    whereArgs: [userId],
    limit: 1,
  );
  return result.isNotEmpty;
}
