import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'match_current_account_page_widget.dart'
    show MatchCurrentAccountPageWidget;
import 'package:flutter/material.dart';

class MatchCurrentAccountPageModel
    extends FlutterFlowModel<MatchCurrentAccountPageWidget> {
  ///  Local state fields for this page.

  bool company = false;

  bool user = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for sideTwoType widget.
  String? sideTwoTypeValue;
  FormFieldController<String>? sideTwoTypeValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  List<UsersRecord> simpleSearchResults1 = [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  List<CompaniesRecord> simpleSearchResults2 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
