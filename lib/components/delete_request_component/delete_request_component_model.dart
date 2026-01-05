import '/flutter_flow/flutter_flow_util.dart';
import 'delete_request_component_widget.dart' show DeleteRequestComponentWidget;
import 'package:flutter/material.dart';

class DeleteRequestComponentModel
    extends FlutterFlowModel<DeleteRequestComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
