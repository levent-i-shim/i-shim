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
Future<void> unblockUser(String senderId, String receiverId) async {
  // İsimleri küçük harfe çevir ve sırala
  List<String> sortedNames = [senderId.toLowerCase(), receiverId.toLowerCase()]
    ..sort();
  String documentId = sortedNames.join();

  final firestore = FirebaseFirestore.instance;
  final docRef = firestore.doc("/Message/$documentId");

  try {
    final snapshot = await docRef.get();

    if (!snapshot.exists) {
      print("Doküman bulunamadı.");
      return;
    }

    final data = snapshot.data() as Map<String, dynamic>?;
    if (data == null) {
      print("Doküman verisi boş.");
      return;
    }

    Map<String, dynamic> updateData = {};

    // user1 DocumentReference ise kontrol
    final user1Ref = data['user1'] as DocumentReference?;
    if (user1Ref != null && user1Ref.id == senderId) {
      updateData['isUser1Blocked'] = false;
    }

    // user2 DocumentReference ise kontrol
    final user2Ref = data['user2'] as DocumentReference?;
    if (user2Ref != null && user2Ref.id == senderId) {
      updateData['isUser2Blocked'] = false;
    }

    if (updateData.isNotEmpty) {
      await docRef.update(updateData);
      print("Blok kaldırıldı: $updateData");
    } else {
      print("Sender, user1 veya user2 ile eşleşmiyor.");
    }
  } catch (e) {
    print("Hata oluştu: $e");
  }
}
