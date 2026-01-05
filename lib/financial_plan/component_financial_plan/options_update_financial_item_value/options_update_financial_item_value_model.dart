import '/flutter_flow/flutter_flow_util.dart';
import 'options_update_financial_item_value_widget.dart'
    show OptionsUpdateFinancialItemValueWidget;
import 'package:flutter/material.dart';

class OptionsUpdateFinancialItemValueModel
    extends FlutterFlowModel<OptionsUpdateFinancialItemValueWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for inputItemValue widget.
  FocusNode? inputItemValueFocusNode;
  TextEditingController? inputItemValueTextController;
  String? Function(BuildContext, String?)?
      inputItemValueTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputItemValueFocusNode?.dispose();
    inputItemValueTextController?.dispose();
  }
}
