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

import 'package:device_info_plus/device_info_plus.dart';

import 'package:photo_manager/photo_manager.dart';

import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

/// Set your action name, define your arguments and return parameter, and then
/// add the boilerplate code using the green button on the right!
Future<bool> requestGalleryPermission() async {
  if (Platform.isAndroid) {
    if (await _isAndroidVersionBelow(29)) {
      final status = await Permission.storage.request();
      if (status.isGranted) {
        print("✅ İzin verildi (eski Android sürümü)");
        return true;
      } else {
        print("🚫 İzin reddedildi");
        return false;
      }
    } else {
      print("✅ Android 10+ => İzin gerekmez");
      return true;
    }
  } else if (Platform.isIOS) {
    // iOS tüm sürümler
    final result = await PhotoManager.requestPermissionExtend();
    return result.hasAccess;
  } else {
    // Diğer platformlar
    return false;
  }
}

Future<bool> _isAndroidVersionBelow(int targetVersion) async {
  if (Platform.isAndroid) {
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    final sdkInt = androidInfo.version.sdkInt ?? 0;
    return sdkInt < targetVersion;
  }
  return false;
}
