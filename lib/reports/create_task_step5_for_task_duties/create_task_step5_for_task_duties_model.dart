import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'create_task_step5_for_task_duties_widget.dart'
    show CreateTaskStep5ForTaskDutiesWidget;
import 'package:flutter/material.dart';

class CreateTaskStep5ForTaskDutiesModel
    extends FlutterFlowModel<CreateTaskStep5ForTaskDutiesWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Görev Adını Giriniz is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DutiesForWorkPlaceRecord? dutiesForWorkPlace;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DutiesForCompanyRecord? dutiesForCompany;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompaniesRecord? companyDetail;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
