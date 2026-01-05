import '/flutter_flow/flutter_flow_util.dart';
import 'add_robot_work_place_worker_widget.dart'
    show AddRobotWorkPlaceWorkerWidget;
import 'package:flutter/material.dart';

class AddRobotWorkPlaceWorkerModel
    extends FlutterFlowModel<AddRobotWorkPlaceWorkerWidget> {
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
