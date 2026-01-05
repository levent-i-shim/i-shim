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

Future<void> safelyMarkMessagesReadAndUpdateCountCompanyConfirmation(
  DocumentReference authUser,
  DocumentReference companyConfirmationsRef,
) async {
  print('safelyMarkMessagesReadAndUpdateCountCompanyConfirmation called 2');
  final firestore = FirebaseFirestore.instance;

  final querySnapshot = await companyConfirmationsRef
      .collection('companyConfirmationMessages')
      .where('isRead', isEqualTo: false)
      .get();

  final candidateDocs = querySnapshot.docs.where((doc) {
    final senderRef = doc['senderRef'] as DocumentReference;
    return senderRef.path != authUser.path;
  }).toList();

  if (candidateDocs.isEmpty) return;

  await firestore.runTransaction((transaction) async {
    final authUserSnapshot = await transaction.get(authUser);
    final authUserData = authUserSnapshot.data() as Map<String, dynamic>?;

    if (authUserData == null) {
      throw Exception('authUser document does not exist.');
    }

    final rawCount = authUserData['messageCount'] ?? 0;
    final currentMessageCount = rawCount is int
        ? rawCount
        : (rawCount is double ? rawCount.toInt() : 0);

    int updatedCount = 0;

    // 🔁 1. Önce tüm okumaları yap
    final docSnapshots = <DocumentSnapshot>[];
    for (final doc in candidateDocs) {
      final snapshot = await transaction.get(doc.reference);
      docSnapshots.add(snapshot);
    }

    // 🖊️ 2. Sonra tüm güncellemeleri yap
    for (final docSnapshot in docSnapshots) {
      final data = docSnapshot.data() as Map<String, dynamic>?;

      if (data == null) continue;
      final isRead = data['isRead'] == true;

      if (!isRead) {
        transaction.update(docSnapshot.reference, {'isRead': true});
        updatedCount++;
      }
    }

    if (updatedCount == 0) return;

    final newMessageCount = currentMessageCount - updatedCount;
    transaction.update(authUser, {
      'messageCount': newMessageCount < 0 ? 0 : newMessageCount,
    });
  });
}
