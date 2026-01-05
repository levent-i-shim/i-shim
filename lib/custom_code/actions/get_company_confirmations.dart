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
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

Future<List<CompanyConfirmationsRecord>> getCompanyConfirmations(
    DocumentReference authUser) async {
  try {
    final firestore = FirebaseFirestore.instance;

    // Query: sender == authUser
    final senderQuery = await firestore
        .collection('companyConfirmations')
        .where('isAccept', isEqualTo: true)
        .where('senderRef', isEqualTo: authUser)
        .get();

    // Query: receiver == authUser
    final receiverQuery = await firestore
        .collection('companyConfirmations')
        .where('isAccept', isEqualTo: true)
        .where('receiverRef', isEqualTo: authUser)
        .get();

    // Combine results, removing duplicates
    final combinedDocs = [
      ...senderQuery.docs,
      ...receiverQuery.docs.where(
        (doc) => !senderQuery.docs.any((d) => d.id == doc.id),
      ),
    ];

    List<CompanyConfirmationsRecord> list = [];
    // Sort by 'lastMessageTime' in descending order (most recent first)
    combinedDocs.sort((a, b) {
      final aTime = a.data()?['lastMessageTime'];
      final bTime = b.data()?['lastMessageTime'];

      if (aTime is Timestamp && bTime is Timestamp) {
        return bTime.compareTo(aTime); // descending order
      } else {
        return 0; // fallback if field is missing
      }
    });

    // Sort işlemi tamamlandıktan sonra listeyi oluştur
    list = combinedDocs
        .map((doc) => CompanyConfirmationsRecord.fromSnapshot(doc))
        .toList();

    return list;
  } catch (e) {
    print('Error fetching and sorting confirmations: $e');
    return [];
  }
}
