import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'message_page_widget.dart' show MessagePageWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

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
