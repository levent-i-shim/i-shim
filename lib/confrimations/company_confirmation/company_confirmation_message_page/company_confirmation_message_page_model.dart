import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/schema/enums/enums.dart';
import '/components/attachments_message_component/attachments_message_component_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'company_confirmation_message_page_widget.dart'
    show CompanyConfirmationMessagePageWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

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
