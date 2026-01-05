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
Future<List<UserDetailDataStruct>> fetchFilteredWorkersByCompanies(
  List<String> companyIds,
  String searchQuery,
) async {
  final firestore = FirebaseFirestore.instance;
  final List<UserDetailDataStruct> matchedWorkers = [];

  if (searchQuery.trim().isEmpty) {
    return [];
  }

  for (String companyId in companyIds) {
    final workersSnapshot = await firestore
        .collection('companies')
        .doc(companyId)
        .collection('companyWorkers')
        .orderBy('userName')
        .startAt([searchQuery]).endAt([searchQuery + '\uf8ff']).get();

    for (final workerDoc in workersSnapshot.docs) {
      final data = workerDoc.data();

      matchedWorkers.add(UserDetailDataStruct(
        departmentName: data["departmenName"] ?? "",
        companyRef: firestore.collection('company').doc(companyId),
        id: data["userRef"],
        name: data["userName"],
        roleName: data["roleName"] ?? "",
        unitName: data["unitName"] ?? "",
      ));
    }
  }

  return matchedWorkers;
}
