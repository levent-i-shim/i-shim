import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_financial_plan_authorize_to_monitor_widget.dart'
    show AddFinancialPlanAuthorizeToMonitorWidget;
import 'package:flutter/material.dart';

class AddFinancialPlanAuthorizeToMonitorModel
    extends FlutterFlowModel<AddFinancialPlanAuthorizeToMonitorWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  List<UsersRecord> simpleSearchResults1 = [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  List<UsersRecord> simpleSearchResults2 = [];

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
