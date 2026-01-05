import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/auth/firebase_auth/auth_util.dart';

List<dynamic> listofAiMessagesToListJSON(List<AiMessagesRecord>? aiMessages) {
  aiMessages ??= [];

  // Reverse the list
  final reversedaiMessages = aiMessages.reversed.toList();

  final List<Map<String, dynamic>> jsonList = reversedaiMessages.map((message) {
    return {
      'role': message.role.toString().split('.').last,
      'content': message.content,
    };
  }).toList();

  return jsonList;
}

bool amISenderMessage(
  DocumentReference authUser,
  String sender,
) {
  return sender == authUser.toString();
}

Color getBackgroundColor(String? color) {
  String backGroundColor =
      color?.trim().isNotEmpty == true ? color! : '0xFF090620';

  // Renk kodunun geçerliliğini kontrol et
  try {
    return Color(int.parse(backGroundColor));
  } catch (e) {
    print('Geçersiz renk kodu, varsayılan renk kullanılıyor: $e');
    return Color(0xFF090620); // Varsayılan renk
  }
}
