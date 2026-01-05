import '/flutter_flow/flutter_flow_util.dart';
import 'options_update_financial_item_content_widget.dart'
    show OptionsUpdateFinancialItemContentWidget;
import 'package:flutter/material.dart';

class OptionsUpdateFinancialItemContentModel
    extends FlutterFlowModel<OptionsUpdateFinancialItemContentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for inputItemContent widget.
  FocusNode? inputItemContentFocusNode;
  TextEditingController? inputItemContentTextController;
  String? Function(BuildContext, String?)?
      inputItemContentTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputItemContentFocusNode?.dispose();
    inputItemContentTextController?.dispose();
  }
}
