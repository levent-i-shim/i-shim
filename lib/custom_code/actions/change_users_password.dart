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

import 'package:firebase_auth/firebase_auth.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
Future<String> changeUsersPassword(String currentPassword, String newPassword,
    String newPasswordAgain, String email) async {
  if (newPassword != newPasswordAgain) return "Şifreler Eşleşmedi";
  try {
    User? user = FirebaseAuth.instance.currentUser;

    AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: currentPassword);

    await user?.reauthenticateWithCredential(credential);

    await user?.updatePassword(newPassword);

    return "Şifre Başarı ile Değiştirildi";
  } catch (e) {
    return "Şifre Değiştirilemedi $e";
  }
}
