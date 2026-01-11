import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'message_page_widget.dart' show MessagePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class MessagePageModel extends FlutterFlowModel<MessagePageWidget> {
  ///  Local state fields for this page.

  List<ConfirmationMessagesRecord> messages = [];
  void addToMessages(ConfirmationMessagesRecord item) => messages.add(item);
  void removeFromMessages(ConfirmationMessagesRecord item) =>
      messages.remove(item);
  void removeAtIndexFromMessages(int index) => messages.removeAt(index);
  void insertAtIndexInMessages(int index, ConfirmationMessagesRecord item) =>
      messages.insert(index, item);
  void updateMessagesAtIndex(
          int index, Function(ConfirmationMessagesRecord) updateFn) =>
      messages[index] = updateFn(messages[index]);

  DocumentReference? receiverRef;

  String? messageField = '';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - getUserName] action in MessagePage widget.
  String? userName;
  // Stores action output result for [Firestore Query - Query a collection] action in MessagePage widget.
  List<ConfirmationMessagesRecord>? getMessages;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Validate Form] action in IconButton widget.
  bool? validate;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ConfirmationMessagesRecord? sendedMessage;
  AudioPlayer? soundPlayer;
  // Stores action output result for [Backend Call - Read Document] action in IconButton widget.
  UsersRecord? receiverDetail;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    listViewController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
