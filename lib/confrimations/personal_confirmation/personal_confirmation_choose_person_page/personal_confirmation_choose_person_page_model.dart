import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'personal_confirmation_choose_person_page_widget.dart'
    show PersonalConfirmationChoosePersonPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PersonalConfirmationChoosePersonPageModel
    extends FlutterFlowModel<PersonalConfirmationChoosePersonPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getOrCreateMessage] action in Icon widget.
  MessageRecord? confirmation;
  // Stores action output result for [Custom Action - getConversationName] action in Icon widget.
  String? confirmationName;
  // Stores action output result for [Backend Call - SQLite (getConversationWithLastMessage)] action in Icon widget.
  List<GetConversationWithLastMessageRow>? conversationId;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
