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

import 'package:permission_handler/permission_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_contacts/fast_contacts.dart';

Future<void> getContactsBasicInfo(String userId) async {
  final permission = await Permission.contacts.request();
  if (!permission.isGranted) {
    openAppSettings(); // Kullanıcıyı ayarlara yönlendir
    throw Exception('Rehber erişim izni verilmedi');
  }

  await SQLiteManager.instance.deletePhones();

  final contacts = await FastContacts.getAllContacts();
  final firestore = FirebaseFirestore.instance;

  final digitsToContactMap = <String, Map<String, String>>{};

  for (final contact in contacts) {
    final contactName = contact.displayName ?? '';
    final phoneNumbers = contact.phones.map((p) => p.number).toList();

    for (final number in phoneNumbers) {
      String rawNumber = number;
      String digits = rawNumber.replaceAll(RegExp(r'\D'), '');

      if (digits.startsWith('90') && digits.length > 10) {
        digits = digits.substring(2);
      } else if (digits.startsWith('0') && digits.length == 11) {
        digits = digits.substring(1);
      }

      if (digits.length == 10 && RegExp(r'^5\d{9}$').hasMatch(digits)) {
        if (!digitsToContactMap.containsKey(digits)) {
          digitsToContactMap[digits] = {
            'name': contactName,
            'original': rawNumber,
          };
        }
      }
    }
  }

  final allValidDigits = digitsToContactMap.keys.toList();

  final chunks = chunkListFlexible(allValidDigits, 10);

  final Map<String, DocumentReference?> phoneIndexMap = {};

  for (final chunk in chunks) {
    final querySnapshot = await firestore
        .collection('phone_index')
        .where(FieldPath.documentId, whereIn: chunk)
        .get();

    for (final doc in querySnapshot.docs) {
      final digits = doc.id;
      final data = doc.data();
      final userIdField = data['userId'];
      phoneIndexMap[digits] =
          (userIdField is DocumentReference) ? userIdField : null;
    }
  }

  for (final entry in digitsToContactMap.entries) {
    final digits = entry.key;
    final name = entry.value['name']!;
    final rawPhone = entry.value['original']!;

    final isUser = phoneIndexMap.containsKey(digits) ? 1 : 0;
    final linkedUserId = phoneIndexMap[digits]?.id ?? "";

    await SQLiteManager.instance.addPhone(
      isUser: isUser,
      name: name,
      phoneNumber: rawPhone,
      userId: linkedUserId,
      speechExist: 0,
    );
  }
}

List<List<String>> chunkListFlexible(List<String> list, int size) {
  List<List<String>> chunks = [];
  for (var i = 0; i < list.length; i += size) {
    final chunk =
        list.sublist(i, (i + size > list.length) ? list.length : i + size);
    chunks.add(chunk);
  }
  return chunks;
}
