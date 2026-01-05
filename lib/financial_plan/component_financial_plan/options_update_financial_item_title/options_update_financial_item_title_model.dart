import '/flutter_flow/flutter_flow_util.dart';
import 'options_update_financial_item_title_widget.dart'
    show OptionsUpdateFinancialItemTitleWidget;
import 'package:flutter/material.dart';

class OptionsUpdateFinancialItemTitleModel
    extends FlutterFlowModel<OptionsUpdateFinancialItemTitleWidget> {
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
