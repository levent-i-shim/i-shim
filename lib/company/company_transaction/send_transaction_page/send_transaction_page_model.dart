import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'send_transaction_page_widget.dart' show SendTransactionPageWidget;
import 'package:flutter/material.dart';

class SendTransactionPageModel
    extends FlutterFlowModel<SendTransactionPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? userRef;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  WorkPlaceReportsRecord? workPlaceReports;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WorkPlaceTransactionRecord? transactionWorkPlace;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompanyTransactionsRecord? transaction;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }
}
