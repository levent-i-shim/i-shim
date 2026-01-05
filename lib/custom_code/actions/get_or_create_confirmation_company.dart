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

Future<CompanyConfirmationsRecord> getOrCreateConfirmationCompany(
    String sender,
    String receiver,
    String senderName,
    String receiverName,
    String company,
    bool isOwner) async {
  List<String> sortedNames = [sender.toLowerCase(), receiver.toLowerCase()]
    ..sort();
  String documentId = sortedNames.join();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  DocumentReference docRef = firestore.doc("/companyConfirmations/$documentId");

  try {
    final docSnapshot = await docRef.get();
    if (docSnapshot.exists) {
      return CompanyConfirmationsRecord.getDocumentOnce(docRef);
    }
  } catch (e) {
    print("Hata - belge kontrolünde: $e");
    rethrow;
  }

  String companyDoc = "/companies/" + company;
  DocumentReference companyDocRef = firestore.doc(companyDoc);

  try {
    await docRef.set({
      'senderRef': firestore.collection("users").doc(sender),
      'receiverRef': firestore.collection("users").doc(receiver),
      'senderName': senderName,
      'receiverName': receiverName,
      'isAccept': isOwner,
      'company': companyDocRef,
    });

    return CompanyConfirmationsRecord.getDocumentOnce(docRef);
  } catch (e) {
    print("Hata - belge oluşturulurken: $e");
    rethrow;
  }
}
