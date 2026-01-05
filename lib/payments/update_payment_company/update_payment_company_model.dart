import '/flutter_flow/flutter_flow_util.dart';
import 'update_payment_company_widget.dart' show UpdatePaymentCompanyWidget;
import 'package:flutter/material.dart';

class UpdatePaymentCompanyModel
    extends FlutterFlowModel<UpdatePaymentCompanyWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
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
    textFieldContentFocusNode?.dispose();
    textFieldContentTextController?.dispose();
  }
}
