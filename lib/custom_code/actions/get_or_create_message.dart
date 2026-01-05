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

Future<MessageRecord> getOrCreateMessage(String sender, String receiver,
    String senderName, String receiverName, String type, bool isOwner) async {
  List<String> sortedNames = [sender.toLowerCase(), receiver.toLowerCase()]
    ..sort();
  String documentId = sortedNames.join();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  DocumentReference docRef = firestore.doc("/Message/$documentId");

  final result = await SQLiteManager.instance.conversationHasExist(
    conversationName: documentId,
    type: type,
  );

  if (result.isEmpty) {
    await SQLiteManager.instance.addConversation(
        conversationName: documentId,
        type: type,
        user1Ref: sender,
        user2Ref: receiver);
  }

  try {
    final docSnapshot = await docRef.get();
    if (docSnapshot.exists) {
      return MessageRecord.getDocumentOnce(docRef);
    }
  } catch (e) {
    print("Hata - belge kontrolünde: $e");
    rethrow;
  }
  try {
    if (type == "workplace") {
      final result = await docRef.set({
        'user1': firestore.collection("users").doc(sender),
        'user2': firestore.collection("users").doc(receiver),
        'user1Name': senderName,
        'user2Name': receiverName,
        'isAcceptWorkplace': isOwner,
        'isUser1Blocked': false,
        'isUser2Blocked': false,
      });
    } else if (type == "company")
      await docRef.set({
        'user1': firestore.collection("users").doc(sender),
        'user2': firestore.collection("users").doc(receiver),
        'user1Name': senderName,
        'user2Name': receiverName,
        'isAcceptCompany': isOwner,
        'isUser1Blocked': false,
        'isUser2Blocked': false,
      });
    else {
      await docRef.set({
        'user1': firestore.collection("users").doc(sender),
        'user2': firestore.collection("users").doc(receiver),
        'user1Name': senderName,
        'isUser1Blocked': false,
        'isUser2Blocked': false,
        'user2Name': receiverName,
      });
    }

    return MessageRecord.getDocumentOnce(docRef);
  } catch (e) {
    print("Hata - belge oluşturulurken: $e");
    rethrow;
  }
}
