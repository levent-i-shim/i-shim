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

Future<PersonalConfirmationsRecord> getOrCreatePersonalConfirmation(
  String sender,
  String receiver,
  String senderName,
  String receiverName,
) async {
  List<String> sortedNames = [sender.toLowerCase(), receiver.toLowerCase()]
    ..sort();
  String documentId = sortedNames.join();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  DocumentReference docRef =
      firestore.doc("/PersonalConfirmations/$documentId");

  try {
    final docSnapshot = await docRef.get();
    if (docSnapshot.exists) {
      return PersonalConfirmationsRecord.getDocumentOnce(docRef);
    }
  } catch (e) {
    print("Hata - belge kontrolünde: $e");
    rethrow;
  }

  try {
    await docRef.set({
      'sender': firestore.collection("users").doc(sender),
      'receiver': firestore.collection("users").doc(receiver),
      'senderName': senderName,
      'receiverName': receiverName,
    });

    final userConfirmationRef = firestore
        .collection("users")
        .doc(sender)
        .collection("AllConfirmations")
        .doc();

    await userConfirmationRef.set({
      'isAccept': true,
      'receiverName': receiverName,
      'createdRef': firestore.collection("users").doc(sender),
      'personalConfirmations': docRef,
    });

    final userConfirmationRef2 = firestore
        .collection("users")
        .doc(receiver)
        .collection("AllConfirmations")
        .doc();

    await userConfirmationRef2.set({
      'isAccept': true,
      'receiverName': senderName,
      'createdRef': firestore.collection("users").doc(sender),
      'personalConfirmations': docRef,
    });

    return PersonalConfirmationsRecord.getDocumentOnce(docRef);
  } catch (e) {
    print("Hata - belge oluşturulurken: $e");
    rethrow;
  }
}
