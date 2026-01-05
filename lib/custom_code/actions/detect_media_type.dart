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
import 'package:path/path.dart' as p; // dosya uzantısı için

String detectMediaType(String path) {
  final extension = p.extension(path).toLowerCase();
  if (extension == '.pdf') {
    return "pdf";
  } else if (['.jpg', '.jpeg', '.png'].contains(extension)) {
    return "resim";
  } else {
    return "diğer";
  }
}
