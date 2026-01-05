import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'phone_confirmations_create_confirmation_widget.dart'
    show PhoneConfirmationsCreateConfirmationWidget;
import 'package:flutter/material.dart';

class PhoneConfirmationsCreateConfirmationModel
    extends FlutterFlowModel<PhoneConfirmationsCreateConfirmationWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getOrCreateMessage] action in Icon widget.
  MessageRecord? confirmation;
  // Stores action output result for [Custom Action - getConversationName] action in Icon widget.
  String? conversationName;
  // Stores action output result for [Backend Call - SQLite (getConversationWithLastMessage)] action in Icon widget.
  List<GetConversationWithLastMessageRow>? conversationId;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
