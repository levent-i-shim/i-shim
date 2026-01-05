import '/flutter_flow/flutter_flow_util.dart';
import 'options_update_invested_money_title_widget.dart'
    show OptionsUpdateInvestedMoneyTitleWidget;
import 'package:flutter/material.dart';

class OptionsUpdateInvestedMoneyTitleModel
    extends FlutterFlowModel<OptionsUpdateInvestedMoneyTitleWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for investmentTitle widget.
  FocusNode? investmentTitleFocusNode;
  TextEditingController? investmentTitleTextController;
  String? Function(BuildContext, String?)?
      investmentTitleTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    investmentTitleFocusNode?.dispose();
    investmentTitleTextController?.dispose();
  }
}
