import '/flutter_flow/flutter_flow_util.dart';
import 'options_update_income_plan_name_widget.dart'
    show OptionsUpdateIncomePlanNameWidget;
import 'package:flutter/material.dart';

class OptionsUpdateIncomePlanNameModel
    extends FlutterFlowModel<OptionsUpdateIncomePlanNameWidget> {
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
