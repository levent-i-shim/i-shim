import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_new_note_important_page_widget.dart'
    show AddNewNoteImportantPageWidget;
import 'package:flutter/material.dart';

class AddNewNoteImportantPageModel
    extends FlutterFlowModel<AddNewNoteImportantPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldTitle widget.
  FocusNode? textFieldTitleFocusNode;
  TextEditingController? textFieldTitleTextController;
  String? Function(BuildContext, String?)?
      textFieldTitleTextControllerValidator;
  // State field(s) for TextFieldContent widget.
  FocusNode? textFieldContentFocusNode;
  TextEditingController? textFieldContentTextController;
  String? Function(BuildContext, String?)?
      textFieldContentTextControllerValidator;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ImportantNotesRecord? addedNote;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldTitleFocusNode?.dispose();
    textFieldTitleTextController?.dispose();

    textFieldContentFocusNode?.dispose();
    textFieldContentTextController?.dispose();
  }
}
