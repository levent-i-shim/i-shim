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
String cityDocumentName(String input) {
  // Türkçe karakterleri İngilizce karşılıklarına çevir
  const Map<String, String> turkishChars = {
    'ç': 'c',
    'Ç': 'c',
    'ğ': 'g',
    'Ğ': 'g',
    'ı': 'i',
    'İ': 'i',
    'ö': 'o',
    'Ö': 'o',
    'ş': 's',
    'Ş': 's',
    'ü': 'u',
    'Ü': 'u',
  };

  String documentName = input;
  turkishChars.forEach((key, value) {
    documentName = documentName.replaceAll(key, value);
  });

  documentName = documentName.toLowerCase();

  documentName = documentName.replaceAll(RegExp(r'[^a-z0-9\s-]'), '');

  documentName = documentName.replaceAll(RegExp(r'\s+'), '-');

  documentName = documentName.replaceAll(RegExp(r'^-+|-+$'), '');

  return documentName;
}
