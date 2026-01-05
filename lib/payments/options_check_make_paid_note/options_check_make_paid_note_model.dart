import '/flutter_flow/flutter_flow_util.dart';
import 'options_check_make_paid_note_widget.dart'
    show OptionsCheckMakePaidNoteWidget;
import 'package:flutter/material.dart';

class OptionsCheckMakePaidNoteModel
    extends FlutterFlowModel<OptionsCheckMakePaidNoteWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for inputPaymentNote widget.
  FocusNode? inputPaymentNoteFocusNode;
  TextEditingController? inputPaymentNoteTextController;
  String? Function(BuildContext, String?)?
      inputPaymentNoteTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputPaymentNoteFocusNode?.dispose();
    inputPaymentNoteTextController?.dispose();
  }
}
