import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'workplace_confirmation_message_page_widget.dart'
    show WorkplaceConfirmationMessagePageWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class WorkplaceConfirmationMessagePageModel
    extends FlutterFlowModel<WorkplaceConfirmationMessagePageWidget> {
  ///  Local state fields for this page.

  DocumentReference? receiverRef;

  bool selectedImage = false;

  bool selectedPdf = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  List<WorkplaceConfirmationMessageRecord>? listViewPreviousSnapshot;
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
