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
import 'package:url_launcher/url_launcher.dart';

Future<void> sendWhatsappInvite(String phoneNumber) async {
  // Sadece rakamları al (örneğin: +90 (555) 123 4567 → 905551234567)
  final cleanedPhone = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

  const message = '''
Merhaba! Uygulamamızı indirip hemen kullanmaya başla:
Android için: https://play.google.com/store/apps/details?id=com.levent.ishim
iOS için: https://apps.apple.com/app/id6746290683
''';

  final encodedMessage = Uri.encodeComponent(message);
  final uri = Uri.parse("https://wa.me/$cleanedPhone?text=$encodedMessage");

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    print('WhatsApp açılamadı');
  }
}
