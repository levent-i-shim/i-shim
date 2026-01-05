import '/flutter_flow/flutter_flow_util.dart';
import 'update_note_diary_page_widget.dart' show UpdateNoteDiaryPageWidget;
import 'package:flutter/material.dart';

class UpdateNoteDiaryPageModel
    extends FlutterFlowModel<UpdateNoteDiaryPageWidget> {
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
