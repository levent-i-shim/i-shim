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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'package:i_shim/backend/api_requests/api_calls.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<String?> getMessageFromAi(List<AiMessagesRecord> aiChatMessages) async {
  // 3. OpenAI API çağrısı yap
  final apiResponse = await OpenAIAPIGroup.createChatCompletionCall.call(
    promptJson: _listofAiMessagesToListJSON(aiChatMessages),
  );

  // 4. Asistan cevabını JSON'dan çek
  dynamic jsonBody = apiResponse?.jsonBody;
  String? assistantContent;

  if (jsonBody != null &&
      jsonBody is Map &&
      jsonBody['choices'] != null &&
      jsonBody['choices'] is List &&
      jsonBody['choices'].isNotEmpty &&
      jsonBody['choices'][0]['message'] != null &&
      jsonBody['choices'][0]['message']['content'] != null) {
    assistantContent = jsonBody['choices'][0]['message']['content']?.toString();
  }

  return assistantContent;
}

List<dynamic> _listofAiMessagesToListJSON(List<AiMessagesRecord>? aiMessages) {
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
