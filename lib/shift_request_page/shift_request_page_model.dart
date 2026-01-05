import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'shift_request_page_widget.dart' show ShiftRequestPageWidget;
import 'package:flutter/material.dart';

class ShiftRequestPageModel extends FlutterFlowModel<ShiftRequestPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Mesai Saati is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompaniesRecord? companyDetail;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyWorkersRecord? companyWorker;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WorkerShiftsRecord? shiftRequest;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
