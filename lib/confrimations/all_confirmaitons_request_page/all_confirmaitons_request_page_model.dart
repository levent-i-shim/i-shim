import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'all_confirmaitons_request_page_widget.dart'
    show AllConfirmaitonsRequestPageWidget;
import 'package:flutter/material.dart';

class AllConfirmaitonsRequestPageModel
    extends FlutterFlowModel<AllConfirmaitonsRequestPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? receiverUser;
  // Stores action output result for [Custom Action - getOrCreateMessage] action in Button widget.
  MessageRecord? confirmationMessage;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  AllConfirmationsRecord? allConfirmation;
  // Stores action output result for [Backend Call - SQLite (getConversationWithLastMessage)] action in Button widget.
  List<GetConversationWithLastMessageRow>? conversationId;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
