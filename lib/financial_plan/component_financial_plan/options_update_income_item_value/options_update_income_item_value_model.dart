import '/flutter_flow/flutter_flow_util.dart';
import 'options_update_income_item_value_widget.dart'
    show OptionsUpdateIncomeItemValueWidget;
import 'package:flutter/material.dart';

class OptionsUpdateIncomeItemValueModel
    extends FlutterFlowModel<OptionsUpdateIncomeItemValueWidget> {
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
