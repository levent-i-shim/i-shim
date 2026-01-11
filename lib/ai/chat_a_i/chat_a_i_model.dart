import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/attachments_message_component/attachments_message_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'chat_a_i_widget.dart' show ChatAIWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatAIModel extends FlutterFlowModel<ChatAIWidget> {
  ///  Local state fields for this page.

  bool selectedImage = false;

  bool selectedPdf = false;

  List<AiMessagesRecord> aiChatMessages = [];
  void addToAiChatMessages(AiMessagesRecord item) => aiChatMessages.add(item);
  void removeFromAiChatMessages(AiMessagesRecord item) =>
      aiChatMessages.remove(item);
  void removeAtIndexFromAiChatMessages(int index) =>
      aiChatMessages.removeAt(index);
  void insertAtIndexInAiChatMessages(int index, AiMessagesRecord item) =>
      aiChatMessages.insert(index, item);
  void updateAiChatMessagesAtIndex(
          int index, Function(AiMessagesRecord) updateFn) =>
      aiChatMessages[index] = updateFn(aiChatMessages[index]);

  DocumentReference? aiChatRef;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Icon widget.
  String? returnValue;
  // State field(s) for promptInput widget.
  FocusNode? promptInputFocusNode;
  TextEditingController? promptInputTextController;
  String? Function(BuildContext, String?)? promptInputTextControllerValidator;
  String? _promptInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Mesajınızı Giriniz is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  AiMessagesRecord? ongoingAiChatNewAiMessage;
  // Stores action output result for [Custom Action - getMessageFromAi] action in IconButton widget.
  String? response;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  AiMessagesRecord? ongoingAiChatAssistantDoc;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  AiChatsRecord? newChatDoc;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  AiMessagesRecord? newAiChatNewAiMessage;
  // Stores action output result for [Custom Action - getMessageFromAi] action in IconButton widget.
  String? response2;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  AiMessagesRecord? newAiChatAssistantDoc;

  @override
  void initState(BuildContext context) {
    promptInputTextControllerValidator = _promptInputTextControllerValidator;
  }

  @override
  void dispose() {
    promptInputFocusNode?.dispose();
    promptInputTextController?.dispose();
  }
}
