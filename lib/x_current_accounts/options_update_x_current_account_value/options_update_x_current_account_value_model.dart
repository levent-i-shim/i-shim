import '/flutter_flow/flutter_flow_util.dart';
import 'options_update_x_current_account_value_widget.dart'
    show OptionsUpdateXCurrentAccountValueWidget;
import 'package:flutter/material.dart';

class OptionsUpdateXCurrentAccountValueModel
    extends FlutterFlowModel<OptionsUpdateXCurrentAccountValueWidget> {
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
