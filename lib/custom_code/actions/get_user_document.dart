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

import 'package:cloud_firestore/cloud_firestore.dart'
    show FirebaseFirestore, DocumentSnapshot, DocumentReference;

/// Return Value: Document (Document Type: companies) Argument: docId : String
Future<UsersRecord?> getUserDocument(String docId) async {
  final DocumentReference ref = FirebaseFirestore.instance.doc('users/$docId');
  final DocumentSnapshot snap = await ref.get();

  if (!snap.exists) {
    return null;
  }

  return UsersRecord.fromSnapshot(snap);
}
