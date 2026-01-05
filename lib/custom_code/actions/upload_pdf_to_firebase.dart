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

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

/// Set your action name, define your arguments and return parameter, and then
/// add the boilerplate code using the green button on the right!
Future<String> uploadPdfToFirebase(String filePath) async {
  File file = File(filePath);
  try {
    // Firebase Storage'a bağlan
    FirebaseStorage storage = FirebaseStorage.instance;
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();

    // PDF dosyasını "pdfs" klasörüne yükle
    Reference ref = storage.ref().child('pdfs/$fileName');

    // Dosyayı yükle
    await ref.putFile(file);

    // Yüklenen dosyanın download URL'sini al
    String downloadPath = await ref.getDownloadURL();
    return downloadPath;
  } catch (e) {
    print('Error uploading PDF: $e');
    return '';
  }
}
