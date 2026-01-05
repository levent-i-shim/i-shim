import '/flutter_flow/flutter_flow_util.dart';
import 'options_update_income_item_title_widget.dart'
    show OptionsUpdateIncomeItemTitleWidget;
import 'package:flutter/material.dart';

class OptionsUpdateIncomeItemTitleModel
    extends FlutterFlowModel<OptionsUpdateIncomeItemTitleWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for inputItemTitle widget.
  FocusNode? inputItemTitleFocusNode;
  TextEditingController? inputItemTitleTextController;
  String? Function(BuildContext, String?)?
      inputItemTitleTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputItemTitleFocusNode?.dispose();
    inputItemTitleTextController?.dispose();
  }
}
