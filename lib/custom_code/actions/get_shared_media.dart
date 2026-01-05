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

import 'package:receive_sharing_intent/receive_sharing_intent.dart';

import 'package:path/path.dart' as p; // dosya uzantısı için

Future<String> getSharedMedia() async {
  // Öncelikle uygulama kapalıyken gelen dosyayı kontrol et
  final initialMedia = await ReceiveSharingIntent.instance.getInitialMedia();
  if (initialMedia.isNotEmpty) {
    return initialMedia.first.path;
  }

  // Uygulama açıkken gelen dosya için stream dinleyicisi kur
  final mediaStream = ReceiveSharingIntent.instance.getMediaStream();

  await for (var value in mediaStream) {
    if (value.isNotEmpty) {
      return value.first.path;
    }
  }

  return "Gelmedi";
}
