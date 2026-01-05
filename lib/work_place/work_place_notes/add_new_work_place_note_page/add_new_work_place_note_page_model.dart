import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_new_work_place_note_page_widget.dart'
    show AddNewWorkPlaceNotePageWidget;
import 'package:flutter/material.dart';

class AddNewWorkPlaceNotePageModel
    extends FlutterFlowModel<AddNewWorkPlaceNotePageWidget> {
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
  WorkPlaceNotesRecord? addedNote;

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
