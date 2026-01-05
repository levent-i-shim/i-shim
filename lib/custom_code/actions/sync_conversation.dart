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

Future<void> syncConversation(List<MessageRecord>? messages) async {
  if (messages == null || messages.isEmpty) return;

  for (var message in messages) {
    try {
      await _addIfNotExists(
        time: message.lastMessageTimeCompany,
        type: 'company',
        message: message,
      );

      await _addIfNotExists(
        time: message.lastMessageTimeWorkplace,
        type: 'workplace',
        message: message,
      );

      await _addIfNotExists(
        time: message.lastMessageTimePhone,
        type: 'phone',
        message: message,
      );

      await _addIfNotExists(
        time: message.lastMessageTimeSocial,
        type: 'social',
        message: message,
      );
    } catch (e, stack) {
      print('Hata: Mesaj işlenemedi [${message.reference}]');
      print('Hata: $e');
      print('Stacktrace:\n$stack');
    }
  }
}

Future<void> _addIfNotExists({
  required DateTime? time,
  required String type,
  required MessageRecord message,
}) async {
  if (time == null) return;

  try {
    final conversationName = message.reference.id;

    final exists = await _conversationExists(
      conversationName: conversationName,
      type: type,
    );

    if (exists) {
      print('Zaten var: $conversationName ($type)');
      return;
    }

    await SQLiteManager.instance.addConversation(
      conversationName: conversationName,
      type: type,
      user1Ref: message.user1.toString(),
      user2Ref: message.user2.toString(),
    );
    print('Eklendi: $conversationName ($type)');
  } catch (e, stack) {
    print('_addIfNotExists hatası: $e');
    print('Stacktrace:\n$stack');
  }
}

Future<bool> _conversationExists({
  required String conversationName,
  required String type,
}) async {
  try {
    final db = await SQLiteManager.instance.database;
    final result = await db.query(
      'conversation',
      where: 'conversationName = ? AND type = ?',
      whereArgs: [conversationName, type],
      limit: 1,
    );
    return result.isNotEmpty;
  } catch (e, stack) {
    print('_conversationExists hatası: $e');
    print('Stacktrace:\n$stack');
    return false;
  }
}
