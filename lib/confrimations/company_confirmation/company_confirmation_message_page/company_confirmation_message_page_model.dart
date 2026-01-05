import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'company_confirmation_message_page_widget.dart'
    show CompanyConfirmationMessagePageWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class CompanyConfirmationMessagePageModel
    extends FlutterFlowModel<CompanyConfirmationMessagePageWidget> {
  ///  Local state fields for this page.

  List<CompanyConfirmationMessagesRecord> companyConfirmationsMessages = [];
  void addToCompanyConfirmationsMessages(
          CompanyConfirmationMessagesRecord item) =>
      companyConfirmationsMessages.add(item);
  void removeFromCompanyConfirmationsMessages(
          CompanyConfirmationMessagesRecord item) =>
      companyConfirmationsMessages.remove(item);
  void removeAtIndexFromCompanyConfirmationsMessages(int index) =>
      companyConfirmationsMessages.removeAt(index);
  void insertAtIndexInCompanyConfirmationsMessages(
          int index, CompanyConfirmationMessagesRecord item) =>
      companyConfirmationsMessages.insert(index, item);
  void updateCompanyConfirmationsMessagesAtIndex(
          int index, Function(CompanyConfirmationMessagesRecord) updateFn) =>
      companyConfirmationsMessages[index] =
          updateFn(companyConfirmationsMessages[index]);

  DocumentReference? receiverRef;

  bool selectedImage = false;

  bool selectedPdf = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  List<CompanyConfirmationMessagesRecord>? listViewPreviousSnapshot;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Icon widget.
  String? returnValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Mesajınızı Giriniz is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  AudioPlayer? soundPlayer;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    listViewController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
